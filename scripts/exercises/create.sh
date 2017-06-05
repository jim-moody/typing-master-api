#!/bin/bash

API="http://localhost:4741"
URL_PATH="/exercises"
TOKEN=BvgEBTtxYce+r5BPbS4rQWHXlkhec8h8ie+6OHsu85o=--bh3K+o9+BE8POa7Tt/RC8UV/3OonQbyT/R2a9VvmAB0=
TEXT='Some text adasdsala;dla;'
NAME='Sample Exercise 7'
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "exercise": {
      "text": "'"${TEXT}"'",
      "name": "'"${NAME}"'"
    }
  }'

echo
