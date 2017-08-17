#!/bin/bash
source ../config.sh
curl -X POST  ${TARGET_URL}:${TARGET_PORT}/api/resourceTables/analytics -u ${TARGET_USER}:${TARGET_PASSWORD} -v
sleep 5
ab -A ${TARGET_USER}:${TARGET_PASSWORD} -n $1 -c $2 ${TARGET_URL}:${TARGET_PORT}/api/dataSets/ &
ab -A ${TARGET_USER}:${TARGET_PASSWORD} -T 'application/json' -n $1 -c $2 -p ../dataValues.json ${TARGET_URL}:${TARGET_PORT}/api/dataValueSets &
wait