<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:x="http://sunpro.io/ColoredDNA">
  <xsl:output indent="yes" method="html" encoding="utf-8"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="x:Sequence">
    <html>
      <head>
        <title>DNA</title>
        <style>
          .A {
          color: red;
          }
          .G {
          color: blue;
          }
          .C {
          color: gray;
          }
          .T {
          color: green;
          }
        </style>
      </head>
      <body>
        <p>
          <xsl:variable name="norm" select="normalize-space(text())"/>
          <xsl:call-template name="dnacolor">
            <xsl:with-param name="current" select="$norm" />
          </xsl:call-template>
        </p>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="dnacolor">
    <xsl:param name="current" />
    <xsl:variable name="c" select="substring($current,1,1)"/>
    <span>
      <xsl:attribute name="class">
        <xsl:value-of select="$c"/>
      </xsl:attribute>
      <xsl:value-of select="$c"/>
    </span>
    <xsl:if test="string-length($current) > 1">
      <xsl:call-template name="dnacolor">
        <xsl:with-param name="current" select="substring($current,2)" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>