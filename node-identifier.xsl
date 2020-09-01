<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright 2015-2016 Red Hat, Inc. and/or its affiliates
    and other contributors as indicated by the @author tags.
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
       http://www.apache.org/licenses/LICENSE-2.0
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xalan="http://xml.apache.org/xalan"
                xmlns:ds="urn:jboss:domain:datasources:6.0"
                xmlns:ra="urn:jboss:domain:resource-adapters:5.0"
                xmlns:ejb3="urn:jboss:domain:ejb3:7.0"
                xmlns:logging="urn:jboss:domain:logging:8.0"
                xmlns:undertow="urn:jboss:domain:undertow:11.0"
                xmlns:tx="urn:jboss:domain:transactions:5.0"
                xmlns:jboss="urn:jboss:domain:13.0"
                version="2.0"
                exclude-result-prefixes="xalan ds ra ejb3 logging undertow tx">

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" xalan:indent-amount="4" standalone="no"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="node()[name(.)='core-environment']">
    <xsl:copy>
      <xsl:attribute name="node-identifier">crowtech-kc</xsl:attribute>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <!-- copy everything else as-is -->
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*" />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
