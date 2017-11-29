#!/bin/bash

MAX_WAIT=180
DELAY=10
TOTAL_WAIT=0

JBOSS_HOME=/opt/jboss/keycloak
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh
JBOSS_MODE=standalone
JBOSS_CONFIG=standalone.xml

/opt/jboss/keycloak/bin/standalone.sh -b 0.0.0.0 &

until [ $TOTAL_WAIT -gt $MAX_WAIT ]
do
    if $JBOSS_HOME/bin/jboss-cli.sh -c ls | grep -q "server-state=running"
    then break
    fi
    echo Application is not deployed withing $TOTAL_WAIT seconds. Waiting for another $DELAY seconds...
    sleep $DELAY
    let TOTAL_WAIT=$TOTAL_WAIT+$DELAY;
done

echo "PERFORM KEYCLOAK REALM SETUP"
cd /opt/jboss/keycloak/scripts
./add-genny.sh
echo "PERFORM KEYCLOAK REALM FINISH"

$JBOSS_CLI -c ":shutdown"
#function wait_for_server() {
#  until `$JBOSS_CLI -c "ls /deployment" &> /dev/null`; do
#    sleep 1
#  done
#}
#
#echo "=> Starting WildFly server"
#/opt/jboss/docker-entrypoint.sh &
#
#echo "=> Waiting for the server to boot"
#wait_for_server
#sleep 20
###### THIS ENABLES KEYCLOAK!!
#echo "PERFORM KEYCLOAK REALM SETUP"
#cd /opt/jboss/keycloak/scripts
#./add-genny.sh
#echo "PERFORM KEYCLOAK REALM FINISH"
#
#echo "=> Shutting down WildFly"
#if [ "$JBOSS_MODE" = "standalone" ]; then
#  $JBOSS_CLI -c ":shutdown"
#else
#  $JBOSS_CLI -c "/host=*:shutdown"
#fi
