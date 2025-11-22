SIF_DIR=$HOME/sifs
INFO_DIR=./trees
WORKSPACE_DIR=$HOME/workspaces

sifs=$(ls -1 $SIF_DIR)

for sif in $sifs; do
    file_id=${sif:15:-4}
    singularity run $sif cp /workspace/* $WORKSPACE_DIR/$file_id
    tree $WORKSPACE_DIR/$file_id > $INFO_DIR/$file_id