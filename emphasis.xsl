<?xml version="1.0" encoding="UTF-8" ?>

<!--
Convert <b> and <span class="BodyWord">
to <span class="Emphasis"> in MadCap Flare

use: saxon -it:main -xsl:emphasis.xsl
-->

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:strip-space elements="*"/>

   <xsl:template match="b">
      <xsl:element name="span">
         <xsl:attribute name="class">Emphasis</xsl:attribute>
         <xsl:value-of select="@*|node()"/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="@class[.='BodyWord']">
      <xsl:attribute name="class">Emphasis</xsl:attribute>
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