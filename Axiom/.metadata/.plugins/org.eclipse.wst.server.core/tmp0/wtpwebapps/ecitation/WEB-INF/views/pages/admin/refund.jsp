
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<!-- BEGIN CONTENT -->
	<div class="clearfix"></div>
	<!-- END HEADER & CONTENT DIVIDER -->
	<!-- BEGIN CONTAINER -->

	<br />
	<div class="col-md-12">
		<!-- BEGIN CONTENT BODY -->

		<!-- BEGIN PAGE HEADER-->
		<br />
		<div class="page-content" style="background-color: #f5f3eb;" id="blockui_adminpayment_data">
			<!-- BEGIN THEME PANEL -->
			<br />
			<br />
			<!-- BEGIN CONTENT BODY -->
			<div class="page-bar"
				style="position: static; padding: 0 20px; margin: 0px 20px 30px;">
				<ul class="page-breadcrumb">
					<li><a href="${pageContext.request.contextPath}/citationview/${refundsForm.citationID}"><spring:message
								code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
					<li><a href="${pageContext.request.contextPath}/paymentDetails/${refundsForm.citationID}"><span>
						Payments/Adjustments</span></a> <i class="fa fa-circle"></i></li>
					<li><span>Refund</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<div style="text-align:center;">
					<span style="font-size: 16px;"><span
							style="font-size: 17px"><b>Name:</b></span>&nbsp;${lastName}
							&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px"><b>Violation
									Number:</b></span>&nbsp;${refundsForm.citationID} </span></div>
			

			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable-line boxless tabbable-reversed">
						<div class="portlet box green bg-inverse">
							<div class="portlet-title">
								<div class="caption">Refunds Form</div>
							</div>
							<div class="portlet-body form">
								<form:form action="${pageContext.request.contextPath}/refundCheck/${paymentId}" onsubmit="return validateCheckInput()" 
									modelAttribute="refundsForm" method="POST" enctype="multipart/form-data">
									<div class="form-body">
										<div class="form-group">
											<div class="row">
												<label class="control-label label-sm col-md-3">Violation Number</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm">
														<form:input type="text" path="citationID"
															class="form-control" readonly="true" disable="disabled"/>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group" style="display: none">
												<label class="control-label label-sm col-md-3">PaymentID</label>
												<div class="col-md-9">
													<div class="input-group input-group-sm">
														<form:input type="text" path="paymentID"
															class="form-control" readonly="true" disable="disabled" />
													</div>
												</div>
										</div>
										<div class="form-group">
										<div class="row">
											<label class="control-label col-md-3">Amount <span
												class="required"> * </span>
											</label>
											<div class="col-md-4">
												<form:input type="text" id="entCheckAmt"
													class="form-control" path="amount" value="${totalDue}" readonly="true"/>
												<span></span>
											</div>
											</div>
											
										</div>
										<div class="form-group">
										<div class="row">
											<label class="control-label col-md-3">Check Number <span
												class="required"> * </span>
											</label>
											<div class="col-md-4">
												<form:input type="text" id="entCheckNumber"
													class="form-control" path="account" />
												<span class="help-block"> <span
													id="checkNumberInputError" style="color: red"> </span>
												</span>
											</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<label class="control-label col-md-3">Refund Date <span
													class="required"> * </span>
												</label>
												<div class="col-md-4">
													<div class="input-group input-group-sm date date-picker"
														data-date-format="mm/dd/yyyy" data-date-viewmode="years">
														<form:input path="processDate" class="form-control"
															id="paymentDate" />
														<span class="input-group-btn">
															<button class="btn default" type="button">
																<i class="fa fa-calendar"></i>
															</button>
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
											<label class="control-label col-md-3">&nbsp;</label>
											<div class="col-md-4" style="margin-left: 15px;">
												<div class="row fileupload-buttonbar">
													<span class="btn green btn-sm fileinput-button"><span>Upload
															Check</span> <form:input type="file" path="uploadedCheque"
															multiple="multiple" /> </span> <span class="fileupload-process">
													</span>
												</div>
											</div>
											</div>
										</div>
										<div class="form-group" id="showUploadedFiles"
											style="display: none">
											<div class="row">
											<label class="control-label col-md-3"><span
												id="fileTypeError" style="color: #E82734"></span></label>
											<div class="col-md-4">

												<table
													class="table table-hover table-bordered  table-sortable"
													id="upload_files">
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
										<div class="form-actions">
											<div class="row">
												<div class="col-md-offset-3 col-md-9">
													<input type="submit" class="btn green button-submit"
														value="Process Payment" data-toggle="modal"
														id="payByChequeBtn">
												</div>
											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<script>
window.onload = function(e) {
			$("#paymentDate").datepicker({
				format : 'mm/dd/yyyy'
			}).datepicker("setDate", 'today');
			
			$('input[type="file"]').change(function(e){
				document.getElementById('fileTypeError').innerHTML = '';
				document.getElementById('payByChequeBtn').disabled = false;
				var files = e.target.files;
	            $("#selectedFilesRow").empty();
	            document.getElementById('showUploadedFiles').style.display = 'inline';
	            for (var i = 0; i < files.length; i++)
	            {
	            	var newRowContent = "<tr><td>"+files[i].name+"</td><td>"+files[i].name.substr(files[i].name.lastIndexOf('.')+1).toUpperCase()+"</td><td>"+Math.round(files[i].size/1024)+ " Kb"+"</td></tr>";
	            	$(newRowContent).appendTo($("#upload_files"));
	            	var fileTypeUploaded = files[i].name.substr(files[i].name.lastIndexOf('.')+1).toUpperCase();
	            	var validFileTypes = ['JPEG', 'PDF', 'JPG', 'PNG'];
	                if(validFileTypes.indexOf(fileTypeUploaded) == -1) {
	                	document.getElementById('payByChequeBtn').disabled = true;
	                	document.getElementById('fileTypeError').innerHTML = 'Invalid File Uploaded. Allowed PDF,JPG,PNG type of files';
	                }
	            }
	        });
	}
function validateCheckInput() {
    var checkNumber = document.getElementById('entCheckNumber').value;
    if(checkNumber.length < 2) {
        document.getElementById('checkNumberInputError').innerHTML = 'Invalid Check Number';
        return false;
    }
}
</script>