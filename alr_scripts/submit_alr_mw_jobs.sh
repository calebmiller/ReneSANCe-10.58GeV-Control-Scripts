for ((x=1; x<=38; x++)) #costheta steps
do
	for y in {3..4} #ALR 3,4
	do
		for m in {317,341,365,377,389,413,437} #W boson mass steps 80.xxx
		do
			ctdown=$(echo "scale=3;($x-20) / 20.0 " | bc |  awk '{printf "%.2f", $0}')
			ctup=$(echo "scale=3; ($x-19) / 20.0" | bc |  awk '{printf "%.2f", $0}')
			sbatch --output=logs/alr_mw$x$y$m.log --export=SEED=2186${x},ALR=${y},CTCUT_PMIN=-0.9,CTCUT_PMAX=0.9,CTCUT_NMIN=$ctdown,CTCUT_NMAX=$ctup,MASS=${m} jobconfig_mw.sh
		done
	done
done
