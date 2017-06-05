#!/bin/bash

API="http://localhost:4741"
URL_PATH="/change-password"
ID="592c5e243994d0336024f06e"
TOKEN="VQ8jC5FhE5MTLeMwLbd2lYR1KEm5v3cPX7z3IeuYekU=--ZrULmcg39N23gVuqCs63ToPjXy9JXmDbhGgfcwiRxJ0="
OLDPW="jim"
NEWPW="jima"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
