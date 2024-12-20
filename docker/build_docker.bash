#!/bin/bash
# =============================================================================
# Unitree Go1 Simulation Docker Image Builder
# Created by: Shaun Altmann
#
# Used to build the docker image with the required settings.
# =============================================================================


# =============================================================================
# Get Script Directory
# =============================================================================
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


# =============================================================================
# Build the Docker Image
# =============================================================================
docker build \
    --progress=plain \
    -t go1-sim-webots \
    $SCRIPT_DIR/.


# =============================================================================
# End of File
# =============================================================================
