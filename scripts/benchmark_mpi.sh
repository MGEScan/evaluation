#!/bin/bash

BASE="/scratch/"
pool="dmelanogaster dpulex cintestinalis spurpuratus"
num_try="2 4"
program="both" # nonltr or ltr
version="mpi"

base_genome="$BASE""$USER/eukaryotes/"
base_output="$BASE""$USER/test-results/$version/$program/"
base_perf="$BASE""$USER/perf-results/"

for source in $pool
do
	for i in `seq $num_try`
	do
		extra="--mpi=$i"
		echo perf stat python cmd.py $program $base_genome$source"/" --output=$base_output${source}.$i"/ " $extra " &>" "${base_perf}${version}.${program}.${source}.$i"
		perf stat python cmd.py $program $base_genome$source"/" --output="$base_output${source}.$i/ " $extra  &> "${base_perf}${version}.${program}.${source}.$i"
	done
done

