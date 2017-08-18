#!/bin/bash
# Remember to install jq (e.g. brew install jq; yum install jq; apt-get install jq)

set -e
RED='\033[0;31m'
NORMAL='\033[0m'

printf "${RED}Getting OAuth2 token from Keycloak (includes access_token, refresh_token, etc):${NORMAL}\n"
KEYCLOAK_RESPONSE=`curl -s -X POST http://localhost:8180/auth/wildfly-swarm-keycloak-example/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=user1' -d 'password=password1' -d 'grant_type=password' -d 'client_id=curl'  -d 'client_secret=056b73c1-7078-411d-80ec-87d41c55c3b4'`
printf "$KEYCLOAK_RESPONSE \n\n"

printf "${RED}Parsing access_token field, as we don't need the other elements:${NORMAL}\n"
ACCESS_TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
printf "$ACCESS_TOKEN \n\n"

printf "${RED}Accessing service via apiman using token - we will put it into the Authorization header:${NORMAL}\n"
curl -k -v -H "Authorization: Bearer $ACCESS_TOKEN" http://localhost:8280/qwanda/asks
printf "\n\n"

printf "${RED}You can also use the access_token query parameter instead if you wish. Let's try it:${NORMAL}\n"
curl -k -v http://localhost:8280/qwanda/asks?access_token="$ACCESS_TOKEN"
