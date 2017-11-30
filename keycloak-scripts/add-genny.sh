#!/bin/bash
./add-customer.sh http://localhost:8080 ${KEYCLOAK_PASSWORD} genny ${KEYCLOAKURL} 056b73c1-7078-411d-80ec-87d41c55c3b4 Alyson Genny  password1 genny@genny.live genny+admin@genny.live
cp -f realms/genny.json localhost.json 
cp -f realms/genny.json 127.0.0.1.json

