%Chk=lig-opt-charge.chk
%mem=6500MB
%nprocs=4
%lindaworkers=localhost
#B3LYP/6-31g* pop=mk iop(6/50=1)

Charge calculation using the OPTIMIZED structure of the ligand

0 1
#PASTE THE COORDINATES HERE

lig-opt-charge.gesp

