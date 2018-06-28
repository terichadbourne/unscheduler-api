#!/bin/bash

curl --include --request DELETE "http://localhost:4741/discussions/${ID}" \
--header "Authorization: Token token=${TOKEN}" \
