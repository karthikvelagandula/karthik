<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">
		<br /> <br />
		<!-- BEGIN PAGE HEADER-->
		<div class="page-bar">
			<ul class="page-breadcrumb">
				<li><a style="margin-left: 50px;"
					href="${pageContext.request.contextPath}/paymentDetails/${citationId}"><spring:message
							code="lbl.topmenu.tab.payment.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message
							code="lbl.topmenu.tab.payment.entry" /></span></li>
			</ul>

		</div>
		<!-- END PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable-line boxless tabbable-reversed">
					<div id="citationPortlet" class="portlet box green bg-inverse">
						<div class="portlet-title">
							<div class="caption">Payment Details Form</div>
						</div>
						<div class="portlet-body form">
							<c:if test="${not empty errorInfo}">
								<div class="alert alert-danger">
									<span>${errorInfo}</span>
								</div>
							</c:if>
							<!-- BEGIN FORM-->
							<form:form id="paymentDetailsForm"
								onsubmit="return validatePaymentDetails()"
								action="${pageContext.request.contextPath}/paymentDetails"
								modelAttribute="paymentDetailsForm" method="POST">
								<div class="form-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Violation
													Number</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm">
														<form:input type="text" path="citation.citationId"
															class="form-control" readonly="true" disable="disabled"
															value="${citationId}" />
													</div>
												</div>
											</div>
										</div>
										<br />
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3"></label>
												<div class="col-md-9">
													<div class="input-group input-group-sm">
														<form:input type="hidden" path="id" class="form-control"
															readonly="true" disable="disabled" />
													</div>
												</div>
											</div>
											<span class="help-block">&nbsp;</span>
										</div>
										<!--/span-->
									</div>
									<!--/row-->

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Payment
													Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-end-date="0d"
														data-date-viewmode="years">
														<form:input path="paymentDate" class="form-control"
															readonly="false" id="paymentDate" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
													<!-- /input-group -->
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Amount</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="amount"
														placeholder="Amount" id="paymentAmount"></form:input>
													<span class="help-block"><span class="alert-danger"
														id="paymentAmountError"></span></span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>

									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Payment
													Type</label>
												<div class="col-md-9">
													<form:select id="paymentMethod" path="paymentMethod.typCd"
														class="form-control input-sm">
														<c:forEach items="${paymentMethods}" var="paymentMethod">
															<form:option value="${paymentMethod.typCd}"
																label="${paymentMethod.description}"></form:option>
														</c:forEach>
													</form:select>
													<!-- /input-group -->
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Account</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="account"
														placeholder="Account"></form:input>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Processed
													on</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-end-date="0d"
														data-date-viewmode="years">
														<form:input path="processedOn" class="form-control"
															readonly="false" id="processedOn" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
													<!-- /input-group -->
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">User
													Name</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="processedBy" placeholder="User Name" readonly="true"></form:input>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">IPP</label>
												<div class="col-md-3">
													<div class="mt-radio-inline">
														<label class="mt-radio label-sm"> <form:radiobutton
																path="ipp" id="optionsRadios25" value="true" />Yes <span></span>
														</label> <label class="mt-radio label-sm"> <form:radiobutton
																path="ipp" id="optionsRadios26" value="false" />No <span></span>
														</label>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Over
													Paid</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="overPaid"
														placeholder="Over Paid" id="paymentOverPaid"></form:input>
													<span class="help-block"> <span class="alert-danger"
														id="paymentOverPaidError"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Total
													Due</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="totalDue"
														placeholder="Total Due" id="paymentTotalDue"
														readonly="true"></form:input>
													<span class="help-block"> <span class="alert-danger"
														id="paymentTotalDueError"></span>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-offset-12 col-md-12">
													<c:choose>
														<c:when test="${empty paymentDetailsForm.id}">
															<input type="submit" class="btn green btn-sm"
																style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																value="Save" />
														</c:when>
														<c:otherwise>
															<input type="submit" class="btn green btn-sm"
																style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																value="Update"
																formaction="${pageContext.request.contextPath}/payments/${citationId}" />
														</c:otherwise>
													</c:choose>

													<button type="button"
														onclick="window.location='${pageContext.request.contextPath}/paymentDetails/${citationId}';"
														class="btn green btn-sm"
														style="position: static; float: none; top: -2px; left: -500px; right: 30px; bottom: 40px">Cancel</button>
												</div>
											</div>
										</div>
										<div class="col-md-6"></div>
									</div>
								</div>
							</form:form>
							<!-- END FORM-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END CONTENT BODY -->
</div>
<!-- END CONTENT -->
<!-- END CONTAINER -->
<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {

		$("#suspendedDate").datepicker({
			format : 'mm/dd/yyyy'
		}).datepicker("setDate", 'today');

	});
</script>




<script src="<c:url value='/static/assets/global/fieldValidation.js' />"
	type="text/javascript"></script>

<script type="text/javascript">
	function validatePaymentDetails() {

		document.getElementById('paymentAmountError').innerHTML = '';
		document.getElementById('paymentOverPaidError').innerHTML = '';
		document.getElementById('paymentTotalDueError').innerHTML = '';

		if (!checkFloatingPointNum('paymentAmount')) {
			document.getElementById('paymentAmountError').innerHTML = 'Invalid Amount';
			return false;
		}

		var payTotDue = document.getElementById('paymentTotalDue').value;
		var givenAmt = document.getElementById('paymentAmount').value;
		if (parseFloat(givenAmt) > parseFloat(payTotDue)) {
			document.getElementById('paymentAmountError').innerHTML = 'Amount should be less than or equal to Total Due';
			return false;
		}

		if (!checkFloatingPointNum('paymentOverPaid')) {
			document.getElementById('paymentOverPaidError').innerHTML = 'Invalid Amount';
			return false;
		}
	}
</script>