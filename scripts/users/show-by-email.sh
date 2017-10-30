#!/bin/bash

API="http://localhost:4741"
URL_PATH="/show-user"

curl "${API}${URL_PATH}/${EMAIL}" \
  --include \
  --request GET \
