#!/bin/bash
./add-customer.sh http://localhost:8080 ${KEYCLOAK_PASSWORD} pcss  localhost:8080 d4e9bda5-ee7c-458d-9234-d04fff3456da Alyson Genny  password1 genny@genny.live genny+admin@genny.live "Wubba!Lubba!Dub!Dub!"
./add-identity-provider.sh http://localhost:8080  ${KEYCLOAK_PASSWORD} pcss facebook 423902461306952 a7bd50640f9914b95756ae8f5680751b
./add-identity-provider.sh http://localhost:8080  ${KEYCLOAK_PASSWORD} pcss google 345230324703-vn18mun81a5v3h1h5gccepsed9671q4n.apps.googleusercontent.com AIhDcF6yr3Sn0uLK8-16NtqW


cp -f realms/pcss.json localhost.json 
cp -f realms/pcss.json 127.0.0.1.json

