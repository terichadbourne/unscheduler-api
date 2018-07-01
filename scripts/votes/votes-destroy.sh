#!/bin/bash

curl --include --request DELETE "http://localhost:4741/votes/${ID}" \
--header "Authorization: Token token=${TOKEN}" \
