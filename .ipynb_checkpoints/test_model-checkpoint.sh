#!/bin/bash

set -e

DOMINO_HOST="https://demo.dominodatalab.com"
# AUTH_CREDENTIALS="uYZUb5q10eNfLmnXepFdW1MscL9kKTX5wK5bf2vrnhw9xjMql236UNnMBBa1CcLO:uYZUb5q10eNfLmnXepFdW1MscL9kKTX5wK5bf2vrnhw9xjMql236UNnMBBa1CcLO"
AUTH_CREDENTIALS="QkgtphbAyVUHknGZDyJIuLy81BdbGCBv1opITWn8ndDu9bFhD2Fvc23y45bdQHDe:QkgtphbAyVUHknGZDyJIuLy81BdbGCBv1opITWn8ndDu9bFhD2Fvc23y45bdQHDe"

MODEL_ID="60f89bb8a853091aa99a7caa"
echo "Testing model - results to follow"

TEST=$(curl ${DOMINO_HOST}/models/${MODEL_ID}/latest/model -s -H 'Content-Type: application/json' -d '{ "data": { "dropperc": 1000, "mins": 600, "consecmonths": 12, "income": 60000, "age": 45 } }' -u $AUTH_CREDENTIALS | grep "request_id" | wc -l)

echo $TEST
if [[ $TEST -gt 0 ]]; then
    echo "TEST: PASS"
    exit 0
else
    echo "TEST: FAIL"
    exit 1
fi
