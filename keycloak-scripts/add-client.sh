#!/bin/bash
KEYCLOAK_URL=$1
KEYCLOAK_PASSWORD=$2
REALM=$3
CLIENT=$4
CLIENT_SECRET=$5
REALM_DOMAIN=$6

echo "Creating client - ${REALM}:${CLIENT}"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        SEDFIX=
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        SEDFIX='""'
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
        SEDFIX=
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        SEDFIX=
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
        SEDFIX=
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
        SEDFIX=
else
        # Unknown.
        SEDFIX=
fi
#Create realm.json
cp -f templates/client.json client-temp.json
sed -i ${SEDFIX} -e  's|\*\*\*\*\*\*\*\*\*\*|'"${CLIENT_SECRET}"'|g' client-temp.json
sed -i ${SEDFIX} -e  's|\@\@REALM\@\@|'"${REALM}"'|g' client-temp.json
sed -i ${SEDFIX} -e  's|\@\@CLIENT\@\@|'"${CLIENT}"'|g' client-temp.json
sed -i ${SEDFIX} -e  's|\@\@REALM_DOMAIN\@\@|'"${REALM_DOMAIN}"'|g' client-temp.json

export TKN=$(curl -sS  -X POST "${KEYCLOAK_URL}/auth/realms/master/protocol/openid-connect/token" \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=admin" \
 -d "password=${KEYCLOAK_PASSWORD}" \
 -d 'grant_type=password' \
 -d 'client_id=admin-cli' | jq -r '.access_token')

#echo $TKN

curl -sS   -X POST   \
 -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TKN" --data-binary @client-temp.json \
 ${KEYCLOAK_URL}/auth/admin/realms/${REALM}/clients
