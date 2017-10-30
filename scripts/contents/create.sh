#!/bin/bash

TOKEN=SvVqkDH71nyRsyGnqAHBkC5KFviVbsg7sZbeZxUWs3k=--VSrJN/p741QUnGak4atg/KdEzRY+K+M3PVv34CHUE8M=
API="http://localhost:4741"
# API="http://sserpdrow-api.herokuapp.com"

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
