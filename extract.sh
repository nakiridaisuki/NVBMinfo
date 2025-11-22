#!/bin/bash

INFO_DIR=./datas
EXEC_DIR=$HOME/execs
FILE_IDs=$(ls -1 $EXEC_DIR)

for id in $FILE_IDs; do
    exec_path=$EXEC_DIR/$id
    execs=$(ls -1 $exec_path)
    for exec in $execs; do
        cuobjdump -lelf $exec_path/$exec | tee -a $INFO_DIR/$id/$exec
    done
done