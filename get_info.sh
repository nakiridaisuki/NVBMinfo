SIF_DIR=./sifs
INFO_DIR=./infos

sifs=$(ls -1 $SIF_DIR)

for sif in $sifs; do
    singularity run $sif