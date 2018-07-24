<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:log="urn:jboss:domain:logging:2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="//log:subsystem">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
                <log:logger category="org.keycloak">
                    <log:level>
                      <xsl:attribute name="name">${env.KEYCLOAK_LOGLEVEL:INFO}</xsl:attribute>
                    </log:level>
                </log:logger>
                <log:logger category="org.keycloak.social.user_profile_dump">
                    <log:level>
                      <xsl:attribute name="name">${env.KEYCLOAK_LOGLEVEL:DEBUG}</xsl:attribute>
                    </log:level>
                </log:logger>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>

