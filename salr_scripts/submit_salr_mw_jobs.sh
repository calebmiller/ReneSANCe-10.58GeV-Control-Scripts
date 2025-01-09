for x in {1..9} #1..9
do
	for y in {3..4} #ALR 3,4
	do
		for m in {317,329,341,353,365,377,389,401,413,425,437}
		do
			sbatch --output=logs/mw$x$y$m.log --export=SEED=9812${x},CTCUT=0.${x},ALR=${y},CTVAL=${x},MASS=${m} jobconfig_mw.sh
		done
	done
done
