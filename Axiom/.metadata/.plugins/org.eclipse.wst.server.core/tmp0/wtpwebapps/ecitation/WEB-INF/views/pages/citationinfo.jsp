<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<div class="page-content">
		<br /> <br />
		<div class="page-bar">
			<ul class="page-breadcrumb">
				<li><a style="margin-left: 50px;"
					href="${pageContext.request.contextPath}/citationlist"><spring:message
							code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message
							code="lbl.topmenu.tab.citation.info" /></span></li>
			</ul>
			<!--<div class="btn green" style="width:100px;float:right;margin-bottom:20px;"><a href="getCitationId.action?citationId=${citationObj.citationId}" style="text-decoration:none;color:#fff;"><i class="fa fa-plus">&nbsp;&nbsp;<b>Calendar</b></i></a></div>-->
			<!-- END PAGE HEADER-->
			<div style="display: none" id="uil-default-css-id"
				class='uil-default-css' style='transform:scale(1);'>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(0deg) translate(0, -60px); transform: rotate(0deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(30deg) translate(0, -60px); transform: rotate(30deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(60deg) translate(0, -60px); transform: rotate(60deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(90deg) translate(0, -60px); transform: rotate(90deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(120deg) translate(0, -60px); transform: rotate(120deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(150deg) translate(0, -60px); transform: rotate(150deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(180deg) translate(0, -60px); transform: rotate(180deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(210deg) translate(0, -60px); transform: rotate(210deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(240deg) translate(0, -60px); transform: rotate(240deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(270deg) translate(0, -60px); transform: rotate(270deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(300deg) translate(0, -60px); transform: rotate(300deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
				<div
					style='top: 80px; left: 93px; width: 14px; height: 40px; background: #00b2ff; -webkit-transform: rotate(330deg) translate(0, -60px); transform: rotate(330deg) translate(0, -60px); border-radius: 10px; position: absolute;'></div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body form">

						<!-- END SEARCH FORM-->
						<div class="row">
							<div class="col-md-12">
								<!-- BEGIN EXAMPLE TABLE PORTLET-->
								<div class="portlet-title" style="margin-left: 20px;">
									<div class="portlet-title">
										<div class="caption">
											<span class="caption-subject font-blue sbold uppercase">Violation
												Info</span>
										</div>
									</div>

									<div class="portlet-body">





										<div class="row" style="margin-bottom: 50px;">
											<div class="col-md-12">
												<div class="form-body">
													<div class="form-group">
														<div class="col-md-12">


															<table class="table  table-hover table-bordered table-sm"
																id="sample_editable_1">
																<thead>
																	<tr>
																		<th>Violation&nbsp;Number</th>
																		<th>Status&nbsp;/&nbsp;Issued On</th>
																		<c:choose>
																			<c:when
																				test="${citationInfo.citationType == 'Transit' }">
																				<th>Name</th>
																				<th>Address</th>
																			</c:when>
																			<c:otherwise>
																				<th>Plate&nbsp;Details</th>
																			</c:otherwise>
																		</c:choose>
																		<th>Violation&nbsp;Code&nbsp;&&nbsp;Description</th>
																		<th>Violation&nbsp;Location</th>
																		<th>Fine&nbsp;Amt</th>
																		<th>Penalties</th>
																		<th>Total&nbsp;Due</th>
																	</tr>
																</thead>
																<tbody>
																	<c:choose>
																		<c:when test="${empty citationInfo}">
																			<tr>
																				<td colspan="6" align="center"><b>No
																						results found</b></td>
																			</tr>
																		</c:when>
																		<c:otherwise>
																			<tr>
																				<td><b><a onclick="enablePageLoadBar()"
																						style="color: #32c5d2"
																						href="<c:url value='/citationview/${citationInfo.citationId}' />">
																							<c:out value="${citationInfo.citationId}" />
																					</a></b> <!-- <a href=""> <img
																		border="0" alt="Documents" src=<c:url value='/static/img/preview.png' />
																		width="25" height="25">
																</a> --></td>
																				<td><c:choose>
																						<c:when test="${citationInfo.status == 'VIOD'}">
																							<b><c:out value="CLOSED - VOID" /></b>
																						</c:when>
																						<c:when test="${citationInfo.status == 'OVERPAID'}">
																							<b><c:out value="CLOSED - OVERPAID" /></b>
																						</c:when>
																						<c:otherwise>
																							<b><c:out value="${citationInfo.status}" /></b>
																						</c:otherwise>
																					</c:choose> / <c:out value="${citationInfo.dateOfViolation}" /></td>
																				<c:choose>
																					<c:when
																						test="${citationInfo.citationType == 'Transit' }">
																						<td><c:out
																								value="${citationInfo.patron.firstName}" /> <c:out
																								value="${citationInfo.patron.lastName}" /></td>
																						<td><c:out
																								value="${citationInfo.patron.address.formattedAddress}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td><c:out
																								value="${citationInfo.plateEntity.licenceNumber}" /></td>
																					</c:otherwise>
																				</c:choose>
																				<td><c:out
																						value="${citationInfo.violationCode.code}" />/<c:out
																						value="${citationInfo.violationCode.description}" />
																				</td>
																				<td><c:out value="${citationInfo.location}" /></td>
																				<td><b><font color="#32c5d2"><c:out
																								value="${citationInfo.penaltyAmt}" /></font></b></td>
																				<c:choose>
																					<c:when
																						test="${citationInfo.totalPenaltyAmount == '0' }">
																						<td><b><font color="#32c5d2">$<c:out
																										value="0.00" /></font></b></td>
																					</c:when>
																					<c:otherwise>
																						<td><b><font color="#32c5d2">$<c:out
																										value="${citationInfo.totalPenaltyAmount}" /></font></b></td>
																					</c:otherwise>
																				</c:choose>
																				<c:choose>
																				<c:when
																						test="${citationInfo.totalDue == '0' }">
																						<td><b><font color="#32c5d2">$<c:out
																										value="0.00" /></font></b></td>
																					</c:when>
																					<c:otherwise>
																						<td><b><font color="#32c5d2">$<c:out
																										value="${citationInfo.totalDue}" /></font></b></td>
																					</c:otherwise>
																				</c:choose>
																				<c:if
																					test="${citationInfo.status!='PAID' && citationInfo.status!='CLOSED' &&citationInfo.status!='VIOD' && citationInfo.status!='OVERPAID' && citationInfo.totalDue>0.00}">
																					<td><b><a style="color: #32c5d2"
																							href="<c:url value='/payment/${citationInfo.citationId}' />">Pay</a></b>
																					</td>
																				</c:if>
																			</tr>
																		</c:otherwise>
																	</c:choose>
																</tbody>
															</table>

															<!-- Payment Acknowledgement -->
															<c:if test="${not empty errorMessagePayment}">
																<div class="alert alert-info">
																	<span>${errorMessagePayment}</span>
																</div>
																<c:choose>
																	<c:when test="${empty payedInfo}">
																		<tr>
																			<td colspan="6" align="center"><b>No Receipt
																					found</b></td>
																		</tr>
																	</c:when>
																	<c:otherwise>
																		<div style="margin-left: 300px; width: 50%;">
																			<div id="printContentId">
																				<table style="font-weight: bold"
																					class="table table-bordered table-hover">

																					<tbody>
																						<tr>
																							<td
																								style="background-color: #26A1AB; color: #fff"
																								colspan="2" align="center">Payment
																								Acknowledgement</td>
																						</tr>

																						<tr>
																							<td style="width: 50%">Transaction Number</td>
																							<td>${payedInfo.transaction.transcationId}</td>
																						</tr>
																						<tr>
																							<td style="width: 50%">Citation Id</td>
																							<td>${payedInfo.citation.citationId}</td>
																						</tr>
																						<tr>
																							<td style="width: 50%">Name</td>
																							<td>${payedInfo.citation.patron.firstName}&nbsp;${payedInfo.citation.patron.lastName}</td>
																						</tr>
																						<tr>
																							<td style="width: 50%">Payment Amount</td>
																							<td>${payedInfo.amount}</td>
																						</tr>
																						<tr>
																							<td style="width: 50%">Payment Type</td>
																							<td>${payedInfo.paymentMethod.description}</td>
																						</tr>

																					</tbody>
																				</table>
																			</div>
																		</div>
																		<div style="margin-left: 590px;">
																			<button class="btn green btn-sm icon-printer"
																				onclick="printAcknowledgement('printContentId')">
																				<b>Print</b>
																			</button>
																		</div>

																	</c:otherwise>
																</c:choose>
															</c:if>
														</div>
													</div>
												</div>
											</div>
										</div>



									</div>
								</div>
								<!-- END EXAMPLE TABLE PORTLET-->
							</div>
						</div>
						<!-- END PAGE BAR -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT BODY -->
<!-- END CONTENT -->
<!-- END CONTAINER -->
<!-- Modal -->

<!-- fim Modal-->
<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>

<script type="text/javascript">
	function printAcknowledgement(printContentId) {
		var preContent = "<div style='background-color:#fff'>";
		var postContent = "</div>";
		var bodyContent = document.all.item(printContentId).innerHTML;
		var currBodyCon = document.body.innerHTML;
		document.body.innerHTML = preContent + bodyContent + postContent;
		window.print();
		document.body.innerHTML = currBodyCon;
	}
</script>

<style type='text/css'>
@
-webkit-keyframes uil-default-anim { 0% {
	opacity: 1
}

100%
{
opacity
:
 
0
}
}
@
keyframes uil-default-anim { 0% {
	opacity: 1
}

100%
{
opacity
:
 
0
}
}
.uil-default-css>div:nth-of-type(1) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: -0.5s;
	animation-delay: -0.5s;
}

.uil-default-css {
	position: absolute;
	top: 100px;
	left: 600px;
	background: none;
	width: 200px;
	height: 200px;
	z-index: 999
}

.uil-default-css>div:nth-of-type(2) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: -0.4166666666666667s;
	animation-delay: -0.4166666666666667s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(3) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: -0.33333333333333337s;
	animation-delay: -0.33333333333333337s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(4) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: -0.25s;
	animation-delay: -0.25s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(5) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: -0.16666666666666669s;
	animation-delay: -0.16666666666666669s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(6) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: -0.08333333333333331s;
	animation-delay: -0.08333333333333331s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(7) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: 0s;
	animation-delay: 0s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(8) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: 0.08333333333333337s;
	animation-delay: 0.08333333333333337s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(9) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: 0.16666666666666663s;
	animation-delay: 0.16666666666666663s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(10) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: 0.25s;
	animation-delay: 0.25s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(11) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: 0.33333333333333337s;
	animation-delay: 0.33333333333333337s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(12) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: 0.41666666666666663s;
	animation-delay: 0.41666666666666663s;
}

.uil-default-css {
	position: absolute;
	background: none;
	width: 200px;
	height: 200px;
}
</style>

<script>
document.onreadystatechange = function () {
  var state = document.readyState;
  if (state == 'interactive') {
      document.getElementById('uil-default-css-id').style.display="block";
  }
  if (state == 'complete') {
         document.getElementById('uil-default-css-id').style.display="none";
  }
}
</script>
<script>
function enablePageLoadBar() {
	document.getElementById('uil-default-css-id').style.display="block";
}
</script>
