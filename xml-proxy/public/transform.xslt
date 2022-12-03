<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/results">
    <html>
      <head>
        <title>Rails Labs</title>
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        <link href="{style}" rel="stylesheet"/>
      </head>

      <body class="container-fluid">
        <div class="row bg-primary">
          <h1 class="col-6 mt-3 text-light">Euclid's Algorithm</h1>
        </div>
        <div class="row">
          <div id="result">
            <table class="table">
              <tr>
                <th>Iteration</th>
                <th>First number</th>
                <th>Second number</th>
              </tr>

              <tr>
                <th>Initial</th>
                <th><xsl:value-of select="first"/></th>
                <th><xsl:value-of select="second"/></th>
              </tr>

              <xsl:for-each select="steps/step">
                <tr>
                  <td><xsl:value-of select="index"/></td>
                  <td><xsl:value-of select="first"/></td>
                  <td><xsl:value-of select="second"/></td>
                </tr>
              </xsl:for-each>

              <tr>
                <th>Operation</th>
                <th>Greatest common denominator</th>
                <th>Least common Multiple</th>
              </tr>

              <tr>
                <th>Result</th>
                <th><xsl:value-of select="result/gcd"/></th>
                <th><xsl:value-of select="result/lcm"/></th>
              </tr>
            </table>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
