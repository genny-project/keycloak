#!/bin/bash


if [ $KEYCLOAK_USER ] && [ $KEYCLOAK_PASSWORD ]; then
    keycloak/bin/add-user-keycloak.sh --user $KEYCLOAK_USER --password $KEYCLOAK_PASSWORD
fi

if [[ $IMPORTEXPORT == "EXPORT" ]]; then
   echo "Exporting Keycloak";
   /opt/jboss/keycloak/bin/standalone.sh -b 0.0.0.0  -Djava.net.preferIPv6Addresses=false   -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true    -Dkeycloak.migration.action=export -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/tmp/realm/keycloak-data.json  $@
else
if [[ $IMPORTEXPORT == "IMPORT" ]]; then
   echo "Importing Keycloak";
   /opt/jboss/keycloak/bin/standalone.sh -b 0.0.0.0  -Djava.net.preferIPv6Addresses=false   -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true    -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/tmp/realm/keycloak-data.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING $@
else
   /opt/jboss/keycloak/bin/standalone.sh -b 0.0.0.0  -Djava.net.preferIPv6Addresses=false   -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true     $@
fi
fi
#sleep 10
#/opt/jboss/keycloak/bin/jboss-cli.sh --connect "/subsystem=undertow/server=default-server/http-listener=default:write-attribute(name=redirect-socket, value=http)"
#/opt/jboss/keycloak/bin/jboss-cli.sh --connect "/subsystem=undertow/server=default-server/http-listener=default:write-attribute(name=proxy-address-forwarding, value=true)"
#/opt/jboss/keycloak/bin/jboss-cli.sh --connect "reload"

#/opt/jboss/keycloak/bin/jboss-cli.sh --connect "/subsystem=undertow/server=default-server/http-listener=default:read-resource"
