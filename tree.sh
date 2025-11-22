set -e
SIF_DIR=$HOME/sifs
INFO_DIR=./trees
WORKSPACE_DIR=$HOME/workspaces

sifs=$(ls -1 $SIF_DIR)

for sif in $sifs; do
    file_id=${sif:15:-4}
    mkdir -p $WORKSPACE_DIR/$file_id
    mkdir -p $INFO_DIR
    singularity run $SIF_DIR/$sif cp -r /workspace $WORKSPACE_DIR/$file_id
    tree $WORKSPACE_DIR/$file_id > $INFO_DIR/$file_id
done
