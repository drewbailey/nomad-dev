#!/bin/sh

if [ ! -f ${NOMAD_ALLOC_DIR}/deploy_1 ]; then touch ${NOMAD_ALLOC_DIR}/deploy_1; exit 1; fi
if [ ! -f ${NOMAD_ALLOC_DIR}/deploy_2 ]; then touch ${NOMAD_ALLOC_DIR}/deploy_2; exit 1; fi
if [ ! -f ${NOMAD_ALLOC_DIR}/deploy_3 ]; then touch ${NOMAD_ALLOC_DIR}/deploy_3; exit 1; fi
if [ ! -f ${NOMAD_ALLOC_DIR}/deploy_4 ]; then touch ${NOMAD_ALLOC_DIR}/deploy_4; exit 1; fi
if [ ! -f ${NOMAD_ALLOC_DIR}/deploy_5 ]; then touch ${NOMAD_ALLOC_DIR}/deploy_5; exit 1; fi
if [ ! -f ${NOMAD_ALLOC_DIR}/deploy_6 ]; then touch ${NOMAD_ALLOC_DIR}/deploy_6; exit 1; fi
if [ ! -f ${NOMAD_ALLOC_DIR}/deploy_7 ]; then touch ${NOMAD_ALLOC_DIR}/deploy_7; exit 1; fi
if [ ! -f ${NOMAD_ALLOC_DIR}/deploy_8 ]; then touch ${NOMAD_ALLOC_DIR}/deploy_8; exit 1; fi
if [ ! -f ${NOMAD_ALLOC_DIR}/deploy_9 ]; then touch ${NOMAD_ALLOC_DIR}/deploy_9; fi


if [ -f ${NOMAD_ALLOC_DIR}/deploy_9 ]; then exit 0; fi
sleep 2; echo 'check something that warns'; exit 0;
