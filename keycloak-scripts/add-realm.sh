#!/bin/bash
KEYCLOAK_URL=$1
KEYCLOAK_PASSWORD=$2
REALM=$3
REALM_SECRET=$4
REALM_DOMAIN=$5
DEFAULT_ROLE=user

echo ""
echo "Setting up Realm - ${REALM}"

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
cp -f templates/realm.json realm-temp.json
sed -i  ${SEDFIX} -e  's|\*\*\*\*\*\*\*\*\*\*|'"${REALM_SECRET}"'|g' realm-temp.json
sed -i  ${SEDFIX} -e  's|\@\@REALM\@\@|'"${REALM}"'|g' realm-temp.json
sed -i  ${SEDFIX} -e  's|\@\@DISPLAY_NAME\@\@|'"${REALM}"'|g' realm-temp.json
sed -i  ${SEDFIX} -e  's|\@\@DEFAULT_ROLE\@\@|'"${DEFAULT_ROLE}"'|g' realm-temp.json
sed -i  ${SEDFIX} -e  's|\@\@REALM_DOMAIN\@\@|'"${REALM_DOMAIN}"'|g' realm-temp.json

export TKN=$(curl -sS -X POST "${KEYCLOAK_URL}/auth/realms/master/protocol/openid-connect/token" \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=admin" \
 -d "password=${KEYCLOAK_PASSWORD}" \
 -d 'grant_type=password' \
 -d 'client_id=admin-cli' | jq -r '.access_token')

#echo $TKN

curl -sS  -X POST   \
 -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TKN" --data-binary @realm-temp.json \
 ${KEYCLOAK_URL}/auth/admin/realms
