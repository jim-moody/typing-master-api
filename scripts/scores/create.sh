#!/bin/bash

API="http://localhost:4741"
ID=59333bf022ad60957e90d290
URL_PATH="/exercises/${ID}/scores"
TOKEN="boXQRyC/A00DxYrxzn2ZX2EEeAhSpMDV5rHwhb1a1zY=--uqMtcS/nI8S4fiar+wPkZa2MndmUJbnghbOTYiarjiA="
TIME=30
MISTAKES=10
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
