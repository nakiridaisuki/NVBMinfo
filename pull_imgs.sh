#!/bin/bash
set -e

VERSIONS=$(cat all_versions)
SIF_DIR=./tmp/sifs

if [ ! -d "$SIF_DIR" ]; then
    mkdir -vp "$SIF_DIR"
fi

echo "Start processing"

for version in $VERSIONS; do
    echo "--------------------------------------------------"
    echo ">> Processing Version: $version"

    SIF_FILE="hpc-benchmarks:${version}.sif"
    DOCKER_URI="docker://nvcr.io/nvidia/hpc-benchmarks:${version}"

    echo "Pulling singularity image"
    singularity pull --dir $SIF_DIR $SIF_FILE $DOCKER_URI
    echo -e "Pull success: $SIF_FILE\n"
done

echo "--------------------------------------------------"
echo "All version pulled"
