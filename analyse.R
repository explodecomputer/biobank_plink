library(dplyr)
library(lubridate)

a <- read.table("times.txt", sep=",", stringsAsFactors=FALSE)
a$time <- ymd_hms(as.POSIXct(strptime(a$V3, "%a %b %e %T %Y")))

b <- group_by(a, V1) %>% dplyr::summarise(hrs = (time[1] %--% time[2]) / dhours(1)) %>% as.data.frame()
b$len <- scan("lengths.txt", numeric())

plot(hrs ~ len, b)

cor(b$hrs, b$len)
lm(hrs ~ len, b)
sum(b$hrs) / 28
