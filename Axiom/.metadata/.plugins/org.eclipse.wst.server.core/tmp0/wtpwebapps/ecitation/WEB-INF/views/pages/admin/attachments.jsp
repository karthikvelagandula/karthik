<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper" id="blockui_fileUpload_data">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">
		<!-- BEGIN PAGE HEADER-->
		<div>
			<div class="portlet light portlet-fit bordered">
				<div style="text-align: center;">
					<span style="font-size: 16px;"><span style="font-size: 17px"><b>Name:</b></span>&nbsp;${lastName}
						&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px"><b>Violation
								Number:</b></span>&nbsp;${citationId} </span>
				</div>
				<div class="portlet-title">
					<div class="caption">
						<span class="caption-subject font-blue sbold">File Upload</span>

					</div>
				</div>
				<div class="portlet-body">
					<div class="row">
						<div class="col-md-12">
							<form:form id="fileupload"
								action="${pageContext.request.contextPath}/fileupload/${citationId}"
								modelAttribute="uploadForm" method="POST" autocomplete="on"
								enctype="multipart/form-data">
								<div class="form-actions">
									<div class="row" style="margin-left: 0px;">
										<div class="form-group">
											<label class="control-label label-sm col-md-2">Type
												of File Upload:</label>
											<div class="col-md-3">
												<form:select path="fileType" id="fileType">
													<form:option value="Attachments">Attachments</form:option>
													<form:option value="Checks">Checks</form:option>
													<form:option value="Correspondence">Correspondence Files</form:option>

												</form:select>
											</div>
										</div>
									</div>
									<span class="help-block">&nbsp;</span>
									<div class="row" style="margin-left: 17px;">
										<span class="btn green btn-sm fileinput-button"> <span>
												Browse </span> <input type="file" name="files" multiple="multiple">
										</span> <span> <input type="submit"
											class="btn green btn-sm fileinput-button"
											id="blockui_uploadbtn" value=" Upload ">
										</span>
									</div>
								</div>
								<div class="row fileupload-buttonbar"></div>
							</form:form>
						</div>
					</div>
					<div class="row" id="viewLoadFiles" style="display: none">
						<div class="col-md-12">
							<div class="form-body">
								<div class="form-group">
									<div class="col-md-12">
										<table
											class="table table-hover table-bordered  table-sortable"
											id="upload_files" style="width:">
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


					<div class="row">
						<div class="col-md-12">
							<div class="form-body">
								<div class="form-group">
									<div class="col-md-12">
										<span id="fileTypeError" style="color: #E82734"></span>
									</div>
								</div>
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
					<div class="row">
						<div class="col-md-12">
							<div class="form-body">
								<div class="form-group">
									<div class="col-md-12">
										<span style="color: #3597DB">${result}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="portlet-title" style="padding-top: 0px;">
						<div class="caption">
							<i class="fa font-blue"></i> <span
								class="caption-subject font-blue sbold">Uploaded
								Attachments</span>
						</div>
						<div class="col-md-12">
							<div class="form-body">
								<div class="form-group">
									<div class="col-md-12">
										<table
											class="table table-bordered table-hover  table-sortable"
											id="img_logic"
											style="margin-bottom: 0px; margin-left: -25px; margin-top: -10px;">
											<thead style="background-color: #26A1AB; color: #fff">
												<tr>
													<th>File Name</th>
													<th>File Type</th>
													<th class="hidden-xs">Uploaded Date</th>
													<th class="hidden-xs">Download</th>
													<th class="hidden-xs">Delete</th>
													<th class="hidden-xs">Print</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${empty images}">
														<tr>
															<td colspan="6" align="center"><b>No Documents
																	Uploaded</b></td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${images}" var="images">
															<tr>
																<td id="partFileInfoColumn"
																	style="width: 450px; font-size: 13px;"><span
																	id="fileNameInfo_${images.id}"> <a
																		onclick="enablePageLoadBar()" style="color: #26A1AB;"
																		href="<c:url value='/viewAttachmentAsImages/${images.id}/${citationId}' />"><span
																			style="width: 50px;"><c:out
																					value="${images.imageName}" /></span></a>
																		<button class="btn green btn-sm" data-id=""
																			id="btnRename_${images.id}"
																			style="float: right; font-size: 10px;">Rename</button>
																</span> <span id="fileNameUpdateSpan_${images.id}"
																	style="display: none;"> <input type="text"
																		class="form-control input-sm" name="fileName"
																		value="${images.imageName}"
																		id="fileNameField_${images.id}" style="width: 80%;" />
																		<button class="btn green btn-sm"
																			id="fileNameUpdateBtn_${images.id}" data-id=""
																			style="float: right; margin-top: -30px;">Update</button>
																</span> <script type="text/javascript">
																	$(
																			"#btnRename_<c:out value='${images.id}'/>")
																			.click(
																					function() {
																						$(
																								"#fileNameUpdateSpan_<c:out value='${images.id}'/>")
																								.show();
																						$(
																								"#fileNameInfo_<c:out value='${images.id}'/>")
																								.hide();
																					});

																	$(
																			"#fileNameUpdateBtn_<c:out value='${images.id}'/>")
																			.click(
																					function() {
																						var updatedNm = $(
																								"#fileNameField_<c:out value='${images.id}'/>")
																								.val();
																						var urlAddress = "<c:out value='${pageContext.request.contextPath}'/>/updateAttachmentFileName/"
																								+ updatedNm
																								+ "/<c:out value='${images.id}'/>/"
																								+ "<c:out value='${citationId}'/>";
																						window.location.href = urlAddress;
																					});
																</script></td>
																<td><c:out value="${images.imageType}" /></td>
																<td><c:out value="${images.uploadedDate}" /></td>
																<td><a class="btn green btn-sm"
																	href="<c:url value='/downloadImage/${images.id}' />">
																		<c:out value="Download" />
																</a></td>
																<td><a onclick="enablePageLoadBar()"
																	style="color: #FF0000"
																	href="<c:url value='/deleteImage/${images.id}' />">
																		<c:out value="Delete" />
																</a></td>

																<td><c:if
																		test="${images.imageType == 'PDF' || images.imageType == '4X6M'}">
																		<a class="btn green btn-sm icon-printer"
																			href="<c:url value='/printPDFPages/${images.id}/${citationId}' />">&nbsp;&nbsp;Print</a>
																	</c:if> <c:if
																		test="${images.imageType != 'PDF' && images.imageType != '4X6M'}">
																		<a class="btn green btn-sm icon-printer" href="#"
																			onclick="printImageTypeFile('${pageContext.request.contextPath}/previewImage/${images.id}')">&nbsp;&nbsp;Print</a>
																	</c:if></td>
															</tr>
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


					<div class="portlet-title" style="padding-top: 0px;">
						<div class="caption">
							<i class="fa font-blue"></i> <span
								class="caption-subject font-blue sbold">Uploaded Checks</span>
						</div>
						<div class="col-md-12">
							<div class="form-body">
								<div class="form-group">
									<div class="col-md-12">
										<table
											class="table table-bordered table-hover  table-sortable"
											style="margin-bottom: 0px; margin-left: -25px; margin-top: -10px;">
											<thead style="background-color: #26A1AB; color: #fff">
												<tr>
													<th>File Name</th>
													<th>File Type</th>
													<th class="hidden-xs">Uploaded Date</th>
													<th class="hidden-xs">Download</th>
													<th class="hidden-xs">Delete</th>
													<th class="hidden-xs">Print</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${not empty paymentList}">
													<c:forEach items="${paymentList}" var="payment">
														<tr>
																<td><a style="color: #26A1AB;"
																	href="<c:url value='/previewCheque/${payment.id}' />"
																	target="_blank">${payment.chequeFileName}</a></td>
																	<td>${payment.chequeFileType}</td>
																<td>${payment.paymentDate}</td>
																<td><a class="btn green btn-sm"
																	href="<c:url value='/downloadCheque/${payment.id}' />">
																		Download</a></td>
																<td><a onclick="enablePageLoadBar()"
																	style="color: #FF0000"
																	href=" <c:url value='/deleteCheque/${payment.id}' />">
																		<c:out value="Delete" />
																</a></td>

																<td><c:if test="${payment.chequeFileType == 'PDF'}">
																		<a class="btn green btn-sm icon-printer"
																			href="<c:url value='/printPaymentPDF/${payment.id}/${citationId}' />">&nbsp;&nbsp;Print
																		</a>
																	</c:if> <c:if test="${payment.chequeFileType != 'PDF'}">
																		<a class="btn green btn-sm icon-printer" href="#"
																			onclick="printImageTypeFile('${pageContext.request.contextPath}/previewCheque/${payment.id}')">&nbsp;&nbsp;Print
																		</a>
																	</c:if></td>
															</tr>
															</c:forEach>
													</c:when>
													<c:when test="${not empty checks}">
														<c:forEach items="${checks}" var="images">
															<tr>
																<td id="partFileInfoColumn"
																	style="width: 450px; font-size: 13px;"><span
																	id="fileNameInfo_${images.id}"> <a
																		onclick="enablePageLoadBar()" style="color: #26A1AB;"
																		href="<c:url value='/viewAttachmentAsImages/${images.id}/${citationId}' />"><span
																			style="width: 50px;"><c:out
																					value="${images.imageName}" /></span></a>
																		<button class="btn green btn-sm" data-id=""
																			id="btnRename_${images.id}"
																			style="float: right; font-size: 10px;">Rename</button>
																</span> <span id="fileNameUpdateSpan_${images.id}"
																	style="display: none;"> <input type="text"
																		class="form-control input-sm" name="fileName"
																		value="${images.imageName}"
																		id="fileNameField_${images.id}" style="width: 80%;" />
																		<button class="btn green btn-sm"
																			id="fileNameUpdateBtn_${images.id}" data-id=""
																			style="float: right; margin-top: -30px;">Update</button>
																</span> <script type="text/javascript">
																	$(
																			"#btnRename_<c:out value='${images.id}'/>")
																			.click(
																					function() {
																						$(
																								"#fileNameUpdateSpan_<c:out value='${images.id}'/>")
																								.show();
																						$(
																								"#fileNameInfo_<c:out value='${images.id}'/>")
																								.hide();
																					});

																	$(
																			"#fileNameUpdateBtn_<c:out value='${images.id}'/>")
																			.click(
																					function() {
																						var updatedNm = $(
																								"#fileNameField_<c:out value='${images.id}'/>")
																								.val();
																						var urlAddress = "<c:out value='${pageContext.request.contextPath}'/>/updateAttachmentFileName/"
																								+ updatedNm
																								+ "/<c:out value='${images.id}'/>/"
																								+ "<c:out value='${citationId}'/>";
																						window.location.href = urlAddress;
																					});
																</script></td>
																<td><c:out value="${images.imageType}" /></td>
																<td><c:out value="${images.uploadedDate}" /></td>
																<td><a class="btn green btn-sm"
																	href="<c:url value='/downloadImage/${images.id}' />">
																		<c:out value="Download" />
																</a></td>
																<td><a onclick="enablePageLoadBar()"
																	style="color: #FF0000"
																	href="<c:url value='/deleteImage/${images.id}' />">
																		<c:out value="Delete" />
																</a></td>

																<td><c:if
																		test="${images.imageType == 'PDF' || images.imageType == '4X6M'}">
																		<a class="btn green btn-sm icon-printer"
																			href="<c:url value='/printPDFPages/${images.id}/${citationId}' />">&nbsp;&nbsp;Print</a>
																	</c:if> <c:if
																		test="${images.imageType != 'PDF' && images.imageType != '4X6M'}">
																		<a class="btn green btn-sm icon-printer" href="#"
																			onclick="printImageTypeFile('${pageContext.request.contextPath}/previewImage/${images.id}')">&nbsp;&nbsp;Print</a>
																	</c:if></td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td colspan="6" align="center"><b>No Checks
																	Uploaded</b></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="portlet-title" style="padding-top: 0px;">
						<div class="caption">
							<i class="fa font-blue"></i> <span
								class="caption-subject font-blue sbold">Uploaded
								Correspondence Files</span>
						</div>
						<div class="col-md-12">
							<div class="form-body">
								<div class="form-group">
									<div class="col-md-12">
										<table
											class="table table-bordered table-hover  table-sortable"
											style="margin-bottom: 0px; margin-left: -25px; margin-top: -10px;">
											<thead
												style="background-color: #26A1AB; color: #fff; padding-top: 0px;">
												<tr>
													<th>File Name</th>
													<th>File Type</th>
													<th class="hidden-xs">Uploaded Date</th>
													<th class="hidden-xs">Download</th>
													<th class="hidden-xs">Delete</th>
													<th class="hidden-xs">Print</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${not empty corrList}">
														<c:forEach items="${corrList}" var="corr">
															<tr>
																<td><a style="color: #26A1AB;"
																	href="${pageContext.request.contextPath}/previewCorrespFile/${corr.id}"
																	target="_blank">${corr.documentName}</a></td>
																	<td>${corr.documentFileType}</td>
																<td>${corr.formattedCreatedAt}</td>

																<td><a class="btn green btn-sm"
																	href="${pageContext.request.contextPath}/downloadCorrFile/${corr.id}">Download</a></td>
																<td><a onclick="enablePageLoadBar()"
																	style="color: #FF0000"
																	href="${pageContext.request.contextPath}/deleteCorrespondenceFile/${corr.id}">
																		<c:out value="Delete" />
																</a></td>
																<td><c:if test="${corr.documentFileType == 'PDF'}">
																		<a class="btn green btn-sm icon-printer"
																			href="<c:url value='/printCorrespondencePDF/${corr.id}/${citationId}' />">&nbsp;&nbsp;Print
																		</a>
																	</c:if> <c:if test="${corr.documentFileType != 'PDF'}">
																		<a class="btn green btn-sm icon-printer" href="#"
																			onclick="printImageTypeFile('${pageContext.request.contextPath}/previewCorrespFile/${corr.id}')">&nbsp;&nbsp;Print
																		</a>
																	</c:if></td>

															</tr>
														</c:forEach>
													</c:when>
													<c:when test="${not empty corresp}">
													<c:forEach items="${corresp}" var="images">
															<tr>
																<td id="partFileInfoColumn"
																	style="width: 450px; font-size: 13px;"><span
																	id="fileNameInfo_${images.id}"> <a
																		onclick="enablePageLoadBar()" style="color: #26A1AB;"
																		href="<c:url value='/viewAttachmentAsImages/${images.id}/${citationId}' />"><span
																			style="width: 50px;"><c:out
																					value="${images.imageName}" /></span></a>
																		<button class="btn green btn-sm" data-id=""
																			id="btnRename_${images.id}"
																			style="float: right; font-size: 10px;">Rename</button>
																</span> <span id="fileNameUpdateSpan_${images.id}"
																	style="display: none;"> <input type="text"
																		class="form-control input-sm" name="fileName"
																		value="${images.imageName}"
																		id="fileNameField_${images.id}" style="width: 80%;" />
																		<button class="btn green btn-sm"
																			id="fileNameUpdateBtn_${images.id}" data-id=""
																			style="float: right; margin-top: -30px;">Update</button>
																</span> <script type="text/javascript">
																	$(
																			"#btnRename_<c:out value='${images.id}'/>")
																			.click(
																					function() {
																						$(
																								"#fileNameUpdateSpan_<c:out value='${images.id}'/>")
																								.show();
																						$(
																								"#fileNameInfo_<c:out value='${images.id}'/>")
																								.hide();
																					});

																	$(
																			"#fileNameUpdateBtn_<c:out value='${images.id}'/>")
																			.click(
																					function() {
																						var updatedNm = $(
																								"#fileNameField_<c:out value='${images.id}'/>")
																								.val();
																						var urlAddress = "<c:out value='${pageContext.request.contextPath}'/>/updateAttachmentFileName/"
																								+ updatedNm
																								+ "/<c:out value='${images.id}'/>/"
																								+ "<c:out value='${citationId}'/>";
																						window.location.href = urlAddress;
																					});
																</script></td>
																<td><c:out value="${images.imageType}" /></td>
																<td><c:out value="${images.uploadedDate}" /></td>
																<td><a class="btn green btn-sm"
																	href="<c:url value='/downloadImage/${images.id}' />">
																		<c:out value="Download" />
																</a></td>
																<td><a onclick="enablePageLoadBar()"
																	style="color: #FF0000"
																	href="<c:url value='/deleteImage/${images.id}' />">
																		<c:out value="Delete" />
																</a></td>

																<td><c:if
																		test="${images.imageType == 'PDF' || images.imageType == '4X6M'}">
																		<a class="btn green btn-sm icon-printer"
																			href="<c:url value='/printPDFPages/${images.id}/${citationId}' />">&nbsp;&nbsp;Print</a>
																	</c:if> <c:if
																		test="${images.imageType != 'PDF' && images.imageType != '4X6M'}">
																		<a class="btn green btn-sm icon-printer" href="#"
																			onclick="printImageTypeFile('${pageContext.request.contextPath}/previewImage/${images.id}')">&nbsp;&nbsp;Print</a>
																	</c:if></td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td colspan="4" align="center"><b>No
																	Correspondence Files Uploaded</b></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
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


				</div>



			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	//Print Images
	function printImageTypeFile(url) {
		currHost = window.location.host;
		protocolUsed = window.location.protocol;
		fullUrl = protocolUsed + '//' + currHost + url;
		var preContent = "<img id='printReadyImage' src='"+fullUrl+"'/>";
		var currBodyCon = document.body.innerHTML;
		document.body.innerHTML = preContent;
		$('#printReadyImage')
				.on(
						'load',
						function() {
							setTimeout(
									function() {
										window.print();
										document.body.innerHTML = currBodyCon;
										window.location.href = "<c:url value='/attachments/${citationId}' />";
									}, 500);
						});
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
	position: relative;
	top: 175px;
	left: 600px;
	background: none;
	width: 200px;
	height: 200px;
}

