#!/usr/bin/env bash
echo "SRC :${SRC_PROVIDER}:${SRC_BUCKET}//${FILE_NAME} "
echo "DEST: ${DEST_PROVIDER}:${DEST_BUCKET}//${FILE_NAME}"
$BIN_DIR/rclone copy -v \
    ${SRC_PROVIDER}:${SRC_BUCKET}/${FILE_NAME} \
    ${DEST_PROVIDER}:${DEST_BUCKET}
