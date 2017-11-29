#!/bin/bash
KEYCLOAK_URL=$1
KEYCLOAK_PASSWORD=$2
REALM=$3
USERNAME=$4
USEREMAIL=$5
FIRST_NAME=$6
LAST_NAME=$7
PASSWORD=$8
GROUPNAMES=$9
REALMROLES=${10}

echo "Creating Realm User - ${REALM}:${USERNAME}"

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
#Create user.json
cp -f templates/user.json user-temp.json
sed -i ${SEDFIX} -e  's|\@\@REALM\@\@|'"${REALM}"'|g' user-temp.json
sed -i ${SEDFIX} -e  's|\@\@USEREMAIL\@\@|'"${USEREMAIL}"'|g' user-temp.json
sed -i ${SEDFIX} -e  's|\@\@USERNAME\@\@|'"${USERNAME}"'|g' user-temp.json
sed -i ${SEDFIX} -e  's|\@\@FIRST_NAME\@\@|'"${FIRST_NAME}"'|g' user-temp.json
sed -i ${SEDFIX} -e  's|\@\@LAST_NAME\@\@|'"${LAST_NAME}"'|g' user-temp.json
sed -i ${SEDFIX} -e  's|\@\@GROUPNAMES\@\@|'"${GROUPNAMES}"'|g' user-temp.json
sed -i ${SEDFIX} -e  's|\@\@REALMROLES\@\@|'"${REALMROLES}"'|g' user-temp.json

export TKN=$(curl -sS -X POST "${KEYCLOAK_URL}/auth/realms/master/protocol/openid-connect/token" \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=admin" \
 -d "password=${KEYCLOAK_PASSWORD}" \
 -d 'grant_type=password' \
 -d 'client_id=admin-cli' | jq -r '.access_token')

#echo $TKN

#echo "###########################################"
USER2=$(curl -i -sS  -X POST   \
 -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TKN" --data-binary @user-temp.json \
 ${KEYCLOAK_URL}/auth/admin/realms/${REALM}/users   | grep Location )

userid=${USER2##*/}
id=`echo "${userid%?}"`
#echo "id=${id}"
cp -f templates/password.json password-temp.json
sed -i ${SEDFIX} -e  's|\@\@PASSWORD\@\@|'"${PASSWORD}"'|g' password-temp.json
curl -sS  --request PUT    \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer $TKN"  --data-binary @password-temp.json \
 "${KEYCLOAK_URL}/auth/admin/realms/${REALM}/users/${id}/reset-password"
# echo "${KEYCLOAK_URL}/auth/admin/realms/${REALM}/users/${id}/reset-password"
