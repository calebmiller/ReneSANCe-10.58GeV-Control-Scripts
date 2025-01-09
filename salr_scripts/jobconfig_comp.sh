#!/bin/bash
#SBATCH --time=3:00:00
#SBATCH --account=def-roney

source /home/cmiller/projects/def-roney/cmiller/Renev1.3.4/install/bin/renesance-init.sh
cd $SLURM_TMPDIR
renesance -f /home/cmiller/projects/def-roney/cmiller/Renev1.3.4/run/index.conf -s $ALR$SEED -D alr:$ALR -D thetacut:$TCUT >> /scratch/cmiller/Results/${ALR}_${SEED}_${TVAL}.log
