<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 6
   Case Problem 1

   Voter Web Style Sheet
   Author: Joshua Carpentier
   Date:   4/3/2019
   Filename:         election.xsl
   Supporting Files:

 4. Scroll down to the candidate template at the bottom of the file. The candidate template will
display a table row containing the names of each candidate and votes he or she received, as
well as a bar whose length is equal to the vote percentage of the candidate. At the top of the
template, create the following local variables:

	a. candidateVotes equal to the number of votes placed for the current candidate with the value
	“sum(votes)”

	b. totalVotes equal to the number of votes placed within the current district with the value
	“sum(..//votes)”

	c. candidatePercent containing the percent of votes assigned to the candidate, calculated by
	dividing candidateVotes by totalVotes

	d. candidateName containing the name of the candidate, determined by looking
	up the value of the name element in the candidateInfo node set using the value
	“$candidateInfo[@candidateID=current()/@candidateID]/name”

	e. candidateParty containing the party affiliation of the candidate, obtained by looking up the
	party element for the matching candidate in the candidateInfo node set using the value
	“$candidateInfo[@candidateID=current()/@candidateID]/party”

5. Write the following HTML code within the <tr> element in the candidate template:
<th>
 candidateName (candidateParty)
</th>
 where candidateName is the value of the candidateName variable and candidateParty is the
value of the candidateParty variable.

 6.	 Add the following code to the table row:
<th>
 candidateVotes (candidatePercent)
</th>
 where candidateVotes is the value of the candidateVotes variable displayed with the
‘###,##0’ number format and candidatePercent is the value of the candidatePercent variable
displayed with the ‘#0.0%’ number format.

7.	 Create the bar that displays the percentage of votes given to the candidate by adding the
following table data cell to the table row:
<td>
 drawCells
</td>
 where drawCells calls the drawCells template using two parameter values: cellCount equal to
the value of the candidatePercent variable multiplied by 100 and rounded to the nearest integer,
and party equal to the value of the candidateParty variable.

8.	 Close the election.xsl file, saving your changes.

9. View the results of the transformation by opening the congress.xml file in your web browser.
Verify that the layout and content of your web page resembles that shown in Figure 6-48.

-->


<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

<xsl:variable name="candidateInfo" select="/candidates/candidate" />

   <xsl:template match="/">
      <html>
         <head>
            <title>Minnesota Congressional Election Results</title>
            <link href="vwstyles.css" rel="stylesheet" type="text/css" />
         </head>

         <body>
            <div id="wrap">
               <header>
                  <img src="vwlogo.png" alt="Voter Web" />
               </header>

               <h1>Minnesota Congressional Election Results</h1>

               <section id="votingResults">
                  <xsl:apply-templates select="congressResults/district" />
               </section>

             </div>
         </body>
      </html>
   </xsl:template>

   <xsl:template match="district">
      <h2>District <xsl:value-of select="@dNumber" /></h2>
      <table class="electionTable">
         <thead>
            <tr>
               <th>Candidate</th>
               <th>Votes</th>
            </tr>
         </thead>
         <tbody>
            <xsl:apply-templates select="candidates/candidate" />
         </tbody>
      </table>
   </xsl:template>

   <xsl:template match="candidate">
      <tr>

      </tr>
   </xsl:template>

   <xsl:template name="drawCells">
      <xsl:param name="cellCount" />
      <xsl:param name="party" />
      <xsl:if test="$cellCount > 0">
         <td class="{$party}"></td>
         <xsl:call-template name="drawCells">
            <xsl:with-param name="cellCount" select="$cellCount - 1" />
            <xsl:with-param name="party" select="$party" />
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

</xsl:stylesheet>

