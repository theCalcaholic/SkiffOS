#!/bin/bash

set -eo pipefail

OUTPUT_DIR=${SKIFF_BUILDROOT_DIR}/output
TARGET_DIR=${OUTPUT_DIR}/target
IMAGES_DIR=${OUTPUT_DIR}/images
MODULES_DIR=${OUTPUT_DIR}/extra_images/modules
ROOTFS_DIR=${IMAGES_DIR}/rootfs
MODULES_IMG=${ROOTFS_DIR}/modules.squashfs

if [ -f ${MODULES_IMG} ]; then
  rm ${MODULES_IMG}
fi

mkdir -p ${MODULES_DIR} ${ROOTFS_DIR} ${IMAGES_DIR}
rsync -rv --remove-source-files ${TARGET_DIR}/usr/lib/modules/ ${MODULES_DIR}/
mksquashfs ${MODULES_DIR} ${MODULES_IMG}
