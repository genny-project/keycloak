FROM openjdk:8u141-slim 
MAINTAINER Adam Crow <acrow@crowtech.com.au>

ENV KEYCLOAK_VERSION 3.4.0.Final
ENV MYSQLCONNECTOR_VERSION 5.1.41

# Enables signals getting passed from startup script to JVM
# ensuring clean shutdown when container is stopped.
ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV MYSQL_PORT_3306_TCP_PORT 3306

USER root

# Install necessary packages
RUN set -x \
    && apt-get update --quiet \
    && apt-get install --quiet --yes --no-install-recommends \
      curl \
      jq \
      sed \
      vim \
      wget \
      xmlstarlet \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /opt/jboss
RUN groupadd -r jboss && useradd -d /opt/jboss -r -g jboss  jboss 
RUN chown -R jboss:jboss /opt/jboss


#RUN mkdir /usr/share/java
COPY java/* /usr/share/java/

USER jboss

RUN cd /opt/jboss/ && curl -L https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz | tar zx && mv /opt/jboss/keycloak-$KEYCLOAK_VERSION /opt/jboss/keycloak
ADD docker-entrypoint.sh /opt/jboss/

ADD setLogLevel.xsl /opt/jboss/keycloak/
RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone.xml -xsl:/opt/jboss/keycloak/setLogLevel.xsl -o:/opt/jboss/keycloak/standalone/configuration/standalone.xml

ENV JBOSS_HOME /opt/jboss/keycloak

USER root
RUN mkdir -p $JBOSS_HOME/themes
RUN mkdir -p /opt/jboss/backup
RUN mkdir -p $JBOSS_HOME/standalone/themes
RUN chown -R jboss:jboss  /opt/jboss/backup 


WORKDIR /opt/jboss

############################ Database #############################

ADD changeDatabase.xsl /opt/jboss/keycloak/
RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone.xml -xsl:/opt/jboss/keycloak/changeDatabase.xsl -o:/opt/jboss/keycloak/standalone/configuration/standalone.xml; java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml -xsl:/opt/jboss/keycloak/changeDatabase.xsl -o:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml; 
#RUN rm /opt/jboss/keycloak/changeDatabase.xsl

RUN mkdir -p /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main; cd /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main && curl -O http://central.maven.org/maven2/mysql/mysql-connector-java/$MYSQLCONNECTOR_VERSION/mysql-connector-java-$MYSQLCONNECTOR_VERSION.jar

ADD module.xml /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main/
RUN sed -i "s/mysql-connector-java/mysql-connector-java-$MYSQLCONNECTOR_VERSION/g" $JBOSS_HOME/modules/system/layers/base/com/mysql/jdbc/main/module.xml


############################ Security #############################

ENV REALM_NAME genny 
ENV SECRET  password 

ADD addTruststore.xsl /opt/jboss/keycloak/
ADD addHttps.xsl /opt/jboss/keycloak/

# Setup normal standalone
#RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone.xml -xsl:/opt/jboss/keycloak/addHttps.xsl realmName=$REALM_NAME secret=$SECRET -o:/opt/jboss/keycloak/standalone/configuration/standalone.xml

#RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone.xml -xsl:/opt/jboss/keycloak/addTruststore.xsl realmName=$REALM_NAME secret=$SECRET -o:/opt/jboss/keycloak/standalone/configuration/standalone.xml

#Set up for proxy
RUN xmlstarlet ed -L -u  "//*[local-name()='http-listener']/@redirect-socket" -v "proxy-https"  $JBOSS_HOME/standalone/configuration/standalone.xml
RUN xmlstarlet ed -L -i "//*[local-name()='http-listener']"  -t attr -n "proxy-address-forwarding" -v "true"  $JBOSS_HOME/standalone/configuration/standalone.xml
RUN xmlstarlet ed -L -s "//*[local-name()='socket-binding-group']"  -t elem -n "XXXX" -i //XXXX -t attr -n "name" -v "proxy-https" -i //XXXX -t attr -n "port" -v "443" -r //XXXX -v socket-binding $JBOSS_HOME/standalone/configuration/standalone.xml


RUN rm /opt/jboss/keycloak/addTruststore.xsl
RUN rm /opt/jboss/keycloak/addHttps.xsl

RUN sed -i 's/127.0.0.1/0.0.0.0/g' $JBOSS_HOME/standalone/configuration/standalone.xml

# clean up empty xmlns strings
RUN sed -i 's/xmlns=\"\"//g' $JBOSS_HOME/standalone/configuration/standalone.xml
#set up default genny theme
COPY themes $JBOSS_HOME/themes

COPY keycloak-scripts $JBOSS_HOME/scripts 
ADD execute.sh /


RUN chown -Rf jboss:jboss $JBOSS_HOME
USER jboss




EXPOSE 8080

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]
