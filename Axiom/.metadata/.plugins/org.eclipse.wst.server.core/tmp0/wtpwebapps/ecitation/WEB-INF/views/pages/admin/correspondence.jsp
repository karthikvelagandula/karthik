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
					href="${pageContext.request.contextPath}/correspondDetails/${citationId}"><spring:message
							code="lbl.sidemenu.tab.Correspondence" /></a> <i
					class="fa fa-circle"></i></li>
				<li><span><spring:message
							code="lbl.sidemenu.tab.Correspondence.Details" /></span></li>
			</ul>

		</div>
		<!-- END PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable-line boxless tabbable-reversed">
					<div id="citationPortlet" class="portlet box green bg-inverse">
						<div class="portlet-title">
							<div class="caption">Correspondence Edit</div>
						</div>
						<div class="portlet-body form">
							<c:if test="${not empty errorInfo}">
								<div class="alert alert-danger">
									<span>${errorInfo}</span>
								</div>
							</c:if>
							<!-- BEGIN FORM-->
							<form:form id="correspondenceForm"
								action="${pageContext.request.contextPath}/saveCorrespondence"
								modelAttribute="correspondenceForm" method="POST"
								autocomplete="on">
								<div class="form-body">


									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Violation
													Number<span class="required">*</span>
												</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="citationId"
														placeholder="Violation Number" maxlength="7"
														value="${citationId}" readonly="true"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="citationId" cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Correspondence
												</label>
												<div class="col-md-9">
													<form:select class="bs-select form-control"
														style="font-size:13px;width:455px;"
														path="correspCode.typCd">
														<c:forEach items="${corresCodes}" var="code">
															<form:option value="${code.typCd}"
																label="${code.correspDesc}"></form:option>
														</c:forEach>
													</form:select>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->


									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Date</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-end-date="0d"
														data-date-viewmode="years">
														<form:input path="corresp_date" class="form-control"
															readonly="false" id="corresp_date" />
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
														<form:input id="timepickerCorresp" path="corresp_time"
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
												<label class="control-label  label-sm col-md-3">Correspondence
													Sent</label>
												<div class="col-md-9">
													<div class="mt-radio-inline">
														<label class="mt-radio label-sm"> <form:radiobutton
																path="corresp_sent" id="optionsRadios25" value="YES" />YES
															<span></span>
														</label> <label class="mt-radio label-sm"> <form:radiobutton
																path="corresp_sent" id="optionsRadios26" value="NO" />NO
															<span></span>
														</label>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Document
													Number</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="documentNumber" placeholder="documentNumber"></form:input>
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
												<label class="control-label label-sm col-md-3">Correspondence
													Type</label>
												<div class="col-md-9">
													<form:select class="bs-select form-control"
														style="font-size:13px;width:455px;"
														path="correspondenceType"
														placeholder="Correspondence Type">
														<form:option value="" label="Select an Option"></form:option>
														<c:forEach items="${corresLetterTypes}"
															var="corresLetterType">
															<form:option value="${corresLetterType.fullNm}"
																label="${corresLetterType.fullNm}"></form:option>
														</c:forEach>
													</form:select>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->

									<div class="form-actions">
										<div class="row">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-offset-12 col-md-12">
														<c:choose>
															<c:when test="${empty correspondenceForm.id}">
																<input type="submit" class="btn green btn-sm" style=""
																	value="Save" />
															</c:when>
															<c:otherwise>
																<form:input type="hidden" path="id" />
																<input type="submit" class="btn green btn-sm" style=""
																	value="Update"
																	formaction="${pageContext.request.contextPath}/updateCorrespondence" />
															</c:otherwise>
														</c:choose>

														<a href="../correspondDetails/${citationId}"
															class="btn green btn-sm" style="">Cancel</a>
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
	</div>
	<!-- END CONTENT BODY -->
</div>
<!-- END CONTENT -->
<!-- END CONTAINER -->


<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	if($("#timepickerCorresp").val() == null || $("#timepickerCorresp").val()==""){
		$("#timepickerCorresp").timepicker('setTime', new Date());		
	}else{
		$("#timepickerCorresp").timepicker('setTime', $("#timepickerCorresp").val());	
	}
});
</script>