<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html lang="en">
<head>
<script language="JavaScript">
	function setFocus() {
		try {
			document.inputForm.ticketNumber.focus();
		} catch (e) {
		}
	}
</script>
</head>
<body onload="javascript:setFocus();">
	<DIV id=pagebkg>
		<div class="user-login-5">
			<div class="page-content">
				<table align="center" style="BACKGROUND: white;">
					<tr>
						<td width="864" align="left">
							<div class="portlet-title">
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td valign="middle" class="topHeading"><b>Metro
												Transit Court</b></td>
									</tr>
									<tr>
										<td valign="top"><a><img
												src=<c:url value='/static/img/transitcourt.jpg'/>
												alt="Go to homepage" border="0" /></a></td>
										<td>&nbsp;&nbsp;&nbsp;</td>
										<td valign="top">
											<div id="sideContent">
												<table class="contactHeader" width="300px" Height="25px"
													style="BACKGROUND: #EBC5FF;">
													<tr>
														<th align="left" class="bodySmall">&nbsp;Contact Us
														<th>
													</tr>
												</table>
												<table width="300px" Height="128px" cellpadding="2"
													cellspacing="2">
													<tr>
														<td class="bodyXSmall"><b>Hours of Operation: </b><br />
															Monday - Thursday 9am - 3pm <br /> Friday - Closed <br /></td>
													</tr>
													<tr>
														<td></td>
													</tr>
													<tr>
														<td class="bodyXSmall"><b>Customer Service line<br />
																213.92COURT &nbsp;&nbsp; (213.922.6878)<br />
																866.320.8807<br /> Mon-Fri 8am - 5pm
														</b></td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
								<table>
									<form:form id="fileupload"
										action="${pageContext.request.contextPath}/attachCorrespondance/${citationId}"
										modelAttribute="uploadForm" method="POST" autocomplete="on"
										enctype="multipart/form-data">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">

													<label class="control-label label-sm col-md-6">Last
														Name</label>
													<div class="col-md-9">
														<input class="form-control input-sm" name="name" id="name"
															style="width: 200px"></input> <span class="alert-danger"
															id="nameError"></span> <span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<div class="form-actions">
											<div class="row">
												<div class="col-md-6" style="margin-left: 13px;">
													<span class="btn green btn-sm fileinput-button"> <i
														class="fa fa-plus"></i> <span> Attachment</span> <input
														type="file" path="fileData" name="fileData"
														onclick="return checkLastName();">
													</span> <span><input type="submit" disabled="disabled"
														class="btn green btn-sm fileinput-button"
														id="blockui_uploadbtn" value=" Upload "></span>
													<button type="button"
														onclick="window.location='${pageContext.request.contextPath}/consumerdetails';"
														class="btn green btn-sm"
														style="position: static; float: none; top: -2px; left: -500px; right: 30px; bottom: 40px">Cancel</button>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-body">
													<div class="form-group">
														<div class="col-md-12" style="margin-left: 15px;">
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
									</form:form>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</DIV>
</body>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	function checkLastName() {
		var name = document.getElementById('name').value;
		if (name.length < 1) {
			document.getElementById('nameError').innerHTML = 'Enter Last Name';
			document.getElementById('blockui_uploadbtn').disabled = true;
			$("#upload_files tr").not(function(){ return !!$(this).has('th').length; }).remove();
			return false;
		} else {
			document.getElementById('blockui_uploadbtn').disabled = false;
			document.getElementById('nameError').innerHTML = '';
			return true;
		}
	}

	$(document)
			.ready(
					function() {
						$('input[type="file"]')
								.change(
										function(e) {
											$("#upload_files tr").not(function(){ return !!$(this).has('th').length; }).remove();
											var files = e.target.files;
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
											}
										});
					});
</script>
</html>