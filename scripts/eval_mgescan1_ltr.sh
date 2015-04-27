#!/bin/bash

DATASET="dmelanogaster dpulex cintestinalis spurpuratus"
for i in $DATASET
do
	echo $i
	cd ~/retrotminer/MGEScan_LTR
	ln -sf /scratch/lee212/eukaryotes/$i/ example/genome
	ln -sf /scratch/lee212/test-results/mgescan1/ltr/$i/ output
	echo ln -sf /scratch/lee212/test-results/mgescan1/ltr/$i/ output
	perl pre_process.pl
	echo perl pre_process.pl
	perf stat perl find_ltr.pl &> /scratch/lee212/perf-results/mgescan1.ltr.$i.1
	rm example/genome
	rm output
done
