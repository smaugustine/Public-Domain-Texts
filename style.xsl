<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">

  <xsl:output method="html" indent="no"/>

  <xsl:template match="tei:TEI">
    <html>
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>
          <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='gez']"/>
          <xsl:text> [</xsl:text>
          <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='en']"/>
          <xsl:text>]</xsl:text>
        </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.2/css/bulma.min.css"/>
        <style>
          @import url("https://fonts.googleapis.com/css2?family=Noto+Serif:wght@400;700");
          
          @font-face {
            font-family: "Noto Serif";
            font-weight: 400;
            src: local("Noto Serif Ethiopic"),
                 local("NotoSerifEthiopic-Regular"),
                 url("https://cdn.jsdelivr.net/gh/googlefonts/noto-fonts/hinted/ttf/NotoSerifEthiopic/NotoSerifEthiopic-Regular.ttf") format("truetype");
            unicode-range: U+1200-1380;
          }
          
          @font-face {
            font-family: "Noto Serif";
            font-weight: 600;
            src: local("Noto Serif Ethiopic"),
                 local("NotoSerifEthiopic-SemiBold"),
                 url("https://cdn.jsdelivr.net/gh/googlefonts/noto-fonts/hinted/ttf/NotoSerifEthiopic/NotoSerifEthiopic-SemiBold.ttf") format("truetype");
            unicode-range: U+1200-1380;
          }
          
          * {
            font-family: "Noto Serif", serif;
          }

          span.line:before {
            content: attr(data-num) ". ";
          }

          span.line {
            display: block;
          }
        </style>
      </head>
      <body>

        <div class="hero is-dark">
          <div class="hero-body">
            <div class="container">
              <p class="title"><a href="/">መልክአ፡ ጉባኤ፡</a></p>
              <p class="subtitle"><a href="/"><i>Malkǝʾa Gubāʾe</i> | The Image of the Assembly</a></p>
            </div>
          </div>
        </div>

        <section class="section">
          <div class="container">
            <div class="content">
              <p class="title">
                <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='gez']"/>
              </p>

              <xsl:apply-templates select="tei:text/tei:body/tei:div[@subtype='malke']"/>

              <xsl:if test="tei:text/tei:body/tei:div[@subtype='tarafa-malke']">
                <p class="subtitle" id="tarafa-malke">ተረፈ፡ መልክእ፡</p>
                <xsl:apply-templates select="tei:text/tei:body/tei:div[@subtype='tarafa-malke']"/>
              </xsl:if>
            </div>
          </div>
        </section>

        <footer class="footer">
          <div class="container">
            ©2021 <a href="https://augustinedickinson.com" target="_blank">Augustine Dickinson</a>.<br/>
            License: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC 4.0 BY-NC-SA</a>.
          </div>
        </footer>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="tei:lg">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="tei:l">
    <span class="line">
      <xsl:attribute name="data-num">
        <xsl:value-of select="../@n"/><xsl:text>.</xsl:text><xsl:value-of select="@n"/>
      </xsl:attribute>

      <xsl:if test="count(ancestor::tei:div[@subtype='malke'])>0">
        <xsl:attribute name="id">
          <xsl:value-of select="../@n"/><xsl:text>.</xsl:text><xsl:value-of select="@n"/>
        </xsl:attribute>
      </xsl:if>

      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>