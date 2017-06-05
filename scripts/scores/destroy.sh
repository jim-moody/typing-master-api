#!/bin/bash

API="http://localhost:4741"
ID=59333bf022ad60957e90d290
SCORE_ID=59333c2422ad60957e90d292
URL_PATH="/exercises/${ID}/scores/${SCORE_ID}"
TOKEN=IYMV1vQbJD1wh26k/nuOIjotQp3cfkXjwirgeHoWQwo=--6WK/gQOvf0UMeEsIR6iUq0BIgaTaHxXzbQY+8yC+IkI=
TIME=20
MISTAKES=5
curl "${API}${URL_PATH}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \

echo
