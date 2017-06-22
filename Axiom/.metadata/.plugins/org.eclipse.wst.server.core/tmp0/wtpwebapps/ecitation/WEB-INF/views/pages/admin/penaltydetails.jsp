<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">

		<!-- BEGIN PAGE HEADER-->
		<div class="page-bar" style="margin-top: 30px;">
			<ul class="page-breadcrumb">
				<li><a style="margin-left: 50px;"
					href="${pageContext.request.contextPath}/penalty/${citationId}"><span
						class="title"><spring:message
								code="lbl.sidemenu.tab.penalty" /></span></a> <i class="fa fa-circle"></i></li>
				<li><span class="title"><spring:message
							code="lbl.sidemenu.tab.penalty.details" /></span></li>
			</ul>

		</div>
		<!-- END PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable-line boxless tabbable-reversed">
					<div id="citationPortlet" class="portlet box green bg-inverse">
						<div class="portlet-title">
							<div class="caption">Penalty Edit</div>
						</div>
						<div class="portlet-body form">
							<c:if test="${not empty errorInfo}">
								<div class="alert alert-danger">
									<span>${errorInfo}</span>
								</div>
							</c:if>
							<!-- BEGIN FORM-->
							<form:form id="penalityForm"
								onsubmit="return validateEditPenalty()"
								action="${pageContext.request.contextPath}/savePenalty"
								modelAttribute="penalityForm" method="POST" autocomplete="on">
								<div class="form-body">


									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Violation
													Number<span class="required">*</span>
												</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="citation.citationId" placeholder="Citation ID"
														maxlength="7" value="${citationId}" readonly="true"
														id="citationid"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="citation.citationId" cssClass="alert-danger" /></span>

												</div>
											</div>
										</div>

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
										</div>


										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">FineAmt<span
													style="font-size: 12px">&nbsp;&#40;&#36;&#41;</span><span
													class="required">*</span></label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="fineAmount"
														placeholder="Fine Amount" id="fineAmount" readonly="true"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="fineAmount" cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
									</div>


									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty1/Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-viewmode="years">
														<form:input path="penaltyCode.penalty1Date"
															class="form-control" readonly="true" id="penalty1Date" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
													<span class="help-block"> <span class="alert-danger"
														id="penalty1DateError"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->

										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty1/Amt<span
													style="font-size: 12px">&nbsp;&#40;&#36;&#41;</span></label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="penaltyCode.penalty1" placeholder="penalty1"
														id="penalty1"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="penaltyCode.penalty1" cssClass="alert-danger" /> <span
														class="alert-danger" id="penalty1Error"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty2/Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-viewmode="years">
														<form:input path="penaltyCode.penalty2Date"
															class="form-control" id="penaltyCode" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->


										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty2/Amt<span
													style="font-size: 12px">&nbsp;&#40;&#36;&#41;</span></label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="penaltyCode.penalty2" placeholder="penalty2"
														id="penalty2"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="penaltyCode.penalty2" cssClass="alert-danger" /> <span
														class="alert-danger" id="penalty2Error"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>






									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty3/Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-viewmode="years">
														<form:input path="penaltyCode.penalty3Date"
															class="form-control" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->

										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty3/Amt<span
													style="font-size: 12px">&nbsp;&#40;&#36;&#41;</span></label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="penaltyCode.penalty3" placeholder="penalty3"
														id="penalty3"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="penaltyCode.penalty3" cssClass="alert-danger" /> <span
														class="alert-danger" id="penalty3Error"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>




									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty4/Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-viewmode="years">
														<form:input path="penaltyCode.penalty4Date"
															class="form-control" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->


										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty4/Amt<span
													style="font-size: 12px">&nbsp;&#40;&#36;&#41;</span></label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="penaltyCode.penalty4" placeholder="penalty4"
														id="penalty4"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="penaltyCode.penalty4" cssClass="alert-danger" /> <span
														class="alert-danger" id="penalty4Error"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>



									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty5/Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-viewmode="years">
														<form:input path="penaltyCode.penalty5Date"
															class="form-control" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->


										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Penalty5/Amt<span
													style="font-size: 12px">&nbsp;&#40;&#36;&#41;</span></label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="penaltyCode.penalty5" placeholder="penalty5"
														id="penalty5"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="penaltyCode.penalty5" cssClass="alert-danger" /> <span
														class="alert-danger" id="penalty5Error"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>









									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Total
													Paid<span style="font-size: 12px">&nbsp;&#40;&#36;&#41;</span>
												</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="totalPaidAmount" placeholder="Total Paid Amount"
														maxlength="7" id="totalPaidAmount"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="fineAmount" cssClass="alert-danger" /> <span
														class="alert-danger" id="totalPaidAmountError"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->

										<div class="col-md-6">
											<div class="form-group">

												<label class="control-label label-sm col-md-3">Reduced<span
													style="font-size: 12px">&nbsp;&#40;&#36;&#41;</span></label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="reducedAmount" placeholder="Reduced Amount"
														maxlength="7" id="reducedAmount"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="reducedAmount" cssClass="alert-danger" /> <span
														class="alert-danger" id="reducedAmountError"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!-- Copy row 2 -->


									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Total
													Due/Over paid<span style="font-size: 12px">&nbsp;&#40;&#36;&#41;</span>
												</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="citation.totalDue" placeholder="Total Due Amount"
														maxlength="7" id="totalDueAmount" readonly="true"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="citation.totalDue" cssClass="alert-danger" /> <span
														class="alert-danger" id="totalDueAmountError"></span>
													</span>
												</div>
											</div>
										</div>
									</div>
									<!--/row-->


									<div class="form-actions">
										<div class="row">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-offset-12 col-md-12">
														<c:choose>
															<c:when test="${empty penalityForm.id}">
																<input type="submit" class="btn green btn-sm"
																	style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																	value="Save" />
															</c:when>
															<c:otherwise>
																<c:if
																	test="${not empty penalityForm.citation.totalDue && penalityForm.citation.totalDue>0.00}">
																	<input type="submit" class="btn green btn-sm"
																		style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																		value="Update"
																		formaction="${pageContext.request.contextPath}/updatePenalty/${id}" />
																</c:if>
															</c:otherwise>
														</c:choose>
														<button type="button"
															onclick="window.location='${pageContext.request.contextPath}/penalty/${citationId}';"
															class="btn green btn-sm"
															style="position: static; float: none; top: -2px; left: -500px; right: 30px; bottom: 40px">Cancel</button>
														<c:if test="${user.role.userType.id==1}">
															<button type="button"
																onclick="window.location='${pageContext.request.contextPath}/penaltyWaived/${citationId}';"
																class="btn green btn-sm"
																style="position: static; float: none; top: -2px; left: -500px; right: 30px; bottom: 40px">Waive</button>
														</c:if>
													</div>
												</div>
											</div>
											<div class="col-md-6"></div>
										</div>
									</div>
								</div>
							</form:form>

							<!-- END FORM-->
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- END CONTENT BODY -->
	</div>
