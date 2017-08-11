#!/bin/bash
source ../config.sh
ab -A ${TARGET_USER}:${TARGET_PASSWORD} -T 'application/json' -n $1 -c $2 -p ../dataValues.json http://${TARGET_URL}:${TARGET_PORT}/api/dataValueSets
