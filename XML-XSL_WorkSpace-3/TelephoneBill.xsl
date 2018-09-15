<?xml version="1.0" encoding="UTF-8"?>

<!--Author: Sneha Patel(000783907)
 Title of Work: Write an xsl stylesheet, so it outputs the data to a format similar 
                to the screen shot in this document after it is transformed in XMLSpy.-->
                
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <!--we have to use "/" to match for abstract data from telephoneBill XML file-->
	<xsl:template match="/">
		<html>
			<head>
				<title> About Telephone Bill </title>
			</head>
			<body>
				<h2 align="center"> Customer Info </h2>
				<br/>
				<h4> Name :<xsl:value-of select="telephoneBill/customer/name"/>
				</h4>
				<h4> Address :<xsl:value-of select="telephoneBill/customer/address"/>
				</h4>
				<h4> City : <xsl:value-of select="telephoneBill/customer/city"/>
				</h4>
				<h4> Province : <xsl:value-of select="telephoneBill/customer/province"/>
				</h4>
				<br/>
				<!--Table to display Called No., Date, Duration in minutes and Charge with border 1 and cellpadding 8-->
				<table border="1" cellpadding="8">
					<tbody>
						<tr>
						    <!--Heading of Table's Content-->
							<th> Called Number </th>
							<th> Date </th>
							<th> Duration in Minutes </th>
							<th> Charge </th>
						</tr>
						
						<!--Select details of table's content from telephoneBill XML file-->
						<xsl:for-each select="telephoneBill/call">
						
						    <!--To make table's content in center-->
							<tr align="center">
							
							    <!--to give background to alternate row of table we can use if test function-->
								<xsl:if test="position() mod 2=0">
									<xsl:attribute name="bgcolor">#EAEAEA</xsl:attribute>
								</xsl:if>
								
								<!--As call child has attributes with number,date,duration in minutes and charge 
                                    we have to use "@" to abstract data from attribute of telephoneBill XML file-->
								<td>
									<xsl:value-of select="@number"/>
								</td>
								<td>
									<xsl:value-of select="@date"/>
								</td>
								<td>
									<xsl:value-of select="@durationInMinutes"/>
								</td>
								<td>
									<xsl:value-of select="@charge"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
