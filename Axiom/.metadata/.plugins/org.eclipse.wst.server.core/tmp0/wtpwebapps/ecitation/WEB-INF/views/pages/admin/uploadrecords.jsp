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
				<li><span><spring:message
							code="lbl.topmenu.tab.citation.uploadrecords" /></span></li>
			</ul>
		</div>
		<div class="portlet-title"
			style="padding-top: 20px; padding-left: 30px;">
			<div class="caption">
				<i class="fa font-blue"></i> <span
					class="caption-subject font-blue sbold">Upload Records</span>
			</div>
		</div>
		<div class="portlet-body"
			style="padding-top: 30px; padding-left: 45px;">
			<div class="row">
				<div class="col-md-12">
					<form:form id="uploadrecords"
						action="${pageContext.request.contextPath}/uploadrecords"
						method="POST" autocomplete="on" modelAttribute="uploadRecordFile"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label label-sm col-md-3">Records
										Type </label>
									<div class="col-md-9">
										<form:select id="recordsType" path="recordsType"
											class="bs-select form-control">
											<form:option value="Inspector" label="Inspector Table"
												selected="true"></form:option>
											<form:option value="User" label="User Accounts"></form:option>
											<form:option value="Comments" label="Comments"></form:option>
										</form:select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-actions">
									<span class="btn green fileinput-button"> <span>Browse</span>
										<form:input type="file" name="file" path="file" />
									</span> <span> <input type="submit"
										class="btn green fileinput-button" id="blockui_uploadbtn"
										onclick="enablePageLoadBar()" value="Upload">
									</span>

								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="form-body">
					<div class="form-group">
						<div class="col-md-12">
							<span id="fileTypeError" style="color: #E82734">${printError}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
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
		<div class="row" id="fileUploadTye">
			<div class="col-md-12">
				<div class="form-body">
					<div class="form-group">
						<div class="col-md-12">
							<table class="table table-hover table-bordered  table-sortable"
								id="upload_file" style="width:">
								<thead style="background-color: #26A1AB; color: #fff">
									<tr>
										<th>File Name</th>
										<th class="hidden-xs">File Type</th>
										<th class="hidden-xs">File size</th>
									</tr>
								</thead>
								<tbody id="selectedFilesRow">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="caption">
			<i class="fa font-blue"></i> <span
				class="caption-subject font-blue sbold">Uploaded Records</span>
		</div>
		<div class="row" id="fileUploadTye">
			<div class="col-md-12">
				<div class="form-body">
					<div class="form-group">
						<div class="col-md-12">
							<table class="table table-hover table-bordered  table-sortable"
								id="upload_file" style="width:">
								<thead style="background-color: #26A1AB; color: #fff">
									<tr>
										<th>File Name</th>
										<th class="hidden-xs">Records type</th>
										<th class="hidden-xs">Updated by</th>
										<th class="hidden-xs">Updated Date</th>
										<th class="hidden-xs">Status</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty uploadRecordFileList}">
											<tr data-type="norec" style="background-color: #f5f3eb;">
												<td colspan="6" align="center"><b>No Letters
														Uploaded</b></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${uploadRecordFileList}"
												var="uploadRecordFile">
												<c:if test="${ not empty uploadRecordFile.recordsFileName}">
													<tr style="background-color: #f5f3eb;">
														<td><a style="color: #26A1AB;"
															href="<c:url value='/downloadRecordFile/${uploadRecordFile.recordsType}' />"><span>
																	${uploadRecordFile.recordsFileName}</span></a></td>

														<td>${uploadRecordFile.recordsType}</td>

														<td>${uploadRecordFile.uploadedBy}</td>

														<td>${uploadRecordFile.formattedUpdatedAt}</td>
														<td>${uploadRecordFile.status}</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
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
	top: 115px;
	left: 580px;
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
	document.onreadystatechange = function() {
		var state = document.readyState;
		if (state == 'interactive') {
			document.getElementById('uil-default-css-id').style.display = "block";
		}
		if (state == 'complete') {
			document.getElementById('uil-default-css-id').style.display = "none";
		}
	}
	function enablePageLoadBar() {
		document.getElementById('uil-default-css-id').style.display = "block";
	}

	$(document)
			.ready(
					function() {
						$("#blockui_uploadbtn").hide();
						$('input[type="file"]')
								.change(
										function(e) {
											document
													.getElementById('fileTypeError').innerHTML = '';
											document
													.getElementById('blockui_uploadbtn').disabled = false;
											var fileSelected = e.target.files[0];
											console.log(fileSelected.name);
											$("#selectedFilesRow").empty();
											var newRowContent = "<tr><td>"
													+ fileSelected.name
													+ "</td><td>"
													+ fileSelected.name
															.substr(
																	fileSelected.name
																			.lastIndexOf('.') + 1)
															.toUpperCase()
													+ "</td><td>"
													+ Math
															.round(fileSelected.size / 1024)
													+ " Kb" + "</td></tr>";
											$(newRowContent).appendTo(
													$("#selectedFilesRow"));
											var fileTypeUploaded = fileSelected.name
													.substr(
															fileSelected.name
																	.lastIndexOf('.') + 1)
													.toUpperCase();
											var validFileTypes = [ 'XLSX' ];
											if (validFileTypes
													.indexOf(fileTypeUploaded) == -1) {
												document
														.getElementById('blockui_uploadbtn').disabled = true;
												document
														.getElementById('fileTypeError').innerHTML = 'Invalid File Uploaded. Allowed XLSX type of files';
											}
											$("#blockui_uploadbtn").show();
										});
					});
</script>