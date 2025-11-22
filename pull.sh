#!/bin/bash

# all nvidia benchmark versions
VERSIONS=("20.10-hpl" "21.4-hpl" "23.3" "23.5" "23.10" "24.03" "24.06" "24.09" "25.02" "25.04" "25.09")
SIF_DIR="$HOME/sifs"

set -e

if [ ! -d "$DEST_DIR" ]; then
    echo "Making directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
fi

echo "Start processing"

# go through all versions
for version in "${VERSIONS[@]}"; do
    echo "--------------------------------------------------"
    echo ">> Processing Version: $version"

    SIF_FILE="${SIF_DIR}/hpc-benchmarks:${version}.sif"
    DOCKER_URI="docker://nvcr.io/nvidia/hpc-benchmarks:${version}"

    echo "Step 1: Pulling singularity image"
    singularity pull "${SIF_FILE##*/}" "$DOCKER_URI"
    echo "Pull success: $SIF_FILE"
    echo ""

    echo ">> Version $version pulled"
done

echo "--------------------------------------------------"
echo "All version pulled"
