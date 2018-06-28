#!/bin/bash

curl --include --request PATCH "http://localhost:4741/discussions/${ID}" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "discussion": {
      "title": "'"${TITLE}"'",
      "winner": "'"${WINNER}"'"
    }
  }'
