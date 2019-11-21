<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 6
   Case Problem 2

   Karleton Manufacturing Style Sheet
   Author:
   Date:

   Filename:         spc.xsl
   Supporting Files:
-->


<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

   <xsl:template match="/">
      <html>
         <head>
            <title>Statistical Processing Control Results</title>
            <link href="kmstyles.css" rel="stylesheet" type="text/css" />
         </head>

         <body>
            <div id="wrap">
               <header>
                  <img src="kmlogo.png" alt="Karleton Manufacturing" />
               </header>

               <h1>Quality Control Analysis</h1>

             </div>
         </body>
      </html>

   </xsl:template>

   <xsl:template match="sample">
   </xsl:template>

   <xsl:template match="batch">
   </xsl:template>


</xsl:stylesheet>

