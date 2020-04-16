#!/bin/bash

if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi


docker push gennyproject/keycloak:"${version}"
docker tag  gennyproject/keycloak:"${version}"  gennyproject/keycloak:latest
docker push gennyproject/keycloak:latest

