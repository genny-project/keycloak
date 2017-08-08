FROM jboss/keycloak:3.2.0.Final

ADD docker-entrypoint.sh /opt/jboss/
#ADD keycloak-provider.jar /opt/jboss/keycloak/providers/

