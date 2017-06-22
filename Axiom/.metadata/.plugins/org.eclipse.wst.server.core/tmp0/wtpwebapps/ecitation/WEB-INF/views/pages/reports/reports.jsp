<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<div class="page-container" id="blockui_citationentry_data">
	<div class="page-content">
		<br /> <br />
		<div class="page-bar" style="margin: -25px 0px 0;">
			<ul class="page-breadcrumb">
				<li><a style="margin-left: 50px;"
					href="${pageContext.request.contextPath}/citationlist"><spring:message
							code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message code="lbl.topmenu.tab.reports" /></span></li>
			</ul>
		</div>
		<div class="portlet-title"
			style="padding-top: 20px; padding-left: 30px;">
			<div class="caption">
				<i class="fa font-blue"></i> <span
					class="caption-subject font-blue sbold">Reports</span>
			</div>
		</div>
		<div class="portlet-body"
			style="padding-top: 30px; padding-left: 45px;">
			<div class="row">
				<div class="col-md-12">
					<form:form id="uploadrecords"
						action="${pageContext.request.contextPath}/reports" method="POST"
						autocomplete="on" modelAttribute="reportBean"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label label-sm col-md-3">From
										Date</label>
									<div class="col-md-9">
										<div class="input-group input-group-sm date date-picker"
											data-date-format="mm/dd/yyyy" data-date-end-date="0d"
											data-date-viewmode="years">
											<form:input path="fromDate" class="form-control"
												readonly="false" id="fromDate" />
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
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label label-sm col-md-3">Report
										Type </label>
									<div class="col-md-9">
										<form:select id="reportType" path="reportType"
											class="bs-select form-control">
											<form:option value="Financial" label="Financial Transaction"
												selected="true"></form:option>
											<form:option value="Notices" label="Notices"></form:option>
											<form:option value="Refunds" label="Refund Transaction"></form:option>
										</form:select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label label-sm col-md-3">To Date</label>
									<div class="col-md-9">
										<div class="input-group input-group-sm date date-picker"
											data-date-format="mm/dd/yyyy" data-date-end-date="0d"
											data-date-viewmode="years">
											<form:input path="toDate" class="form-control"
												readonly="false" id="toDate" />
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
							<div class="col-md-6">
								<div class="form-actions">
									<label class="control-label label-sm col-md-3"></label> <span>
										<input type="submit" class="btn green input-button pull-right"
										style="margin-right: 20px;" id="download" value="Download">
									</span>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="alert">
			<span>${result}</span>
		</div>

		<!-- END CONTENT BODY -->
	</div>
</div>
<!-- END CONTENT -->
<!-- END CONTAINER -->
<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>
<script>
$(document).ready(function() {
	$("#blockui_uploadbtn").show();
	
});  

</script>