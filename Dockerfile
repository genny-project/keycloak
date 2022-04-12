FROM quay.io/keycloak/keycloak:17.0.1
WORKDIR /opt/keycloak

# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

#themes
ENV JBOSS_HOME=/opt/keycloak
COPY themes-prod/themes/genny          $JBOSS_HOME/themes/genny
COPY themes-prod/themes/genny_base     $JBOSS_HOME/themes/genny_base
COPY themes-prod/themes/internmatch    $JBOSS_HOME/themes/internmatch
COPY themes-prod/themes/pcss           $JBOSS_HOME/themes/pcss
COPY themes-prod/themes/stt            $JBOSS_HOME/themes/stt
COPY themes-prod/themes/sttNew         $JBOSS_HOME/themes/sttNew
COPY themes-prod/themes/mentormatch    $JBOSS_HOME/themes/mentormatch
COPY themes-prod/themes/lojing-theme  $JBOSS_HOME/themes/lojing-theme

#Custom themes packaged in a JAR file should be deployed to the `${kc.home.dir}/providers` directory. 
#After that, run the `build` command to install them before starting the server.
COPY themes-prod/deployments/mentormatchv12.jar  $JBOSS_HOME/providers/

ENV KC_METRICS_ENABLED=true
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

RUN /opt/keycloak/bin/kc.sh build
RUN /opt/keycloak/bin/kc.sh show-config

# change these values to point to a running postgres instance
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--hostname=${KC_HOSTNAME}", "--db-password=${KC_DB_PASSWORD}", "--db-username=${KC_DB_USERNAME}", "--db-url=${KC_DB_URL}", "--proxy=${KC_PROXY}"]
