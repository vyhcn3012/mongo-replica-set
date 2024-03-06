#!/bin/bash

DB1_PORT=37017
DB2_PORT=37018
DB3_PORT=37019

LOCAL_HOST="${HOST:-localhost}"
REPLICA_SET="${REPLICA_SET_NAME:-rs0}"

RS_MEMBER_1="{ \"_id\": 0, \"host\": \"${LOCAL_HOST}:${DB1_PORT}\", \"priority\": 2 }"
RS_MEMBER_2="{ \"_id\": 1, \"host\": \"${LOCAL_HOST}:${DB2_PORT}\", \"priority\": 0 }"
RS_MEMBER_3="{ \"_id\": 2, \"host\": \"${LOCAL_HOST}:${DB3_PORT}\", \"priority\": 0 }"

sleep 30
mongo --eval "rs.initiate({ \"_id\": \"${REPLICA_SET}\", \"members\": [${RS_MEMBER_1}, ${RS_MEMBER_2}, ${RS_MEMBER_3}] });"
