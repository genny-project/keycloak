#!/bin/bash
KEYCLOAK_URL=$1
KEYCLOAK_PASSWORD=$2
realm=$3
client=$4

export TKN=$(curl -sS -X POST "${KEYCLOAK_URL}/auth/realms/master/protocol/openid-connect/token" \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=admin" \
 -d "password=${KEYCLOAK_PASSWORD}" \
 -d 'grant_type=password' \
 -d 'client_id=admin-cli' | jq -r '.access_token')

#echo $TKN
#echo "client is ${client}"
#curl -X GET   "${KEYCLOAK_URL}/auth/admin/realms/${realm}/clients/${client}/client-secret" \
curl -sS -X GET   "${KEYCLOAK_URL}/auth/admin/realms/${realm}/clients" \
-H "Accept: application/json" \
-H "Authorization: Bearer $TKN"  | jq  -c ".[] | select(.clientId==\""$client"\")"  | jq -r '.id'

