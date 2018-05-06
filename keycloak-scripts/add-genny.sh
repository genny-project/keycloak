#!/bin/bash
./add-customer.sh http://localhost:8080 ${KEYCLOAK_PASSWORD} genny  localhost:8080  056b73c1-7078-411d-80ec-87d41c55c3b4 Alyson Genny  password1 genny@genny.live genny+admin@genny.live "Wubba!Lubba!Dub!Dub!"
./add-identity-provider.sh http://localhost:8080  ${KEYCLOAK_PASSWORD} genny facebook 423902461306952 a7bd50640f9914b95756ae8f5680751b
./add-identity-provider.sh http://localhost:8080  ${KEYCLOAK_PASSWORD} genny google 345230324703-vn18mun81a5v3h1h5gccepsed9671q4n.apps.googleusercontent.com AIhDcF6yr3Sn0uLK8-16NtqW


cp -f realms/genny.json localhost.json 
cp -f realms/genny.json 127.0.0.1.json

