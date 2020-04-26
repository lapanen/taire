<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:g="http://graphml.graphdrawing.org/xmlns">

  <xsl:output
      omit-xml-declaration="yes"
      method="html"
      indent="yes"
      standalone="yes"/>

  <xsl:template match="/">

    <html>
      <head>
        <title>Lapaset</title>
      </head>

      <body>

        <xsl:for-each select="/g:graphml/g:graph/g:node">
          <xsl:variable name="node-id">
            <xsl:value-of select="./@id"/>
          </xsl:variable>
          <h1>
            <xsl:attribute name="id">
              <xsl:value-of select="./@id"/>
            </xsl:attribute>
            <xsl:value-of select="./g:data[@key='name.fi']/text()"/>
          </h1>
          <xsl:if test="/g:graphml/g:graph/g:edge[@target=$node-id or @source=$node-id]">
            <h2>Naapurit</h2>
            <ul>
              <!-- TODO: get rid of duplicates, smg like this: and not(@source=preceding::g:edge/@source and @target=preceding::g:edge/@target) ?? -->
              <xsl:for-each select="/g:graphml/g:graph/g:edge[(@target=$node-id or @source=$node-id)]">
                <xsl:variable name="neighbor-id">
                  <xsl:choose>
                    <xsl:when test="$node-id = @source">
                      <xsl:value-of select="./@target"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="./@source"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                <li>
                  <a>
                    <xsl:attribute name="href">
                      <xsl:text>#</xsl:text><xsl:value-of select="$neighbor-id"/>
                    </xsl:attribute>
                    <xsl:value-of select="/g:graphml/g:graph/g:node[@id=$neighbor-id]/g:data[@key='name.fi']/text()"/>
                  </a>
                </li>
              </xsl:for-each>
            </ul>
          </xsl:if>
        </xsl:for-each>

      </body>

    </html>

  </xsl:template>

</xsl:stylesheet>