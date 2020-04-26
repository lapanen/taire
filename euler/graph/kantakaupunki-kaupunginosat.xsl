<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:g="http://graphml.graphdrawing.org/xmlns">

  <xsl:output
      omit-xml-declaration="no"
      method="xml"
      indent="yes"
      standalone="yes"/>

  <xsl:template match="/">

    <graphml xmlns="http://graphml.graphdrawing.org/xmlns">

      <xsl:comment>
        Created by an XSL Transformation from a GraphML
        source file; probably best not edit manually.
      </xsl:comment>

      <xsl:for-each select="/g:graphml/g:key">
        <xsl:copy-of select="."/>
      </xsl:for-each>

      <xsl:for-each select="/g:graphml/g:graph">

        <xsl:element name="graph">

          <xsl:copy-of select="./@*"/>

          <xsl:for-each select="./g:node">
            <xsl:element name="node">
              <xsl:for-each select="./g:desc|g:data|@*">
                <xsl:copy-of select="."/>
              </xsl:for-each>
            </xsl:element>
          </xsl:for-each>

          <xsl:for-each select="./g:edge">
            <xsl:copy-of select="."/>
          </xsl:for-each>
        </xsl:element>

      </xsl:for-each>

    </graphml>

  </xsl:template>

</xsl:stylesheet>