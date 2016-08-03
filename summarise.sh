#!/bin/bash

grep time test*.log | sed 's/: /:/g' | sed 's/test//g' | sed 's/.log//g' | sed 's/ time//g' | sed 's/Aug /Aug/g' | sed 's/:Start:/,Start,/g' | sed 's/:End:/,End,/g' > times.txt

grep ADD test*linear | wc -l

for i in {01..22}; do
	grep ADD test${i}.assoc.linear | wc -l
done > lengths.txt

