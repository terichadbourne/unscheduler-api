#!/bin/bash

curl --include --request POST "http://localhost:4741/votes" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "vote": {
      "user_id": "'"${USERID}"'",
      "discussion_id": "'"${DISCUSSIONID}"'"
    }
  }'
