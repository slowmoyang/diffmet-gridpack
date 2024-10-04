#!/usr/bin/env bash
source ./utils.sh

NAME=${1}
assert_var_defined NAME

OUTPUT_DIR=/store/hep/users/slowmoyang/KSC-RnD-2024/gridpack/
assert_dir_exists OUTPUT_DIR

cd genproductions/bin/MadGraph5_aMCatNLO/

CARD_DIR=../../../data/${NAME}
assert_dir_exists CARD_DIR

NB_CORE=40 ./gridpack_generation.sh ${NAME} ${CARD_DIR}

TARBALL_FILE=${NAME}_el8_amd64_gcc10_CMSSW_12_4_8_tarball.tar.xz
LOG_FILE=${NAME}.log

assert_file_exists TARBALL_FILE
assert_file_exists LOG_FILE

rsync --progress ${LOG_FILE} ${OUTPUT_DIR}
rsync --progress ${TARBALL_FILE} ${OUTPUT_DIR}
