<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/hash/results">
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
            <th><xsl:value-of select="gcd"/></th>
            <th><xsl:value-of select="lcm"/></th>
          </tr>
        </table>
      </div>
  </xsl:template>
  <xsl:template match="/hash/error-msg">
    <h3 class="text-danger"><xsl:value-of select="/"/></h3>
  </xsl:template>
</xsl:stylesheet>
