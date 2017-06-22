<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link
	href="<c:url value='/static/assets/global/plugins/datatables/datatables.min.css' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/static/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css' />"
	rel="stylesheet" type="text/css" />
<div class="page-container" style="margin-top: 70px;">
	<div class="page-content">

		<div class="portlet-title"
			style="padding-top: 20px; padding-left: 30px;">
			<div class="caption">
				<i class="fa font-blue"></i> <span
					class="caption-subject font-blue sbold">Manage Letters</span>
			</div>
		</div>
		<div class="portlet-body"
			style="padding-top: 30px; padding-left: 45px;">
			<div class="row">
				<div class="col-md-12">
					<form:form id="fileupload"
						action="${pageContext.request.contextPath}/uploadletter"
						modelAttribute="uploadLetterFile" method="POST" autocomplete="on"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label label-sm col-md-3">Violation
										Type</label>
									<div class="col-md-9">
										<select id="letterType" class="bs-select form-control">
											<option value="" label="All">All</option>
											<option value="Transit" label="Transit" selected>Transit</option>
											<option value="Parking" label="Parking">Parking</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-actions right">
									<label class="control-label label-sm col-md-8"><span><form:errors
												path="file" cssClass="alert-danger" /></span></label> <span
										class="btn green fileinput-button"> <span>Browse</span>
										<form:input type="file" name="file" path="file" />
									</span> <span> <input type="submit"
										class="btn green fileinput-button" id="blockui_uploadbtn"
										value=" Upload ">
									</span>

								</div>
							</div>
						</div>
					</form:form>
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
		</div>
		<!-- template start -->
		<!-- Begin: life time stats -->
		<div class="portlet light portlet-fit bordered">
			<div class="portlet-body"
				style="padding-top: 15px; padding-left: 45px;">
				<div class="table-container">
					<table class="table  table-bordered table-hover"
						id="fileUploadTable">
						<thead style="background-color: #26A1AB; color: #fff">
							<tr data-type="header">
								<th>File Name</th>
								<th>File Type</th>
								<th>Code</th>
								<th>Description</th>
								<th class="hidden-xs">Uploaded By</th>
								<th class="hidden-xs">Uploaded Date</th>
								<th class="hidden-xs">Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty uploadedLetterFiles}">
									<tr data-type="norec" style="background-color: #f5f3eb;">
										<td colspan="6" align="center"><b>No Letters Uploaded</b></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${uploadedLetterFiles}"
										var="uploadedLetterFile">
										<tr
											data-type="${uploadedLetterFile.letter.discriminatorValue}"
											style="background-color: #f5f3eb;">
											<td><a style="color: #26A1AB;"
												href="<c:url value='/downloadLetter/${uploadedLetterFile.id}' />"><span>
														${uploadedLetterFile.letterFileName}</span></a></td>

											<td>${uploadedLetterFile.letterFileType}</td>

											<td>${uploadedLetterFile.letter.code}</td>

											<td>${uploadedLetterFile.letter.description}</td>

											<td>${uploadedLetterFile.uploadedBy}</td>

											<td>${uploadedLetterFile.formattedUploadedDate}</td>

											<td><a class="btn green btn-sm"
												href="<c:url value='/deleteLetter/${uploadedLetterFile.id}' />">
													Delete </a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- End: life time stats -->
		<!-- template end -->
	</div>
	<!-- END CONTENT BODY -->
	<!-- END CONTENT -->
	<!-- END CONTAINER -->
</div>

<script>
$(document).ready(function() {
	$('#letterType').val('${letterType}').attr("selected", "selected");
	$("#blockui_uploadbtn").hide();
	$("#fileUploadTye").hide();

	$('input[type="file"]').change(function(e){
		document.getElementById('fileTypeError').innerHTML = '';
		document.getElementById('blockui_uploadbtn').disabled = false;
        var fileSelected = e.target.files[0];
        console.log(fileSelected.name);
        $("#selectedFilesRow").empty();
        var newRowContent = "<tr><td>"+fileSelected.name+"</td><td>"+fileSelected.name.substr(fileSelected.name.lastIndexOf('.')+1).toUpperCase()+"</td><td>"+Math.round(fileSelected.size/1024)+ " Kb"+"</td></tr>";
       	$(newRowContent).appendTo($("#selectedFilesRow"));
       	var fileTypeUploaded = fileSelected.name.substr(fileSelected.name.lastIndexOf('.')+1).toUpperCase();
       	var validFileTypes = ['DOCX', 'DOC'];
           if(validFileTypes.indexOf(fileTypeUploaded) == -1) {
           	document.getElementById('blockui_uploadbtn').disabled = true;
           	document.getElementById('fileTypeError').innerHTML = 'Invalid File Uploaded. Allowed DOC,DOCX type of files';
           }
           $("#blockui_uploadbtn").show();
           $("#fileUploadTye").show();
       });
	
	if ($("#letterType").val() == "Transit")
	{
		toggleUploadLetter("T");
	} else if($("#letterType").val() == "Parking")
	{
		toggleUploadLetter("P");
	}else 
	{		
		toggleUploadLetter("");
	} 
	function toggleUploadLetter(letterType)
	{
		 $('#fileUploadTable tr').each(function() {
			 var obj = $(this).data("type");
			 if (letterType != "")
				{
					if (obj == letterType)
					{							
						 $(this).show();
						 console.log("showing  letters"+obj);
						 
					}
					else if (obj!="header" && obj!="norec")
					{							
						$(this).hide();
						console.log("hiding letters"+obj);
						
					}
				}
				else
				{
					$(this).show();	
					console.log("showing letters"+obj);
				}
			 	
	     });
	}
	$("#letterType").change(function(){	
		var val = $(this).find(':selected').val();
		console.log(val);
		if (val == "Transit")
    	{
    		toggleUploadLetter("T");
    	}
    	else if (val == "Parking")
    	{
    		toggleUploadLetter("P");
    	}
    	else
    	{
    		toggleUploadLetter("");
    	}
    	
    	
	});	
	$('#fileUploadTable').DataTable(
			{
				"paging":   false,
			    "info":     false,
			    "searching": false,
			    "orderClasses": false,
			    "aoColumnDefs" : [   
				{
				  'bSortable' : false,  
				  'aTargets' : [ 0 ,1,2,3,4,6]
				}],
			   "scrolly": false,
			}
			);

});  
</script>

<script type="text/javascript">
$('#blockui_uploadbtn').click(function() {	
    App.blockUI({
        target: '#blockui_attachments_data'
    });
});

</script>