.uil-default-css>div:nth-of-type(2) {
	-webkit-animation: uil-default-anim 1s linear infinite;
	animation: uil-default-anim 1s linear infinite;
	-webkit-animation-delay: -0.4166666666666667s;
	animation-delay: -0.4166666666666667s;
}

.uil-default-css {
	position: relative;
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
	position: relative;
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
	position: relative;
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
	position: relative;
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
	position: relative;
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
	position: relative;
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
	position: relative;
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
	position: relative;
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
	position: relative;
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
	position: relative;
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
	position: relative;
	background: none;
	width: 200px;
	height: 200px;
}
</style>

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
</script>

<script>
	function enablePageLoadBar() {
		document.getElementById('uil-default-css-id').style.display = "block";
	}
</script>

<script>
	$(document)
			.ready(
					function() {

						$('input[type="file"]')
								.change(
										function(e) {
											$("#viewLoadFiles").show();
											document
													.getElementById('fileTypeError').innerHTML = '';
											document
													.getElementById('blockui_uploadbtn').disabled = false;
											var files = e.target.files;
											$("#selectedFilesRow").empty();
											for (var i = 0; i < files.length; i++) {
												var newRowContent = "<tr><td>"
														+ files[i].name
														+ "</td><td>"
														+ files[i].name
																.substr(
																		files[i].name
																				.lastIndexOf('.') + 1)
																.toUpperCase()
														+ "</td><td>"
														+ Math
																.round(files[i].size / 1024)
														+ " Kb" + "</td></tr>";
												$(newRowContent).appendTo(
														$("#upload_files"));
												var fileTypeUploaded = files[i].name
														.substr(
																files[i].name
																		.lastIndexOf('.') + 1)
														.toUpperCase();
												var validFileTypes = [ 'JPEG',
														'PDF', 'JPG', 'TIFF',
														'TIF', '4X6M', 'PRC' ];
												if (validFileTypes
														.indexOf(fileTypeUploaded) == -1) {
													document
															.getElementById('blockui_uploadbtn').disabled = true;
													document
															.getElementById('fileTypeError').innerHTML = 'Invalid File Uploaded. Allowed PDF,JPG,TIFF type of files';
												}
											}
										});
					});
</script>


<script type="text/javascript">
	$('#blockui_uploadbtn').click(function() {
		App.blockUI({
			target : '#blockui_fileUpload_data'
		});
	});
</script>
