#!/bin/bash

API="http://localhost:4741"
URL_PATH="/exercises"
TOKEN="boXQRyC/A00DxYrxzn2ZX2EEeAhSpMDV5rHwhb1a1zY=--uqMtcS/nI8S4fiar+wPkZa2MndmUJbnghbOTYiarjiA="
TEXT='Some text'
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "exercise": {
      "text": "'"${TEXT}"'"
    }
  }'

echo
