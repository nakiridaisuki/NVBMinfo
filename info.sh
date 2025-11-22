#!/bin/bash
set -e
SIF_DIR=$HOME/sifs
sifs=$(ls -1 $SIF_DIR)

for sif in $sifs; do
    file_id=${sif:15:-4}
    ./get_tree.sh
    singularity run $SIF_DIR/$sif ~/NVBMinfo/get_exec.sh $file_id
done
singularity run $SIF_DIR/${sifs[-1]} ~/NVBMinfo/extract.sh