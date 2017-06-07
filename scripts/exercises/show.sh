#!/bin/sh

API="http://localhost:4741"
URL_PATH="/exercises"
ID=5935a1842514256126ac56ae
TOKEN="5Tv8dEhBN1SeJGmZX+4xj+/E9TtD4GmaolLjtvpP95o=--NJzmH0U3/OEeNjLr+O3dEQcA3qqtWLYm9j++1FAmkDo="

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
