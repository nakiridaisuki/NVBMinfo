#!/bin/bash
set -e

EXEC_PATH=$HOME/execs/$1
EXEC_TYPES=("xhpl" "xhpcg" "xhpl_mxp")

if ! [[ -e $EXEC_PATH ]]; then
    echo "mkdir -p $EXEC_PATH"
    mkdir -p $EXEC_PATH
fi

for type in ${EXEC_TYPES[@]}; do
    path=$(find /workspace -name $type)
    echo $path
    if ! [[ -z $path ]]; then
        cp $path $EXEC_PATH/$type
    fi
done
