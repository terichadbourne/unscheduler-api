#!/bin/bash

curl --include --request POST "http://localhost:4741/discussions/" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "discussion": {
      "title": "'"${TITLE}"'",
      "winner": "'"${WINNER}"'"
    }
  }'
