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

clientid=`./get-clientid.sh $KEYCLOAK_URL $KEYCLOAK_PASSWORD ${realm} ${client}` 

export SECRET=$(curl -sS -X GET   "${KEYCLOAK_URL}/auth/admin/realms/${realm}/clients/${clientid}/client-secret" \
-H "Accept: application/json" \
-H "Authorization: Bearer $TKN" | jq -r '.value' ) 

echo ${SECRET}
