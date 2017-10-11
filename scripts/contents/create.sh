#!/bin/bash

TOKEN=y5U5DQHfTlvURzH2Ar7AvtGgns+TFLibbDKPC69x3Ik=--N2wUBZFu2uEmkHLic3c92CN3rdvHd7NBVMoBuntmLbE=
# API="http://localhost:4741"
API="http://sserpdrow-api.herokuapp.com"

URL_PATH="/contents"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "content": {
      "title": "'"${TITLE}"'",
      "date": "2011-10-11",
      "type": "blog",
      "text": "puppies are awesome"
    }
  }'

echo
