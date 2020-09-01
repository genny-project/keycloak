FROM openjdk:8u265-jre-slim

MAINTAINER Adam Crow <acrow@crowtech.com.au>
 
ENV KEYCLOAK_VERSION 11.0.2
ENV JDBC_MYSQL_VERSION 8.0.21
ENV DB_VENDOR mysql

# Enables signals getting passed from startup script to JVM
# ensuring clean shutdown when container is stopped.
ENV LAUNCH_JBOSS_IN_BACKGROUND 1
# for Nginx and k8s ingress
ENV PROXY_ADDRESS_FORWARDING TRUE
ENV JBOSS_HOME /opt/jboss/keycloak

ARG KEYCLOAK_DIST=https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz

USER root

RUN mkdir -p /opt/jboss
RUN echo `date` > /tmp/build-date
ADD tools /opt/jboss/tools

# Install necessary packages
RUN /opt/jboss/tools/install-package.sh

#Download Keycloak
RUN /opt/jboss/tools/download-keycloak.sh


############################ Database #############################
RUN /opt/jboss/tools/config-database.sh

########################### Keycloak ##############################
RUN /opt/jboss/tools/config-keycloak.sh

RUN mkdir -p $JBOSS_HOME/themes
RUN mkdir -p $JBOSS_HOME/standalone/themes
RUN mkdir -p /opt/jboss/backup
#set up default genny theme
#COPY themes $JBOSS_HOME/themes

COPY keycloak-scripts $JBOSS_HOME/scripts 
ADD execute.sh /

# add user jboss
RUN groupadd -r jboss && useradd -d /opt/jboss -r -g jboss  jboss 
RUN chown -R jboss:jboss /opt/jboss

USER jboss
WORKDIR /opt/jboss

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]
