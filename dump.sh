#!/bin/bash
set -e

INFO_DIR=$HOME/NVBMinfo/datas
WORKSPACE_DIR=$HOME/NVBMinfo/workspaces
EXEC_IDs=$(ls -1 $WORKSPACE_DIR)
TYPES=$(cat $HOME/NVBMinfo/all_types)

for type in $TYPES; do
    for id in $FILE_IDs; do
        exec_path=$(find $WORKSPACE_DIR/$id -name $type)
        mkdir -vp $INFO_DIR/$type/$id
        cuobjdump -lelf $exec_path | tee $INFO_DIR/$type/$id
    done
done