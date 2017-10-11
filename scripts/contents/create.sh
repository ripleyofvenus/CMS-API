#!/bin/bash

TOKEN=Ufo7tyLaCkmHhyokY4XW3Wse3H/qaDz7n0Bo/+TSK88=--tlUjPeie8+PiG60/j6y16mA9lPWk20rRRx5SGS5cDXU=

API="http://localhost:4741"
URL_PATH="/contents"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "content": {
      "title": "'"${TITLE}"'",
      "date": "2017-10-11",
      "type": "blog",
      "text": "puppies are awesome"
    }
  }'

echo
