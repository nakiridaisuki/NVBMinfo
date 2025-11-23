#!/bin/bash
set -e

SIF_DIR=./tmp/sifs
WORKSPACE_DIR=./tmp/workspaces
sifs=$(ls -1 $SIF_DIR)

for sif in $sifs; do
    file_id=${sif:15:-4}
    mkdir -p $WORKSPACE_DIR/$file_id
    singularity run $SIF_DIR/$sif cp -r /workspace/ $WORKSPACE_DIR/$file_id
done
