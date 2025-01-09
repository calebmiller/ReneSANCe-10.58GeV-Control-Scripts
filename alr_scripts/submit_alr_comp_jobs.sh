#!/bin/bash

for ((x=0; x<=19; x++)) #theta steps
do
	for y in {3..4} #ALR 3,4
	do
		ctdown=$(echo "scale=1;($x-10) / 10.0 " | bc |  awk '{printf "%.1f", $0}') #convert x into theta value from -1 to +0.95
		ctup=$(echo "scale=1; ($x-9) / 10.0" | bc |  awk '{printf "%.1f", $0}') #convert x into theta value from -0.95 to +1
		sbatch --output=logs/comp$x$y.log --export=SEED=8569${x},ALR=${y},CTCUT_PMIN=-0.99,CTCUT_PMAX=0.99,CTCUT_NMIN=$ctdown,CTCUT_NMAX=$ctup jobconfig_sweep.sh
	done
done
