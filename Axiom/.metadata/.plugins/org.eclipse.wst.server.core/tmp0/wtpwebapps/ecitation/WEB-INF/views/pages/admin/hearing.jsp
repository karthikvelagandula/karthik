<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">
		<br /> <br />

		<!-- BEGIN PAGE HEADER-->
		<div class="page-bar" style="margin: -25px 0px 0;">
			<ul class="page-breadcrumb">
				<li><a style="margin-left: 20px;"
					href="../${hearingDetailsForm.citation.citationId}">Hearing
						Details</a> <i class="fa fa-circle"></i></li>
				<li><span>Hearing Edit</span></li>
			</ul>
		</div>
		<!-- END PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable-line boxless tabbable-reversed">
					<div id="citationPortlet" class="portlet box green bg-inverse">
						<div class="portlet-title">
							<div class="caption">Hearing Edit</div>
						</div>
						<div class="portlet-body form">
							<c:if test="${not empty errorInfo}">
								<div class="alert alert-danger">
									<span>${errorInfo}</span>
								</div>
							</c:if>
							<!-- BEGIN FORM-->
							<form:form id="hearingDetails"
								onsubmit="return validateHearing()" action="../updateHearing"
								modelAttribute="hearingDetailsForm" method="POST"
								autocomplete="on">
								<div class="form-body">
									<form:hidden path="id" />
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Violation
													Number<span class="required">*</span>
												</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="citation.citationId" placeholder="Violation Number"
														maxlength="7" value="" id="citationid"></form:input>
													<span class="help-block">&nbsp;<form:errors
															cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Hearing
													Officer</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														placeholder="Hearing Officer" path="hearingOfficer"
														id="hearingofficer"></form:input>
													<span class="help-block">&nbsp;<form:errors
															cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Hearing
													Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-end-date="0d"
														data-date-viewmode="years">
														<form:input class="form-control" path="hearingDate"
															id="hearingDate" />
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
												<label class="control-label col-md-3">Hearing Time</label>
												<div class="col-md-9">
													<div class="input-group">
														<form:input type="text" id="hearingTime"
															path="hearingTime"
															class="form-control timepicker timepicker-no-seconds" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-clock-o"></i>
															</button>
														</span>
													</div>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
									<!--row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Disposition
													Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-end-date="0d"
														data-date-viewmode="years">
														<form:input class="form-control" path="dispositionDate"
															id="dispositionDate" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Disposition
													Time</label>
												<div class="col-md-9">
													<div class="input-group">
														<form:input type="text" id="dispositionTime"
															path="dispositionTime"
															class="form-control timepicker timepicker-no-seconds" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-clock-o"></i>
															</button>
														</span>
													</div>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--row-->


									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Disposition</label>
												<div class="col-md-9">
													<form:select class="bs-select form-control"
														style="font-size:13px;width:455px;" path="disposition"
														placeholder="Disposition" id="disposition">
														<form:option value="" label="Select an Option"></form:option>
														<c:forEach items="${dispCodes}" var="dispCode">
															<form:option
																value="${dispCode.code}-${dispCode.description}"
																label="${dispCode.code}-${dispCode.description}"></form:option>
														</c:forEach>
													</form:select>
													<span class="help-block">&nbsp;<form:errors
															cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">User
													Id</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="userId"
														placeholder="User Id" value="" id="userId"></form:input>
													<span class="help-block">&nbsp;<form:errors
															cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
										<!--/row-->
									</div>

									<!--row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Suspend
													Until</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-end-date="0d"
														data-date-viewmode="years">
														<form:input class="form-control" path="suspendUntil"
															id="suspendUntill" />
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
												<label class="control-label label-sm col-md-3">Suspend</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="suspend"
														placeholder="Suspend" value="" id="suspend"></form:input>
													<span class="help-block">&nbsp;<form:errors
															cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
									</div>
									<!--/row-->
									<!--row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Case#</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="caseNumber"
														placeholder="Case Number" id="caseNumber"></form:input>
													<span class="help-block">&nbsp;<form:errors
															cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Plea</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="plea"
														placeholder="Plea" id="plea"></form:input>
													<span class="help-block">&nbsp;<form:errors
															cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
										<!--/row-->
										<!--row-->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Reduction</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm" path="reduction"
															placeholder="Reduction" id="reduction"></form:input>
														<span class="help-block">&nbsp;<form:errors
																cssClass="alert-danger" /> <span class="alert-danger"
															id="reductionError"></span>
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
															id="totalDue" readonly="true"></form:input>
														<span class="help-block">&nbsp;<form:errors
																cssClass="alert-danger" /> <span class="alert-danger"
															id="totalDueError"></span>
														</span>
													</div>
												</div>
											</div>
											<!--/row-->
										</div>



										<div class="form-actions">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-offset-12 col-md-12">
															<c:choose>
																<c:when test="${hearingDetailsForm.id == null}">
																	<input type="submit" class="btn green btn-sm" style=""
																		value="Save"
																		formaction="${pageContext.request.contextPath}/hearingDetails/add/${hearingDetailsForm.citation.citationId}" />
																</c:when>
																<c:otherwise>
																	<input type="submit" class="btn green btn-sm" style=""
																		value="Update" />
																</c:otherwise>
															</c:choose>
															<a href="../${hearingDetailsForm.citation.citationId}"
																class="btn green btn-sm" style="">Cancel</a>
														</div>
													</div>
												</div>
												<div class="col-md-6"></div>
											</div>
										</div>
									</div>
								</div>
								<!--FORM Body-->
							</form:form>
						</div>
						<!-- END FORM-->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT BODY -->

<!-- END CONTENT -->

<!-- END CONTAINER -->


<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>
<script>
$(document).ready(
		function() {
		$('.timepicker-no-seconds').timepicker({
            minuteStep: 1
        });
		}
		);
</script>


<script src="<c:url value='/static/assets/global/fieldValidation.js' />"
	type="text/javascript"></script>

<script type="text/javascript">
function validateHearing() {
	
	document.getElementById('reductionError').innerHTML = '';
	document.getElementById('totalDueError').innerHTML = '';
	
	if(!checkFloatingPointNum('reduction')) {
		document.getElementById('reductionError').innerHTML = 'Invalid Amount';
		return false;
	}
		
	if(!checkFloatingPointNum('totalDue')) {
		document.getElementById('totalDueError').innerHTML = 'Invalid Amount';
		return false;
	}
	
}
</script>