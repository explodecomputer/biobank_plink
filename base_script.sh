#!/bin/bash
i=$1

plink1.90 --bfile /panfs/panasas01/shared-biobank/data/bestguess/data_chr${i} \
	--pheno phen.txt \
	--maf 0.01 \
	--mpheno 1 \
	--allow-no-sex \
	--covar /panfs/panasas01/shared-biobank/data/derived/principal_components/data.txt \
	--linear \
	--out test${i}

