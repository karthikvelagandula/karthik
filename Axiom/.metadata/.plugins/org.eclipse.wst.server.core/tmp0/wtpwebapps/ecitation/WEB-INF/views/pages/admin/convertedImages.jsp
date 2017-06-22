<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link
	href="<c:url value='/static/assets/global/plugins/datatables/datatables.min.css' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/static/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css' />"
	rel="stylesheet" type="text/css" />


<!-- BEGIN CONTAINER -->

<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">
		<!-- BEGIN PAGE HEADER-->
		<div>
			<div class="portlet light portlet-fit bordered">
				<div style="text-align: center;">
					<span style="font-size: 16px;"><span style="font-size: 17px"><b>Name:</b></span>&nbsp;${lastName}
						&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px"> <b>Violation
								Number:</b></span>&nbsp;${citationId} </span>
				</div>
				<div class="portlet-title">

					<div class="page-bar" style="margin-top: -12px;">
						<ul class="page-breadcrumb">
							<li><a onclick="enablePageLoadBar()"
								href="${pageContext.request.contextPath}/attachments/${citationId}"><span
									class="title"><spring:message
											code="lbl.sidemenu.tab.attachments" /></span></a> <i
								class="fa fa-circle"></i></li>
							<li><span class="title"><a
									href="<c:url value='/previewImage/${parentFileId}' />">${parentImageName}</a></span></li>
						</ul>
					</div>

				</div>


				<div class="portlet-body">
					<div class="row">
						<div class="col-md-6" style="width: 43%">
							<div class="form-group">
								<div class="col-md-9">

									<table class="table  table-bordered table-hover order-column"
										id="sample_1" style="width: 500px; margin-left: -10px;">
										<thead style="background-color: #26A1AB; color: #fff">
											<tr>
												<th>Page List <input type="submit"
													class="btn white btn-bg"
													style="background-color: #364150; color: #fff; padding-left: 25px; padding-right: 25px;; float: right; margin-right: 8px;"
													value="UPDATE ALL"
													onclick="saveUpdatedFNames('<c:url value='/updateAllConvertedImageNames/${citationId}/${parentFileId}/' />')" />
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty images}">
													<tr>
														<td colspan="3" align="center"><b>Unable to
																convert PDF to Image.Upload valid PDF</b></td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${convertedImageList}" var="images"
														varStatus="status">
														<tr>
															<td><span style="display: none">${images.fId}</span>
																<div>
																	<a href="#" class="imgstyle"> <img
																		src="<c:url value='/previewImage/${images.fId}' />"
																		width="270px" height="190px" />
																	</a>
																</div>
																<div style="margin-top: 12px; margin-bottom: 0px;">

																	<input type="text" class="form-control input-sm"
																		name="${images.fName}_${images.fId}"
																		value="${images.fName}" id="${images.fId}"
																		onchange="callUpdateFName('${images.fId}')" />
																</div></td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>

								</div>
							</div>
						</div>
						<!--/span-->
						<div class="col-md-6" style="margin-left: -100px; width: 57%">
							<div class="form-group">
								<div class="col-md-9">
									<a id="conImagePreviewId"
										href="<c:url value='/previewImage/${defaultPreview}' />"
										target="_blank"> <img
										src="<c:url value='/previewImage/${defaultPreview}' />"
										alt="No Page Preview" id="showPreviewImg" width="670px"
										height="800px" />
									</a>
								</div>
							</div>
						</div>
						<!--/span-->
					</div>
					<!--/row-->


				</div>
			</div>
		</div>
	</div>
</div>

<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>


<script>
	 var updatedNmJsonArray = [];
	 
	 function callUpdateFName(fileId) {
		 var updatedNmJson = new Object();
		 var fNm = document.getElementById(fileId).value;
		 updatedNmJson.fId = parseInt(fileId);
		 updatedNmJson.fName = fNm;
		 updatedNmJsonArray.push(updatedNmJson);
     }
	 
	 function saveUpdatedFNames(submitURL) {
		 var updtdNmJsonFormat = JSON.stringify(updatedNmJsonArray);
		 window.location.href = submitURL+updtdNmJsonFormat;
	 }
	 
	$(".imgstyle").click(function() {
		$("#showPreviewImg").attr("src", $(this).children('img').attr('src'));
	});
	
	$(".imgstyle").click(function() {
		var currImageSrc = $(this).children('img').attr('src');
		$("#showPreviewImg").attr("src", currImageSrc);
		$("#conImagePreviewId").attr('href', currImageSrc);
	});
</script>


<style>
img {
	transition: -webkit-transform 0.25s ease;
	transition: transform 0.25s ease;
}

#showPreviewImg:hover {
	-webkit-transform: scale(1.2);
	transform: scale(1.2);
	-ms-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-o-transform: scale(1.2);
}
</style>

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