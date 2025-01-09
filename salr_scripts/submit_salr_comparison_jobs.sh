for x in {1..9} #costheta in steps of 0.x
do
	for y in {3..4} #ALR 3,4
	do
		tval=$(( x*10 - 5 )) #convert costheta steps to theta steps
		sbatch --output=logs/comp$x$y.log --export=SEED=8569${x},TCUT=$tval,ALR=${y},TVAL=$tval jobconfig_comp.sh
	done
done
