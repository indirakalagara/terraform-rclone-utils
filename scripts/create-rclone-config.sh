#!/usr/bin/env bash

echo "TYPE = ${TYPE}"


$BIN_DIR/rclone config create \
    ${NAME} \
    ${TYPE} \
    provider=${STORAGE_PROVIDER} \
    env_auth=${ENV_AUTH} \
    region=${REGION} \
    access_key_id=${ACCESS_KEY_ID} \
    secret_access_key=${SECRET_ACCESS_KEY} \
    endpoint=${ENDPOINT} 