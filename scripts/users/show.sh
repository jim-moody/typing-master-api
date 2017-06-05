#!/bin/bash

API="http://localhost:4741"
URL_PATH="/users"
ID="592c5e243994d0336024f06e"
TOKEN="VQ8jC5FhE5MTLeMwLbd2lYR1KEm5v3cPX7z3IeuYekU=--ZrULmcg39N23gVuqCs63ToPjXy9JXmDbhGgfcwiRxJ0="
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
