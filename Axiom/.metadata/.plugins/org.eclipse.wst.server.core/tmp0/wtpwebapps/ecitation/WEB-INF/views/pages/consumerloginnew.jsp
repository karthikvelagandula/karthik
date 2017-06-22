<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html lang="en">
<head>

<title>Metro Transit Court</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>

<script language="JavaScript">
	function setFocus() {
		try {
			document.inputForm.ticketNumber.focus();
		} catch (e) {
		}
	}
</script>

<body onload="javascript:setFocus();">
	<DIV id=pagebkg>
		<div class="user-login-5">
			<div class="page-content" style="background-color: #f5f3eb;">
				<table align="center">
					<tr>
						<td width="864" align="left">
							<!--<a href="http://www.metro.net" style="vertical-align: bottom">
<img src="/pbw/include/la_metro/images/mclogo.jpg" alt="Go to homepage" border="0"/>
</a>-->
							<div class="portlet-title">
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td valign="middle" class="topHeading"><b>Metro
												Transit Court</b></td>
									</tr>
									<tr>
										<td valign="top"><a
											href="https://www.metro.net/about/transit-court/"><img
												width="600px"
												src=<c:url value='/static/img/TransitCourt2.jpg'/>
												alt="Go to homepage" border="0" /></a></td>
										<td>&nbsp;&nbsp;&nbsp;</td>
										<td valign="top">
											<div id="sideContent" style="height: 200px;">
												<!-- <table class="contactHeader" width="300px" Height="25px"
										style="BACKGROUND: #EBC5FF;">
										<tr>
											<th align="left" class="bodySmall">&nbsp;Contact Us
											<th>
										</tr>
									</table>
									<table width="300px" Height="128px" cellpadding="2"
										cellspacing="2">
										<tr>
											<td class="bodyXSmall"><b>Hours of Operation: </b><br />
												Monday - Thursday 9am - 3pm <br /> Friday - Closed <br /></td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<td class="bodyXSmall"><b>Customer Service line<br />
													213.92COURT &nbsp;&nbsp; (213.922.6878)<br />
													Mon-Fri 8am - 5pm
											</b></td>
										</tr>
									</table> -->
												<div class="portlet box green bg-inverse" align="left">
													<div class="portlet-title"
														style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
														<div class="caption"
															style="width: -10px; font-size: 14px; padding-top: 2px; padding-bottom: 1px;">
															<b>Contact Us</b>
														</div>
													</div>
													<div class="portlet-body " style="padding: 6px;">
														<b>Hours of Operation: </b><br /> Monday - Thursday 9am -
														3pm <br /> Friday - Closed <br /> <b>Customer
															Service line<br /> 213.92COURT &nbsp;&nbsp;
															(213.922.6878)<br /> Mon-Fri 8am - 5pm
														</b>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div> <br /> <br /> <br /> <c:if test="${not empty errorMessage}">
								<div class="alert alert-danger">
									<span>${errorMessage}</span>
								</div>
							</c:if>
							<table width="864">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="2">
											<tr>
												<td><h3>
														<b> Online Violation Payment System </b>
													</h3></td>
											</tr>
											<tr>
												<td align="left" class="heading1a"><a
													href="${pageContext.request.contextPath}/consumerloginSpanish"><font
														color="blue"><u>Instrucciones de pago en
																español</u></font></a><br /></td>
											</tr>
											<tr>
												<td width="100%" class="bodySmall">To pay for your
													transit or parking violation online, please follow these
													directions:<br />

													<ol>
														<li>Select either Violation Number or Installment
															Payment Plan (IPP) Number and enter the number in the box
															provided.
															<ol type="a" style="font-weight: normal;">

																<li>The violation number is located on the top
																	right of your ticket. Transit violations start with T
																	and parking violations start with P.</li>
																<li>The IPP number is located on the bottom of your
																	Installment Payment Plan Enrollment Form.</li>
															</ol>
														</li>
														<li>Select the Submit button to begin the secure
															credit card payment process*. This link will take you to
															a secure website.</li>
														<li>Follow the instructions on the secured site to
															walk through the payment process.</li>
														<li>Wait for a confirmation page. The confirmation
															page may be printed for your records.</li>
													</ol>
												</td>
											</tr>
											<tr>
												<td class="bodySmall"><b>Please Note:</b>
													<ol>
														<li>Tickets may not be immediately available for
															payment after issuance. Tickets are usually available for
															online payment within a week from the date of issuance.</li>
														<li>The online payment system accepts Visa and
															MasterCard. Please have your credit card information
															available.</li>
														<li>For additional questions or instructions, you may
															contact Metro Transit Court at 213.92COURT (213.922.6878)
															between the hours of 8 am to 5 pm Pacific Time.</li>
														<li>Payments may also be mailed to:</li>
													</ol>

													<table width="100%" border="0" align="center"
														cellpadding="2" cellspacing="2">
														<tr>
															<td width="2%" class="bodySmall"></td>
															<td width="100%" class="bodySmall" valign="top"><b>
																	Metro Transit Court<br /> PO Box 866015<br /> Los
																	Angeles, CA 90086-6015<br />
															</b>Make check or money order payable to Metro Transit Court.
																Include violation number and license plate (applicable
																only for parking violations) on check or money order.</td>
														</tr>
													</table></td>
											</tr>
										</table>
										<table width="100%" border="0" align="center" cellpadding="10"
											cellspacing="10">
											<tr>
												<td class="bodySmall"><form:form id="consumerLoginForm"
														class="login-form" action="consumerlogin" method="post"
														modelAttribute="consumerLoginBean">
														<input type="hidden" name="clientcode" value="1M">
														<input type="hidden" name="requestType" value="submit">
														<input type="hidden" name="requestCount" value="1">
														<input type="hidden" name="clientAccount" value="9">

														<table border="0" cellpadding="0" cellspacing="0"
															align="left" width="100%">
															<tr>
																<td colspan="2"><br /></td>
															</tr>
															<tr>
																<td colspan="2"></td>
															</tr>
															<tr>
																<td colspan="2" valign="center"><font
																	class="bodySmall"> <!-- -->
																</font></td>
																<td colspan="2" valign="center"><font
																	class="bodySmall"> <!-- -->
																</font></td>
															</tr>
															<tr>
																<td colspan="2"><font class="bodySmall"> <!-- -->
																</font> <font class="bodySmall"> <!-- -->
																</font></td>
															</tr>
															<tr>
																<td valign="top"><font class="bodySmall"><b>Enter
																			Number Here and Select Type Below:</b></font> <br> <form:input
																		class="form-control placeholder-no-fix" type="text"
																		autocomplete="off" placeholder="Violation Number"
																		name="citationId" maxlength="16" path="citationId"
																		style="width:200px" /></td>
																<td valign="top"><font class="bodySmall"> <!-- -->
																</font></td>
															</tr>
															<tr>
																<td valign="top"><input type="radio"
																	name="paymentType" value="T" checked="checked" /> <font
																	class="bodySmall" disabled>Violation Number</font> <br>
																	<input type="radio" name="paymentType1" value="I"
																	disabled='disabled'> <font>Installment
																		Payment Plan (IPP) Number</font><br></td>
																<td><font class="bodySmall"> <!-- -->
																</font></td>
															</tr>


															<tr>
																<td valign="bottom" colspan="2">You must enter the
																	IPP number in order to make a payment toward your
																	installment plan.</td>
															</tr>



															<tr>
																<td colspan="2" align="left"><input
																	class="btn green btn-sm" type="submit" name="submit"
																	value="Submit"
																	onclick="document.inputForm.requestType.value='submit'"
																	class="field"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!-- -->




																</td>
															</tr>
															<tr>
																<td colspan="2"><br></td>
															</tr>
														</table>
													</form:form></td>
											</tr>
										</table> <!-- <table width="100%" border="0" align="center" cellpadding="2"
									cellspacing="2">
									<tr>
										<td><font size="2">*This site has a <a class="red"
												href="javascript:checkVerisignCert()">Verisign Secure
													Site Certificate. </a></font></td>
									</tr>
								</table> -->

									</td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</div>
		</div>
	</DIV>
</body>
</html>