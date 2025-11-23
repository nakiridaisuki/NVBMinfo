#!/bin/bash
set -e

INFO_DIR=$HOME/NVBMinfo/datas
WORKSPACE_DIR=$HOME/NVBMinfo/tmp/workspaces
EXEC_IDs=$(ls -1 $WORKSPACE_DIR)
TYPES=$(cat $HOME/NVBMinfo/all_types)

for type in $TYPES; do
    echo $type
    for id in $EXEC_IDs; do
        exec_path=$(find $WORKSPACE_DIR/$id -name *$type*)
        echo $exec_path
        if ! [[ -z $exec_path ]]; then
            mkdir -vp $INFO_DIR/$type
            cuobjdump -lelf $exec_path | tee $INFO_DIR/$type/$id
        fi
    done
done