</div>
<!-- END CONTENT -->
<!-- END CONTAINER -->

<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>


<script src="<c:url value='/static/assets/global/fieldValidation.js' />"
	type="text/javascript"></script>

<script type="text/javascript">
	function validateEditPenalty() {

		document.getElementById('penalty1Error').innerHTML = '';
		document.getElementById('penalty2Error').innerHTML = '';
		document.getElementById('penalty3Error').innerHTML = '';
		document.getElementById('penalty4Error').innerHTML = '';
		document.getElementById('penalty5Error').innerHTML = '';
		document.getElementById('totalPaidAmountError').innerHTML = '';
		document.getElementById('reducedAmountError').innerHTML = '';
		document.getElementById('totalDueAmountError').innerHTML = '';

		/* 
		document.getElementById('penalty1DateError').innerHTML = '';
		var p1dt = document.getElementById('penalty1Date').value;
		alert(p1dt);
		if(p1dt.length == 0) {
			document.getElementById('penalty1DateError').innerHTML = 'Invalid Date';
			return false;
		} */

		if (!checkFloatingPointNum('penalty1')) {
			document.getElementById('penalty1Error').innerHTML = 'Invalid Amount';
			return false;
		}

		if (!checkFloatingPointNum('penalty2')) {
			document.getElementById('penalty2Error').innerHTML = 'Invalid Amount';
			return false;
		}

		if (!checkFloatingPointNum('penalty3')) {
			document.getElementById('penalty3Error').innerHTML = 'Invalid Amount';
			return false;
		}

		if (!checkFloatingPointNum('penalty4')) {
			document.getElementById('penalty4Error').innerHTML = 'Invalid Amount';
			return false;
		}

		if (!checkFloatingPointNum('penalty5')) {
			document.getElementById('penalty5Error').innerHTML = 'Invalid Amount';
			return false;
		}

		if (!checkFloatingPointNum('totalPaidAmount')) {
			document.getElementById('totalPaidAmountError').innerHTML = 'Invalid Amount';
			return false;
		}

		if (!checkFloatingPointNum('reducedAmount')) {
			document.getElementById('reducedAmountError').innerHTML = 'Invalid Amount';
			return false;
		}

		if (!checkFloatingPointNum('totalDueAmount')) {
			document.getElementById('totalDueAmountError').innerHTML = 'Invalid Amount';
			return false;
		}

	}
</script>
