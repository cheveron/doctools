<?xml version="1.0" encoding="UTF-8" ?>

<!--
Convert <H1>s to "Sentence case" in MadCap Flare
use: saxon -it:main -xsl:sc.xsl
-->

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:strip-space elements="*"/>

   <xsl:template match="h1">
      <xsl:element name="h1">
         <xsl:value-of select="substring(upper-case(.),1,1)"/>
         <xsl:value-of select="substring(lower-case(.),2)"/>
      </xsl:element>
   </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy>
  </xsl:template>

<xsl:template name="main">
  <xsl:for-each select="collection('.?select=*.htm;recurse=yes')">
    <xsl:result-document href="output/{tokenize(document-uri(.))}">
      <xsl:apply-templates select="."/>
    </xsl:result-document>
  </xsl:for-each>
</xsl:template>

</xsl:transform>
