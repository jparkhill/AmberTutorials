#!/bin/csh
#$ -pe smp 16
#$ -N MD
#$ -M YOUR_EMAIL_ADDRESS
#$ -m abe
#$ -r n
#$ -q long

module load amber

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/1-mini-water.in -o 1-mini-water.out -c protein-lig-ions-solv.inpcrd -p protein-lig-ions-solv.prmtop -r 1-mini-water.rst -ref protein-lig-ions-solv.inpcrd -x 1-mini-water.mdcrd

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/2-mini-hydrogen.in -o 2-mini-hydrogen.out -c 1-mini-water.rst -p protein-lig-ions-solv.prmtop -r 2-mini-hydrogen.rst -ref 1-mini-water.rst -x 2-mini-hydrogen.mdcrd

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/3-mini-alphaC.in -o 3-mini-alphaC.out -c 2-mini-hydrogen.rst -p protein-lig-ions-solv.prmtop -r 3-mini-alphaC.rst -ref 2-mini-hydrogen.rst -x 3-mini-alphaC.mdcrd

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/4-mini-all.in -o 4-mini-all.out -c 3-mini-alphaC.rst -p protein-lig-ions-solv.prmtop -r 4-mini-all.rst -x 4-mini-all.mdcrd

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/5-heating-50.in -o 5-heating-50.out -c 4-mini-all.rst -p protein-lig-ions-solv.prmtop -r 5-heating-50.rst -x 5-heating.mdcrd -ref 4-mini-all.rst

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/5-heating-100.in -o 5-heating-100.out -c 5-heating-50.rst -p protein-lig-ions-solv.prmtop -r 5-heating-100.rst -x 5-heating-100.mdcrd -ref 5-heating-50.rst

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/5-heating-150.in -o 5-heating-150.out -c 5-heating-100.rst -p protein-lig-ions-solv.prmtop -r 5-heating-150.rst -x 5-heating-150.mdcrd -ref 5-heating-100.rst

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/5-heating-200.in -o 5-heating-200.out -c 5-heating-150.rst -p protein-lig-ions-solv.prmtop -r 5-heating-200.rst -x 5-heating-200.mdcrd -ref 5-heating-150.rst

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/5-heating-250.in -o 5-heating-250.out -c 5-heating-200.rst -p protein-lig-ions-solv.prmtop -r 5-heating-250.rst -x 5-heating-250.mdcrd -ref 5-heating-200.rst

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/5-heating-300.in -o 5-heating-300.out -c 5-heating-250.rst -p protein-lig-ions-solv.prmtop -r 5-heating-300.rst -x 5-heating-300.mdcrd -ref 5-heating-250.rst

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/5-heating-300-stay.in -o 5-heating-300-stay.out -c 5-heating-300.rst -p protein-lig-ions-solv.prmtop -r 5-heating-300-stay.rst -x 5-heating-300-stay.mdcrd -ref 5-heating-300.rst

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/6-NVT.in -o 6-NVT.out -c 5-heating-300-stay.rst -p protein-lig-ions-solv.prmtop -r 6-NVT.rst -x 6-NVT.mdcrd 

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/7-NPT.in -o 7-NPT.out -c 6-NVT.rst -p protein-lig-ions-solv.prmtop -r 7-NPT.rst -x 7-NPT.mdcrd

mpirun -np $NSLOTS $AMBERHOME/bin/pmemd.MPI -O -i eqscripts/production.in -o production.out -c 7-NPT.rst -p protein-lig-ions-solv.prmtop -r production.rst -x production.mdcrd 








