#!/bin/bash

curl --include --request PATCH "http://localhost:4741/events/${ID}" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "event": {
      "name": "'"${NAME}"'",
      "max_votes": "'"${MAX_VOTES}"'",
      "proposals_open": "'"${PROPOSALS}"'",
      "voting_open": "'"${VOTING}"'",
      "schedule_finalized": "'"${FINAL}"'",
      "user_id": "'"${USERID}"'"
    }
  }'
