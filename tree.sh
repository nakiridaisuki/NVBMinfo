#!/bin/bash
set -e

INFO_DIR=./datas/tree
WORKSPACE_DIR=./tmp/workspaces

workspaces=$(ls -1 $WORKSPACE_DIR)

for ws in $workspaces; do
    mkdir -vp $INFO_DIR
    tree $WORKSPACE_DIR/$ws > $INFO_DIR/$ws
done
