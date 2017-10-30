#!/bin/bash
TOKEN=4YWAvnStNVXLhgct0xMktSvgVB6lfFp8VYf9GSYM23U=--DpfEBpBI8jUKZOaK5WC8RKlx1W3pW/W1hhBDIhi3sEo=

API="http://localhost:4741"
# API="http://sserpdrow-api.herokuapp.com"
URL_PATH="/contents"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "content": {
      "title": "'"${TITLE}"'",
      "date": "2018-10-11",
      "type": "page",
      "text": "kitties are awsomer"
    }
  }'

echo
