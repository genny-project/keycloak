FROM registry.access.redhat.com/ubi8-minimal
MAINTAINER Adam Crow <acrow@crowtech.com.au>

ENV KEYCLOAK_VERSION 17.0.0
ENV JDBC_MYSQL_VERSION 8.0.21
ENV DB_VENDOR mysql

ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV PROXY_ADDRESS_FORWARDING false 
ENV JBOSS_HOME /opt/jboss/keycloak
ENV LANG en_US.UTF-8

ARG GIT_REPO
ARG GIT_BRANCH
ARG KEYCLOAK_DIST=https://github.com/keycloak/keycloak/releases/download/$KEYCLOAK_VERSION/keycloak-legacy-$KEYCLOAK_VERSION.tar.gz

USER root


RUN microdnf update -y && microdnf install -y glibc-langpack-en gzip hostname java-11-openjdk-headless openssl tar which && microdnf clean all

ADD tools /opt/jboss/tools
RUN /opt/jboss/tools/build-keycloak.sh
# themes
COPY themes-prod/themes/genny          $JBOSS_HOME/themes/
COPY themes-prod/themes/genny_base     $JBOSS_HOME/themes/
COPY themes-prod/themes/internmatch    $JBOSS_HOME/themes/
COPY themes-prod/themes/pcss           $JBOSS_HOME/themes/
COPY themes-prod/themes/stt            $JBOSS_HOME/themes/
COPY themes-prod/themes/sttNew         $JBOSS_HOME/themes/
COPY themes-prod/themes/mentormatch    $JBOSS_HOME/themes/
COPY themes-prod/themes/mentormatchv3  $JBOSS_HOME/themes/

COPY themes-prod/deployments/mentormatchv7.jar  $JBOSS_HOME/standalone/deployments/
COPY themes-prod/deployments/mentormatchv8.jar  $JBOSS_HOME/standalone/deployments/

RUN echo `date` >  $JBOSS_HOME/build-date

USER 1000

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]
