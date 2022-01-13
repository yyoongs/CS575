#!/bin/bash
#SBATCH -J Autocorrelation
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH -N 8 # number of nodes
#SBATCH -n 8 # number of tasks
#SBATCH -o Autocorrelation.out
#SBATCH -e Autocorrelation.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=choyongs@oregonstate.edu
module load openmpi
mpic++ Autocorrelation.cpp -o prog -lm
mpiexec -mca btl self,tcp -np 4 prog