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
					href="${pageContext.request.contextPath}/suspendDetails/${citationId}"><spring:message
							code="lbl.topmenu.tab.suspend.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message
							code="lbl.topmenu.tab.suspend.entry" /></span></li>
			</ul>

		</div>
		<!-- END PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable-line boxless tabbable-reversed">
					<div id="citationPortlet" class="portlet box green bg-inverse">
						<div class="portlet-title">
							<div class="caption">Suspends Form</div>
						</div>
						<div class="portlet-body form">
							<c:if test="${not empty errorInfo}">
								<div class="alert alert-danger">
									<span>${errorInfo}</span>
								</div>
							</c:if>
							<!-- BEGIN FORM-->
							<form:form id="suspendDetailsForm"
								onsubmit="return validateSuspends()"
								action="${pageContext.request.contextPath}/suspendDetails"
								modelAttribute="suspendDetailsForm" method="POST">
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
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Suspended
													Codes</label>
												<div class="col-md-9">
													<form:select id="suspendedCodes" path="code"
														class="form-control input-sm">
														<c:forEach items="${suspendedCodes}" var="suspendedCode">
															<form:option value="${suspendedCode.code}"
																label="${suspendedCode.description}"></form:option>
														</c:forEach>
													</form:select>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<br>
									<!--/row-->

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Suspended
													Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-end-date="0d"
														data-date-viewmode="years">
														<form:input path="suspended_date" class="form-control"
															readonly="false" id="suspendedDate" />
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
												<label class="control-label label-sm col-md-3">Time</label>
												<div class="col-md-9">
													<div class="input-group bootstrap-timepicker timepicker">
														<form:input id="suspendtimePicker" path="suspended_time"
															type="text" class="form-control" data-minute-step="1"></form:input>
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-time"></i></span>
													</div>
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
													On</label>
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
													ID</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="userId"
														placeholder="User ID"></form:input>
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
												<label class="control-label label-sm col-md-3">Case
													Number</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="caseSuspend" placeholder="Case suspended"></form:input>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label  label-sm col-md-3">
													Date Override</label>
												<div class="col-md-3">
													<div class="mt-radio-inline">
														<label class="mt-radio label-sm"> <form:radiobutton
																path="dateOverride" id="optionsRadios25" value="Yes" />Yes
															<span></span>
														</label> <label class="mt-radio label-sm"> <form:radiobutton
																path="dateOverride" id="optionsRadios26" value="No" />No
															<span></span>
														</label>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Reduction
													Amount</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="reduction"
														placeholder="Reduction" id="reductionSuspends"></form:input>
													<span class="help-block"> <span class="alert-danger"
														id="reductionSuspendsError"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Total
													Due</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="citation.totalDue" placeholder="Total Due"
														id="totalDueSuspends" readonly="true"></form:input>
													<span class="help-block"> <span class="alert-danger"
														id="totalDueSuspendsError"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-offset-12 col-md-12">
													<c:choose>
														<c:when test="${empty suspendDetailsForm.id}">
															<input type="submit" class="btn green btn-sm"
																style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																value="Save" />
														</c:when>
														<c:otherwise>
															<input type="submit" class="btn green btn-sm"
																style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																value="Update"
																formaction="${pageContext.request.contextPath}/updateSuspends/${citationId}" />
														</c:otherwise>
													</c:choose>
													<button type="button"
														onclick="window.location='${pageContext.request.contextPath}/suspendDetails/${citationId}';"
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
	$(document).ready(
			function() {

				if ($("#suspendedDate").val() == null
						|| $("#suspendedDate").val() == "") {
					$("#suspendedDate").datepicker({
						format : 'mm/dd/yyyy'
					}).datepicker("setDate", 'today');
				}
				if ($("#suspendtimePicker").val() == null
						|| $("#suspendtimePicker").val() == "") {
					$("#suspendtimePicker").timepicker('setTime', new Date());
				} else {
					$("#suspendtimePicker").timepicker('setTime',
							$("#suspendtimePicker").val());
				}
				if ($("#processedOn").val() == null
						|| $("#processedOn").val() == "") {
					$("#processedOn").datepicker({
						format : 'mm/dd/yyyy'
					}).datepicker("setDate", 'today');
				}

			});
</script>

<script src="<c:url value='/static/assets/global/fieldValidation.js' />"
	type="text/javascript"></script>

<script type="text/javascript">
	function validateSuspends() {

		document.getElementById('reductionSuspendsError').innerHTML = '';
		document.getElementById('totalDueSuspendsError').innerHTML = '';

		if (!checkFloatingPointNum('reductionSuspends')) {
			document.getElementById('reductionSuspendsError').innerHTML = 'Invalid Amount';
			return false;
		}

		if (!checkFloatingPointNum('totalDueSuspends')) {
			document.getElementById('totalDueSuspendsError').innerHTML = 'Invalid Amount';
			return false;
		}
	}
</script>