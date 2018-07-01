#!/bin/bash

curl --include --request PATCH "http://localhost:4741/votes/${ID}" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "vote": {
      "user_id": "'"${USERID}"'",
      "discussion_id": "'"${DISCUSSIONID}"'"
    }
  }'
