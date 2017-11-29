#!/bin/bash
KEYCLOAK_URL=http://localhost:8180
KEYCLOAK_PASSWORD=admin
REALM=$1
REALM_SECRET=$2

#Create realm.json
cp -f templates/realm.json realm-temp.json
sed -i '' -e  's|\*\*\*\*\*\*\*\*\*\*|'"${REALM_SECRET}"'|g' realm-temp.json
sed -i '' -e  's|\@\@REALM\@\@|'"${REALM}"'|g' realm-temp.json
sed -i '' -e  's|\@\@DISPLAY_NAME\@\@|'"${REALM}"'|g' realm-temp.json

export TKN=$(curl -X POST "${KEYCLOAK_URL}/auth/realms/master/protocol/openid-connect/token" \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=admin" \
 -d "password=${KEYCLOAK_PASSWORD}" \
 -d 'grant_type=password' \
 -d 'client_id=admin-cli' | jq -r '.access_token')

echo $TKN

curl  -k -vX POST   \
 -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TKN" --data-binary @realm-temp.json \
 ${KEYCLOAK_URL}/auth/admin/realms
