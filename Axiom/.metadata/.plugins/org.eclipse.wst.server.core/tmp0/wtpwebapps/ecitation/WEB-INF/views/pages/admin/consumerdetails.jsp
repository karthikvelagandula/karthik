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
								<table cellpadding="0" cellspacing="0" style="margin-top: 5px;">
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
										<td>&nbsp;&nbsp;&nbsp;<br></td>
										<td valign="top">
											<div id="sideContent" style="height: 200px;">
												<!-- <table class="contactHeader" width="300px" Height="25px"
													style="BACKGROUND: #EBC5FF;">
													<tr>
														<th align="left" class="bodySmall" style="padding: 8px">&nbsp;Contact
															Us
														<th>
													</tr>
												</table>
												<table width="300px" Height="128px" cellpadding="2"
													cellspacing="2">
													<tr>
														<td class="bodyXSmall" style="padding: 8px"><b>Hours
																of Operation: </b><br /> Monday - Thursday 9am - 3pm <br />
															Friday - Closed <br /></td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<tr>
														<td class="bodyXSmall" style="padding: 0px 0px 8px 8px"><b>Customer
																Service line<br /> 213.92COURT &nbsp;&nbsp;
																(213.922.6878)<br /> Mon-Fri 8am -
																5pm
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
														3pm <br /> Friday - Closed<br /> <b>Customer Service
															line<br /> 213.92COURT &nbsp;&nbsp; (213.922.6878)<br />
															Mon-Fri 8am - 5pm
														</b>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<table width="900">
								<tr>
									<td>
										<table width="72%" border="0" cellpadding="2" cellspacing="2">
										</table>
									</td>
								</tr>
								<tr>
									<td><font class="bodySmall"><b>Please verify
												the information below.</b></font><br />
										<div class="row">
											<div class="col-md-6">
												<div>
													<input id="infoCorrect" type="checkbox" name="ticketInfo"
														value="yes"> <font color="#32c5d2"
														class="registerAns"><b>Yes, this information is
															correct.</b></font>
												</div>
											</div>
											<div class="col-md-6" style="padding-right: 2px;">
												<div>
													<a href="<c:url value='/consumerlogin' />"
														style="text-decoration: none; color: #fff;"><button
															type="button" class="btn green btn-sm"
															style="width: 60px; float: right;">Back</button></a>
												</div>
											</div>
										</div> <span>&nbsp;<form:errors name="ticketInfo"
												cssClass="alert-danger" /> <span class="alert-danger"
											id="infoCorrectError"></span>
									</span></td>
									<td><font class="bodySmall"> <!-- -->
									</font></td>
								</tr>
								<tr>
									<td><font class="bodySmall"><b>Violation:
												${citationId}</b><br> You have a total of <b>1</b>
											violation(s) on your account. </font></td>
								</tr>

								<tr>
									<td width="100%" class="bodySmall" valign="top"><br>
									<b> </b> The amount of the violation entered is: <b></b><b>${consumer.penaltyAmt}</b><br>
										The total amount of your violation(s) is: <b>$</b><b>${consumer.totalDue}</b><br>
										<br>
									<b>Please select from the following: </b></td>
								</tr>
								<tr>
									<td>
										<table width="72%" border="0" cellpadding="2" cellspacing="2">
											<tr>
												<td><input id="violationPay" type="radio"
													name="consumerdetails1" value="T1" /> <font
													class="bodySmall">I would like to pay for this
														violation only</font> <span>&nbsp;<form:errors
															name="consumerdetails1" cssClass="alert-danger" /> <span
														class="alert-danger" id="consumerdetails1Error"></span>
												</span></td>
										</table>
									</td>
								</tr>
								<tr>
									<td>

										<table style="margin-top: 25px;"
											class="table  table-bordered table-hover table-checkable order-column"
											id="sample_editable_1">
											<thead>
												<tr>
													<th width="14%">Violation Number</th>
													<th width="14%">Issue&nbsp;Date</th>
													<th width="14%">Violation</th>
													<th width="14%">Location</th>
													<th width="14%">Total&nbsp;Due</th>
												</tr>
												<tr>
													<td width="14%"><c:out value="${consumer.citationId}" /></td>
													<td width="14%"><c:out
															value="${consumer.dateOfViolation}" />&nbsp; <c:out
															value="${citationForm.timeofViolation}" /></td>
													<td width="14%"><c:out
															value="${consumer.citationType}" /></td>
													<td width="14%"><c:out value="${consumer.location}" /></td>
													<td width="14%">$<c:out value="${consumer.totalDue}" /></td>
												</tr>

											</thead>
										</table>
								<tr>
									<td colspan="5" align="right"><b><font
											class="bodySmall">Total Payment:&nbsp;</font> <font
											class="bodySmall"><b>$</b>${consumer.totalDue}</font></b></td>
								</tr>
								<tr>
									<td>
										<div class="col-md-12">
											<div class="page-content">
												<!-- BEGIN PAGE HEADER-->
												<br />
												<!-- END PAGE HEADER-->
												<span id="showPayButton"> <c:if
														test="${consumer.status!='PAID' && consumer.status!='CLOSED'&&consumer.status!='VIOD' && consumer.status!='OVERPAID' && consumer.totalDue>0.00}">
                    &nbsp;						<a
															href="${pageContext.request.contextPath}/consumerpayment"
															style="text-decoration: none; color: #fff;"><button
																type="button" class="btn green btn-sm"
																style="width: 150px;" id="checkpay">Pay</button></a>
													</c:if>
												</span>

												<!-- <a href="javascript:void(0)"><button type="button"
														class="btn green btn-sm" style="width: 200px;">Community
														Service</button></a> -->
												<c:if
													test="${transitSchool!='false' && consumer.status!='PAID' && consumer.status!='CLOSED' &&consumer.status!='VIOD' && consumer.status!='OVERPAID' && consumer.totalDue>0.00}">
													<a data-toggle="modal" href="#myModal"><button
															type="button" class="btn green btn-sm"
															style="width: 200px;">Transit School</button></a>
												</c:if>
												<%-- <a href="${pageContext.request.contextPath}/consumercorrespondance/<%= session.getAttribute("citationId") %>"><button type="button" class="btn btn-primary btn-sm" style="width:200px;">Correspondence</button></a> --%>
												<!-- <a href="javascript:void(0)"><button type="button" class="btn btn-primary btn-md" style="width:250px;">Change Hearing Time</button></a> -->
											</div>
										</div> <br>
									<br>
										<div class="modal" id="myModal" tabindex="-1" role="dialog"
											aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<a href="#" class="close" data-dismiss="modal">&times;</a>
														<h4 class="modal-title" id="myModalLabel">
															<i class="text-muted fa fa-university"></i>Transit School
														</h4>
													</div>
													<div class="modal-body">
														<table class="pull-left col-md-10 "
															style="margin-left: 55px;">
															<tbody>
																<tr>
																	<td>&nbsp;</td>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td><strong>Last Name</strong></td>
																	<td><input class="form-control input-sm"
																		name="name" id="name" style="width: 200px"></input> <span
																		id="lnameMismatch"
																		style="color: red; font-size: 12px;"></span> <input
																		type="hidden" value="${consumer.patron.lastName}"
																		id="hiddenLastName" /></td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																	<td>&nbsp;</td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																	<td><button type="button"
																			class="btn btn-primary btn-md" style="width: 150px;"
																			onclick="checkLastName()">Transit School</button></td>
																</tr>
															</tbody>
														</table>
														<div class="modal-footer">
															<div class="text-right pull-right col-md-3"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>

							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</DIV>


	<script
		src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
		type="text/javascript"></script>

	<script type="text/javascript">
    /*  
     $("#infoCorrect").change(function() {
    	    if(this.checked) {
    	        if($('#violationPay').is(':checked')) {  $('#showPayButton').show(); }
    	    }else {
    	    	$('#showPayButton').hide();
    	    }
    	});
     
     $("#violationPay").change(function() {
    	 if($('#violationPay').is(':checked')) {
    		 if($('#infoCorrect').is(':checked')) {
    			 $('#showPayButton').show();
    		 }
    	 }else {
    		 $('#showPayButton').hide();
    	 }
     }); */
     $(document).ready(function() {
    	 document.getElementById('infoCorrectError').innerHTML = '';
    	 document.getElementById('consumerdetails1Error').innerHTML = '';
    	    $("#checkpay").click(function(){
    	    	if(!$('#infoCorrect').is(':checked')) {
    	    		document.getElementById('infoCorrectError').innerHTML = 'Select Check Box';
    	    		document.getElementById('infoCorrect').focus();
    	    		return false;
       		    }
    	    	else{
    	    		document.getElementById('infoCorrectError').innerHTML = '';
    	    	}
    	    	if(!$('#violationPay').is(':checked')){
    	    		document.getElementById('consumerdetails1Error').innerHTML = 'Select Radio Button';
    	    		document.getElementById('violationPay').focus();
    	    		return false;
    	    	}
    	    	else{
    	    		document.getElementById('consumerdetails1Error').innerHTML = '';
    	    	}
    	    	
    	    }); 
    	});
</script>
	<script>
function checkLastName() {
    var lname = document.getElementById('hiddenLastName').value;
    var userSelName = document.getElementById('name').value;
    var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
    userSelName = userSelName.replace(rtrim, '');
    lname = lname.toUpperCase();
    userSelName = userSelName.toUpperCase();
    if(lname == userSelName) {
        window.location.href = '${pageContext.request.contextPath}/transit';
    }else {
        document.getElementById('lnameMismatch').innerHTML = 'Please enter valid last name';
    }    
}
</script>

</body>
</html>