<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

  <xsl:template match="/">
    <Image>
      <ImageName>
        <xsl:value-of select="/annotation/filename"/>
      </ImageName>
      <xsl:element name="ImageObjects">
        <xsl:apply-templates select="/annotation/object"/>
      </xsl:element>
    </Image>
  </xsl:template>

  <xsl:template name="CreateImageObjects" match="object">
    <ImageObject>
      <FirstPoint>
        <X>
          <xsl:value-of select="./bndbox/xmin"/>
        </X>
        <Y>
          <xsl:value-of select="./bndbox/ymin"/>
        </Y>
      </FirstPoint>
      <LastPoint>
        <X>
          <xsl:value-of select="./bndbox/xmax"/>
        </X>
        <Y>
          <xsl:value-of select="./bndbox/ymax"/>
        </Y>
      </LastPoint>
    </ImageObject>
  </xsl:template>
</xsl:stylesheet>
