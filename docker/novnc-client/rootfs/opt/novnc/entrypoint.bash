#!/bin/bash

set -euo pipefail

LAUNCH_ARGS=""

set +u
if [ "${ENV_VNC_CERT}" != "" ] ;
then
  LAUNCH_ARGS="${LAUNCH_ARGS}--cert ${ENV_VNC_CERT} "
fi
if [ "${ENV_VNC_KEY}" != "" ] ;
then
  LAUNCH_ARGS="${LAUNCH_ARGS}--key ${ENV_VNC_KEY} "
fi
if [ "${ENV_SSL_ONLY}" = "1" ] || [ "${ENV_SSL_ONLY,,}" = "true" ];
then
  LAUNCH_ARGS="${LAUNCH_ARGS}--ssl-only "
fi
if [ "${ENV_WEB_PORT}" != "" ] ;
then
  LAUNCH_ARGS="${LAUNCH_ARGS}--listen ${ENV_WEB_PORT} "
fi
if [ "${ENV_VNC_HOST}" != "" ] && [ "${ENV_VNC_PORT}" != "" ] ;
then
  LAUNCH_ARGS="${LAUNCH_ARGS}--vnc ${ENV_VNC_HOST}:${ENV_VNC_PORT} "
fi
set -u

./utils/websockify/run --help

echo "info: Launch args are: ${LAUNCH_ARGS}"

bash ./utils/launch.sh ${LAUNCH_ARGS}
