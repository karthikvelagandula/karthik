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
					href="${pageContext.request.contextPath}/noticeDetails/${citationId}"><spring:message
							code="lbl.topmenu.tab.notices.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message
							code="lbl.topmenu.tab.notices.entry" /></span></li>
			</ul>

		</div>
		<!-- END PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable-line boxless tabbable-reversed">
					<div id="citationPortlet" class="portlet box green bg-inverse">
						<div class="portlet-title">
							<div class="caption">Notices Form</div>
						</div>
						<div class="portlet-body form">
							<c:if test="${not empty errorInfo}">
								<div class="alert alert-danger">
									<span>${errorInfo}</span>
								</div>
							</c:if>
							<!-- BEGIN FORM-->
							<form:form id="noticesDetailsForm"
								action="${pageContext.request.contextPath}/noticeDetails"
								modelAttribute="noticesDetailsForm" method="POST">
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
										<!--/span-->
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
									</div>
									<!--/row-->

									<span class="help-block">&nbsp;</span>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Notice
													Type</label>
												<div class="col-md-6">
													<form:select id="noticeType" path="noticeType.type"
														class="form-control input-sm">
														<c:forEach items="${noticeTypes}" var="noticeType">
															<form:option value="${noticeType.type}"
																label="${noticeType.fullNm}"></form:option>
														</c:forEach>
													</form:select>
													<!-- /input-group -->
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label class="control-label label-sm col-md-3"> Sent
											</label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm/dd/yyyy" data-date-viewmode="years">
													<form:input path="sentDate" class="form-control"
														readonly="false" id="sentDate" />
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
									<div class="row">
										<div class="col-md-6">
											<label class="control-label label-sm col-md-3">
												Processed </label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm/dd/yyyy" data-date-viewmode="years">
													<form:input path="processedDate" class="form-control"
														readonly="false" id="processedDate" />
													<span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
											</div>
										</div>


									</div>


									<!--/row-->


									<%-- <div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Mail
													2 Notice Type</label>
												<div class="col-md-6">
													<form:select id="noticeType2" path="noticeType2.type"
														class="form-control input-sm">
														<c:forEach items="${noticeTypes}" var="noticeType">
															<form:option value="${noticeType.type}" label="${noticeType.fullNm}"></form:option>
														</c:forEach>
													</form:select>
													<!-- /input-group -->
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<div class="col-md-3">

											<label class="control-label label-sm col-md-3">Sent </label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm-dd-yyyy"  data-date-viewmode="years">
													<form:input path="sentDate2" class="form-control"
														readonly="false" id="sentDate2" />
													<span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
											</div>
										</div>


										<div class="col-md-4">
											<label class="control-label label-sm col-md-3">
												Processed </label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm-dd-yyyy"  data-date-viewmode="years">
													<form:input path="processedDate2" class="form-control"
														readonly="false" id="processedDate2" />
													<span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
											</div>
										</div>


									</div>


									<!--/row-->




									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Mail
													3 Notice Type</label>
												<div class="col-md-6">
													<form:select id="noticeType3" path="noticeType3.type"
														class="form-control input-sm">
														<c:forEach items="${noticeTypes}" var="noticeType">
															<form:option value="${noticeType.type}" label="${noticeType.fullNm}"></form:option>
														</c:forEach>
													</form:select>
													<!-- /input-group -->
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<div class="col-md-3">

											<label class="control-label label-sm col-md-3">Sent </label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm-dd-yyyy"  data-date-viewmode="years">
													<form:input path="sentDate3" class="form-control"
														readonly="false" id="sentDate3" />
													<span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
											</div>
										</div>


										<div class="col-md-4">
											<label class="control-label label-sm col-md-3">
												Processed </label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm-dd-yyyy"  data-date-viewmode="years">
													<form:input path="processedDate3" class="form-control"
														readonly="false" id="processedDate3" />
													<span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
											</div>
										</div>


									</div>


									<!--/row-->

									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Mail
													4 Notice Type</label>
												<div class="col-md-6">
													<form:select id="noticeType4" path="noticeType4.type"
														class="form-control input-sm">
														<c:forEach items="${noticeTypes}" var="noticeType">
															<form:option value="${noticeType.type}" label="${noticeType.fullNm}"></form:option>
														</c:forEach>
													</form:select>
													<!-- /input-group -->
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<div class="col-md-3">

											<label class="control-label label-sm col-md-3">Sent </label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm-dd-yyyy"  data-date-viewmode="years">
													<form:input path="sentDate4" class="form-control"
														readonly="false" id="sentDate4" />
													<span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
											</div>
										</div>


										<div class="col-md-4">
											<label class="control-label label-sm col-md-3">
												Processed </label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm-dd-yyyy"  data-date-viewmode="years">
													<form:input path="processedDate4" class="form-control"
														readonly="false" id="processedDate4" />
													<span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
											</div>
										</div>


									</div>


									<!--/row-->

									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Mail
													5 Notice Type</label>
												<div class="col-md-6">
													<form:select id="noticeType5" path="noticeType5.type"
														class="form-control input-sm">
														<c:forEach items="${noticeTypes}" var="noticeType">
															<form:option value="${noticeType.type}" label="${noticeType.fullNm}"></form:option>
														</c:forEach>
													</form:select>
													<!-- /input-group -->
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<div class="col-md-3">

											<label class="control-label label-sm col-md-3">Sent </label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm-dd-yyyy"  data-date-viewmode="years">
													<form:input path="sentDate5" class="form-control"
														readonly="false" id="sentDate5" />
													<span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
											</div>
										</div>


										<div class="col-md-4">
											<label class="control-label label-sm col-md-3">
												Processed </label>
											<div class="col-md-6">
												<div class="input-group input-group-sm date date-picker"
													data-date-format="mm-dd-yyyy"  data-date-viewmode="years">
													<form:input path="processedDate5" class="form-control"
														readonly="false" id="processedDate5" />
													<span class="input-group-btn">
														<button class="btn default" type="button">
															<i class="fa fa-calendar"></i>
														</button>
													</span>
												</div>
											</div>
										</div>


									</div>


									<!--/row-->
									<span class="help-block">&nbsp;</span>
									<!--/row-->
 --%>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-5">
											<div class="row">
												<div class="col-md-offset-12 col-md-12">
													<c:choose>
														<c:when test="${empty noticesDetailsForm.id}">
															<input type="submit" class="btn green btn-sm"
																style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																value="Save" />
														</c:when>
														<c:otherwise>
															<input type="submit" class="btn green btn-sm"
																style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																value="Update"
																formaction="${pageContext.request.contextPath}/updateNoticeDetails" />
														</c:otherwise>
													</c:choose>
													<button type="button"
														onclick="window.location='${pageContext.request.contextPath}/noticeDetails/${citationId}';"
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
</div>
<!-- END CONTENT BODY -->

<!-- END CONTENT -->
<!-- END CONTAINER -->
<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {

		$("#sentDate").datepicker({
			format : 'mm-dd-yyyy'
		});
		$("#processedDate").datepicker({
			format : 'mm-dd-yyyy'
		});
	});
</script>