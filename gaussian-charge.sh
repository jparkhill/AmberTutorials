#!/bin/csh

#$ -N lig-charge
#$ -pe smp 4
#$ -M YOUR_EMAIL_ADDRESS
#$ -m aeb
#$ -r n

module load gaussian

g09 lig-opt-charge.com
