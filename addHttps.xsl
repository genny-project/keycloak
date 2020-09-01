<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:ds="urn:jboss:domain:undertow:11.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="realmName"/>
    <xsl:param name="secret"/>
    
    <xsl:variable name="jboss" select="'urn:jboss:domain:'"/>


 <xsl:template match="//ds:subsystem/ds:server">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <https-listener name="default-ssl" socket-binding="https">
	    <xsl:attribute name="security-realm"><xsl:value-of select="$realmName"/></xsl:attribute>
            </https-listener>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
