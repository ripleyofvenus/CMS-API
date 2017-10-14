#!/bin/sh

API="http://localhost:4741"
URL_PATH="/find-by-email"

curl "${API}${URL_PATH}/${EMAIL}" \
  --include \
  --request GET \

echo
