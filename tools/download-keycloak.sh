#!/bin/bash -e

echo "Keycloak from [download]: $KEYCLOAK_DIST"
cd /opt/jboss/
curl -L $KEYCLOAK_DIST | tar zx
mv /opt/jboss/keycloak-* /opt/jboss/keycloak
