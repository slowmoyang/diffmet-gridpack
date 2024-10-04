#!/usr/bin/env bash
source ./utils.sh

NAME=${1}
assert_var_defined NAME

CONTAINER=/cvmfs/unpacked.cern.ch/registry.hub.docker.com/cmssw/el8:x86_64

singularity run -B /cvmfs -B /store ${CONTAINER} \
    bash ./generate.sh ${NAME}
