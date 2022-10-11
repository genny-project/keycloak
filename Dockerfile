FROM quay.io/keycloak/keycloak:19.0.3
WORKDIR /opt/keycloak

# for demonstration purposes only, please make sure to use proper certificates in production instead
#RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

#themes
ENV JBOSS_HOME=/opt/keycloak
#Custom themes packaged in a JAR file should be deployed to the `${kc.home.dir}/providers` directory. 
#After that, run the `build` command to install them before starting the server.
COPY themes-prod/deployments/base.jar  $JBOSS_HOME/providers/
COPY themes-prod/deployments/genny.jar  $JBOSS_HOME/providers/
COPY themes-prod/deployments/genny_base.jar  $JBOSS_HOME/providers/
COPY themes-prod/deployments/internmatch.jar  $JBOSS_HOME/providers/
COPY themes-prod/deployments/lojing-theme.jar $JBOSS_HOME/providers/
COPY themes-prod/deployments/mentormatch.jar  $JBOSS_HOME/providers/
COPY themes-prod/deployments/mentormatchv12.jar  $JBOSS_HOME/providers/
COPY themes-prod/deployments/pcss.jar  $JBOSS_HOME/providers/
COPY themes-prod/deployments/stt.jar  $JBOSS_HOME/providers/
COPY themes-prod/deployments/sttNew.jar  $JBOSS_HOME/providers/

ENV KC_METRICS_ENABLED=true
ENV KC_HEALTH_ENABLED=true
ENV KC_HTTP_ENABLED=true
ENV KC_SHOW_CONFIG=true
ENV KC_FEATURES="preview, token-exchange, account-api"
ENV KC_DB=mysql
ENV KC_HOSTNAME_STRICT_BACKCHANNEL=true
ENV KC_HOSTNAME_STRICT=true
ENV KC_LOG_LEVEL=info
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=change_me
ENV KC_HTTP_RELATIVE_PATH=/auth

# cluster 
ENV KC_CACHE_STACK=tcp
ENV KC_CACHE=ispn


# Install custom providers
#RUN curl -sL https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.5.3/keycloak-metrics-spi-2.5.3.jar -o /opt/keycloak/providers/keycloak-metrics-spi-2.5.3.jar

RUN /opt/keycloak/bin/kc.sh build
RUN /opt/keycloak/bin/kc.sh show-config

# change these values to point to a running postgres instance
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "--verbose", "start", "--hostname=${KC_HOSTNAME}", "--db-password=${KC_DB_PASSWORD}", "--db-username=${KC_DB_USERNAME}", "--db-url=${KC_DB_URL}", "--proxy=${KC_PROXY}"]
#ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--hostname=${KC_HOSTNAME}", "--db-password=${KC_DB_PASSWORD}", "--db-username=${KC_DB_USERNAME}", "--db-url=${KC_DB_URL}", "--proxy=${KC_PROXY}", "--hostname-path=${KC_HOSTNAME_PATH}"]
