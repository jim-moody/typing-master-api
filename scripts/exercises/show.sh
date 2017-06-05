#!/bin/sh

API="http://localhost:4741"
URL_PATH="/exercises"
ID=59333bf022ad60957e90d290
TOKEN=/Q4D5GfiBrIUUFEuEmBWF3SxeeHf1BHHxwNROJu92QE=--n6VYOjNnR6fDRLWf7fa2dQiKPGzo/s3NAVAm1sFVElU=

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
