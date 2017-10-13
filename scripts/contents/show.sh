#!/bin/sh

API="http://localhost:4741"
# API="http://sserpdrow-api.herokuapp.com"
URL_PATH="/contents"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
