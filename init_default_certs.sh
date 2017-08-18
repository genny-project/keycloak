#!/bin/bash
mkdir -p volumes/proxy/certs
echo "Generating genny.live.local"
openssl req  -newkey rsa:2048 -nodes -x509 -days 365 -keyout volumes/proxy/certs/docker-keycloak.local.key -out volumes/proxy/certs/docker-keycloak.local.crt

