#!/bin/bash
source ../config.sh
ab -A ${TARGET_USER}:${TARGET_PASSWORD} -n $1 -c $2 ${TARGET_URL}:${TARGET_PORT}/api/dataSets
