#!/bin/bash -e
mkdir -p /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main
cd /opt/jboss/keycloak/modules/system/layers/base/com/mysql/jdbc/main
curl -O https://repo1.maven.org/maven2/mysql/mysql-connector-java/$JDBC_MYSQL_VERSION/mysql-connector-java-$JDBC_MYSQL_VERSION.jar
cp /opt/jboss/tools/databases/mysql/module.xml .
sed "s/JDBC_MYSQL_VERSION/$JDBC_MYSQL_VERSION/" /opt/jboss/tools/databases/mysql/module.xml > module.xml


