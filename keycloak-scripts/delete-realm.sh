#!/bin/bash
KEYCLOAK_URL=http://localhost:8180
KEYCLOAK_PASSWORD=admin
realm=$1

export TKN=$(curl -X POST "${KEYCLOAK_URL}/auth/realms/master/protocol/openid-connect/token" \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=admin" \
 -d "password=${KEYCLOAK_PASSWORD}" \
 -d 'grant_type=password' \
 -d 'client_id=admin-cli' | jq -r '.access_token')

#echo $TKN

curl -X DELETE   "${KEYCLOAK_URL}/auth/admin/realms/${realm}" \
-H "Accept: application/json" \
-H "Authorization: Bearer $TKN" | jq .

