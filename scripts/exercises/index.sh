#!/bin/sh

API="http://localhost:4741"
URL_PATH="/exercises"
TOKEN="boXQRyC/A00DxYrxzn2ZX2EEeAhSpMDV5rHwhb1a1zY=--uqMtcS/nI8S4fiar+wPkZa2MndmUJbnghbOTYiarjiA="

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
