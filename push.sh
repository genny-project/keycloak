#!/bin/bash

if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi


docker push crowtech/keycloak:"${version}"
docker tag  crowtech/keycloak:"${version}"  crowtech/keycloak:latest
docker push crowtech/keycloak:latest

