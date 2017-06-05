#!/bin/bash

API="http://localhost:4741"
ID=5935911b5e825b5e15feea3a
URL_PATH="/exercises/${ID}/scores"
TOKEN=BvgEBTtxYce+r5BPbS4rQWHXlkhec8h8ie+6OHsu85o=--bh3K+o9+BE8POa7Tt/RC8UV/3OonQbyT/R2a9VvmAB0=
TIME=60
MISTAKES=1
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "score": {
      "time": '${TIME}',
      "mistakes" : '${MISTAKES}'
    }
  }'

echo
