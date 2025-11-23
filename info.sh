#!/bin/bash
set -e

SIF_DIR=./tmp/sifs
sif_path=$(find $SIF_DIR -name $(tail -n 1 ./all_versions))

./copy_workspace.sh
./tree.sh
singularity run $sif_path ~/NVBMinfo/dump.sh