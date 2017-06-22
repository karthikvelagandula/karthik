
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
		<div class="page-content" style="background-color: #f5f3eb;"
			id="blockui_adminpayment_data">
			<!-- BEGIN THEME PANEL -->
			<br /> <br />
			<!-- BEGIN CONTENT BODY -->
			<div class="page-bar"
				style="position: static; padding: 0 20px; margin: 0px 20px 30px;">
				<ul class="page-breadcrumb">
					<li><a
						href="${pageContext.request.contextPath}/citationview/${citationId}"><spring:message
								code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
					<li><span>Payment</span></li>
				</ul>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
			<div style="text-align: center;">
				<span style="font-size: 16px;"><span style="font-size: 17px"><b>Name:</b></span>&nbsp;${lastName}
					&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px"><b>Violation
							Number:</b></span>&nbsp;${citationId} </span>
			</div>
			<h3 class="payment-Title"
				style="padding-top: 5px; margin-top: 5px; margin-left: 5px">
				Payment Methods</h3>

			<div style="color: red">${TxResultStatus}</div>
			<!-- END PAGE TITLE-->
			<!-- END PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable-line boxless tabbable-reversed">
						<ul class="nav nav-tabs">
							<li class="active${unactiveOncheckPay}${unactiveOncashPay}"><a
								href="#tab_0" data-toggle="tab"> Credit Card </a></li>
							<li class="${unactiveOncheckPay}"><a href="#tab_1"
								data-toggle="tab"> Checks </a></li>
							<li class="${unactiveOncashPay}"><a href="#tab_2"
								data-toggle="tab"> Cash </a></li>
						</ul>
						<div class="tab-content">
							<div
								class="tab-pane active${unactiveOncheckPay}${unactiveOncashPay}"
								id="tab_0">
								<div class="portlet box blue">
									<div class="portlet-title">
										<div class="caption">Provide your billing and credit
											card details</div>
									</div>
									<div class="portlet-body form">

										<div class="form-wizard" style="float: left; width: 855px;">
											<div class="form-body">

												<form:form id="paymentForm" method="post"
													onsubmit="return validateCardInput()"
													action="/ecitation/checkout/${citationId}"
													modelAttribute="paymentForm">
													<div id="payment-form">
														<%-- <label class="control-label col-md-3">Amount <span
															class="required"> * </span>
														</label>
														<div class="col-md-4">
															<form:input type="text" class="form-control"
																path="amount" value="${totalDue}" />
															<span class="help-block"> 
															</span>
														</div> --%>
														<span>Please select from the following:</span><br>
														<div class="radio-inline">
															<label class="radio label-sm"> <form:radiobutton
																	path="amount" id="optionsRadios25" name="amount"
																	value="${totalDue}" onclick="clearOtherAmount();"
																	checked="checked" />Total Amount Due:&nbsp;$${totalDue}
																<span></span>
															</label> <label class="radio label-sm"> <form:radiobutton
																	path="amount" id="optionsRadios28" name="amount"
																	value="0.00" onclick="read();" />Other Amount:&nbsp;<input
																type="text" id="amounttext" name="otheramount">
																<span></span>
															</label> <span class="help-block"><span
																id="cardInputError" style="color: red"></span> <c:if
																	test="${not empty errorMessageCard}">
																	<div class="alert alert-danger">
																		<span>${errorMessageCard}</span>
																	</div>
																</c:if> </span>
														</div>
														<div class="form-group form-md-line-input has-success">
															<label class="col-md-3 control-label"
																for="form_control_1" style="width: 20%;"><b>Credit
																	Card</b></label>
															<div class="col-md-9">
																<div class="form-row">
																	<div id="card-element">
																		<!-- a Stripe Element will be inserted here. -->
																	</div>
																	<!-- Used to display form errors -->
																	<div id="card-errors"></div>
																</div>
															</div>
														</div>
													</div>
													<br />
													<br />
													<div class="form-actions" style="margin-top: 12px;">
														<div class="row" style="margin-bottom: 10px;">
															<div class="col-md-offset-3 col-md-9">
																<input type="submit" class="btn green"
																	value="Process Payment" /> <a
																	href="${pageContext.request.contextPath}/citationview/${citationId}"
																	class="btn default">Cancel</a>
															</div>
														</div>
													</div>
													<div class="col-md-offset-3 col-md-9">
														<span style="color: red;" id="clearError">${errorMessage}</span>
														<span style="color: red;" id="paymentAmountError"></span>
													</div>
												</form:form>
												<c:choose>
													<c:when test="${empty ClientToken}">
														<script
															src="/ecitation/static/assets/global/plugins/jquery.min.js"
															type="text/javascript"></script>
														<script type="text/javascript">
															$(document)
																	.ready(
																			function() {
																				container: "payment-form"
																			});
														</script>
													</c:when>
													<c:otherwise>
														<script
															src="/ecitation/static/assets/global/plugins/jquery.min.js"
															type="text/javascript"></script>
														<script type="text/javascript">
															$(document)
																	.ready(
																			function() {
																				container: "payment-form"
																			});
														</script>
													</c:otherwise>
												</c:choose>
												<div id="form_payment_error"></div>

											</div>



										</div>

									</div>
								</div>
							</div>
							<div class="tab-pane ${unactiveOncheckPay}" id="tab_1">
								<div class="portlet box blue">
									<div class="portlet-title">
										<div class="caption">Pay by Check</div>
									</div>
									<div class="portlet-body form">
										<form:form class="form-horizontal"
											onsubmit="return validateCheckInput()" id="paymentForm1"
											action="${pageContext.request.contextPath}/checkPayment/${citationId}"
											modelAttribute="paymentForm" method="POST"
											enctype="multipart/form-data">
											<div class="form-wizard">
												<div class="form-body">
													<div class="form-group">
														<span style="padding-left: 225px;">Please select
															from the following:</span><br>
														<div class="radio-inline" style="padding-left: 246px;">
															<label class="radio label-sm"> <form:radiobutton
																	path="amount" id="optionsRadios29" name="amount"
																	value="${citation.totalDue}"
																	onclick="clearOtherAmountCheck();" checked="checked" />Total
																Amount Due:&nbsp;$${citation.totalDue} <span></span>
															</label> <label class="radio label-sm"> <form:radiobutton
																	path="amount" id="optionsRadios32" name="amount"
																	value="0.00" onclick="readCheck();" />Other
																Amount:&nbsp;<input type="text" id="amounttext2"
																name="otheramount"> <span></span>
															</label> <span class="help-block"> <span
																id="checkInputError" style="color: red"></span> <c:if
																	test="${not empty errorMessageCheque}">
																	<div class="alert alert-danger">
																		<span>${errorMessageCheque}</span>
																	</div>
																</c:if>
															</span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label label-sm col-md-3">Payment
															Source</label>
														<div class="col-md-9">
															<form:select class="bs-select form-control"
																style="font-size:13px;width:455px;" path="paymentSource">
																<form:option value="" label="Select an Option"></form:option>

																<form:option value="P" label="In-Person"></form:option>
																<form:option value="M" label="Mail"></form:option>
															</form:select>
														</div>
													</div>
													<%-- 				<div class="form-group">
														<label class="control-label col-md-3">Amount <span
															class="required"> * </span>
														</label>
														<div class="col-md-4">
															<form:input type="text" id="entCheckAmt" class="form-control"
																path="amount" value="${totalDue}" />
															<span class="help-block"> <span id="checkInputError" style="color:red"></span>
															<c:if test="${not empty errorMessageCheque}">
                            <div class="alert alert-danger">
                                <span>${errorMessageCheque}</span>
                            </div>
                            </c:if>
                            						</span>
														</div>
													</div> --%>
													<div class="form-group">
														<label class="control-label col-md-3">Check Number
															<span class="required"> * </span>
														</label>
														<div class="col-md-4">
															<form:input type="text" id="entCheckNumber"
																class="form-control" path="account" />
															<span class="help-block"> <span
																id="checkNumberInputError" style="color: red"> </span>
															</span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">Deposit Date
															<span class="required"> * </span>
														</label>
														<div class="col-md-4">
															<div class="input-group input-group-sm date date-picker"
																data-date-format="mm/dd/yyyy" data-date-viewmode="years">
																<form:input path="paymentDate" class="form-control"
																	id="paymentDate" />
																<span class="input-group-btn">
																	<button class="btn default" type="button">
																		<i class="fa fa-calendar"></i>
																	</button>
																</span>
															</div>
														</div>
													</div>


													<div class="form-group">
														<label class="control-label col-md-3">&nbsp;</label>
														<div class="col-md-4" style="margin-left: 15px;">
															<div class="row fileupload-buttonbar">
																<span class="btn green btn-sm fileinput-button"><span>Upload
																		Check</span> <form:input type="file" path="uploadedCheque"
																		multiple="multiple" /> </span> <span
																	class="fileupload-process"> </span>
															</div>
														</div>
													</div>



													<div class="form-group" id="showUploadedFiles"
														style="display: none">
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
							<div class="tab-pane ${unactiveOncashPay}" id="tab_2">
								<div class="portlet box blue">
									<div class="portlet-title">
										<div class="caption">Pay by Cash</div>
									</div>
									<div class="portlet-body form">
										<form:form class="form-horizontal"
											onsubmit="return validateCashInput()" id="paymentForm2"
											action="${pageContext.request.contextPath}/cashPayment/${citationId}"
											modelAttribute="paymentForm" method="POST">
											<div class="form-wizard">
												<div class="form-body">
													<div class="form-group">
														<span style="padding-left: 225px;">Please select
															from the following:</span><br>
														<div class="radio-inline" style="padding-left: 246px;">
															<label class="radio label-sm"> <form:radiobutton
																	path="amount" id="optionsRadios33" name="amount"
																	value="${citation.totalDue}"
																	onclick="clearOtherAmountCash();" checked="checked" />Total
																Amount Due:&nbsp;$${citation.totalDue} <span></span>
															</label> <label class="radio label-sm"> <form:radiobutton
																	path="amount" id="optionsRadios36" name="amount"
																	value="0.00" onclick="readCash();" />Other
																Amount:&nbsp;<input type="text" id="amounttext3"
																name="otheramount"> <span></span>
															</label> <span class="help-block"><span
																id="cashInputError" style="color: red"></span> <c:if
																	test="${not empty errorMessageCash}">
																	<div class="alert alert-danger">
																		<span>${errorMessageCash}</span>
																	</div>
																</c:if> </span>
														</div>
													</div>
													<%-- <div class="form-group">
														<label class="control-label col-md-3">Amount <span
															class="required"> * </span>
														</label>
														<div class="col-md-4">
															<form:input type="text" id="entCashAmt" class="form-control"
																path="amount" value="${totalDue}" />
															<span class="help-block"><span id="cashInputError" style="color:red"></span>
																<c:if test="${not empty errorMessageCash}">
                            <div class="alert alert-danger">
                                <span>${errorMessageCash}</span>
                            </div>
                            </c:if>
															 </span>
														</div>
													</div> --%>
												</div>
												<div class="form-actions">
													<div class="row">
														<div class="col-md-offset-3 col-md-9">
															<input type="submit" class="btn green button-submit"
																value="Process Payment" data-toggle="modal">
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
		</div>
	</div>



	<!-- END CONTENT BODY -->
	<!-- END CONTENT -->
	<!-- BEGIN QUICK SIDEBAR -->

	<!-- END CONTAINER -->


	<script>
		$(document)
				.ready(
						function() {

							$("#paymentDate").datepicker({
								format : 'mm/dd/yyyy'
							}).datepicker("setDate", 'today');

							$('input[type="file"]')
									.change(
											function(e) {
												document
														.getElementById('fileTypeError').innerHTML = '';
												document
														.getElementById('payByChequeBtn').disabled = false;
												var files = e.target.files;
												$("#selectedFilesRow").empty();
												document
														.getElementById('showUploadedFiles').style.display = 'inline';
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
															+ " Kb"
															+ "</td></tr>";
													$(newRowContent).appendTo(
															$("#upload_files"));
													var fileTypeUploaded = files[i].name
															.substr(
																	files[i].name
																			.lastIndexOf('.') + 1)
															.toUpperCase();
													var validFileTypes = [
															'JPEG', 'PDF',
															'JPG', 'PNG' ];
													if (validFileTypes
															.indexOf(fileTypeUploaded) == -1) {
														document
																.getElementById('payByChequeBtn').disabled = true;
														document
																.getElementById('fileTypeError').innerHTML = 'Invalid File Uploaded. Allowed PDF,JPG,PNG type of files';
													}
												}
											});
							$('#amounttext').attr("readonly", true);
							$('#amounttext2').attr("readonly", true);
							$('#amounttext3').attr("readonly", true);

						});
		$('#amounttext').keyup(
				function() {

					document.getElementById("optionsRadios28").value = $(
							'#amounttext').val();
				});
		$("#amounttext").keypress(function(event) {
			if (event.which == 45 || event.which == 189) {
				event.preventDefault();
			}
		});

		$('#amounttext2').keyup(
				function() {

					document.getElementById("optionsRadios32").value = $(
							'#amounttext2').val();
				});
		$("#amounttext2").keypress(function(event) {
			if (event.which == 45 || event.which == 189) {
				event.preventDefault();
			}
		});

		$('#amounttext3').keyup(
				function() {

					document.getElementById("optionsRadios36").value = $(
							'#amounttext3').val();
				});
		$("#amounttext3").keypress(function(event) {
			if (event.which == 45 || event.which == 189) {
				event.preventDefault();
			}
		});
	</script>
	<script type="text/javascript">
		function clearOtherAmount() {

			var amount = $('#amounttext').val();
			if (amount.length) {
				document.getElementById('amounttext').value = '';
			}
			$('#amounttext').attr("readonly", true);
		}
		function read() {
			$('#amounttext').attr("readonly", false);
		}

		function clearOtherAmountCheck() {

			var amount = $('#amounttext2').val();
			if (amount.length) {
				document.getElementById('amounttext2').value = '';
			}
			$('#amounttext2').attr("readonly", true);
		}
		function readCheck() {
			$('#amounttext2').attr("readonly", false);
		}

		function clearOtherAmountCash() {

			var amount = $('#amounttext3').val();
			if (amount.length) {
				document.getElementById('amounttext3').value = '';
			}
			$('#amounttext3').attr("readonly", true);
		}
		function readCash() {
			$('#amounttext3').attr("readonly", false);
		}
	</script>
	<script>
		function validateCheckInput() {
			var checkAmt = document.getElementById('optionsRadios32').value;
			var checkNumber = document.getElementById('entCheckNumber').value;
			var isNumbr = /^[0-9.]+$/.test(checkAmt);
			if (!isNumbr) {
				document.getElementById('checkInputError').innerHTML = 'Invalid Amount';
				return false;
			} else {
				document.getElementById('checkInputError').innerHTML = ' ';
			}

			if (checkNumber.length < 2) {
				document.getElementById('checkNumberInputError').innerHTML = 'Invalid Check Number';
				return false;
			}
		}

		function validateCashInput() {
			var cashAmt = document.getElementById('optionsRadios36').value;
			var isNumbr = /^[0-9.]+$/.test(cashAmt);
			if (!isNumbr) {
				document.getElementById('cashInputError').innerHTML = 'Invalid Amount';
				return false;
			} else {
				document.getElementById('cashInputError').innerHTML = ' ';
				return true;
			}

		}

		function validateCardInput() {
			var cardAmt = document.getElementById('optionsRadios28').value;
			var isNumbr = /^[0-9.]+$/.test(cardAmt);
			if (!isNumbr) {
				document.getElementById('cardInputError').innerHTML = 'Invalid Amount';
				return false;
			} else {
				document.getElementById('cardInputError').innerHTML = ' ';
				return true;
			}
		}
	</script>
	<script src="/ecitation/static/assets/global/plugins/jquery.min.js"
		type="text/javascript"></script>

	<script src="https://js.stripe.com/v3/"></script>

	<script type="text/javascript">
		//Create a Stripe client
		var stripe = Stripe('${stripePublishableKey}');

		// Create an instance of Elements
		var elements = stripe.elements();

		// Custom styling can be passed to options when creating an Element.
		// (Note that this demo uses a wider set of styles than the guide below.)
		var style = {
			base : {
				color : '#32325d',
				lineHeight : '24px',
				fontFamily : '"Helvetica Neue", Helvetica, sans-serif',
				fontSmoothing : 'antialiased',
				fontSize : '16px',
				'::placeholder' : {
					color : '#aab7c4'
				}
			},
			invalid : {
				color : '#fa755a',
				iconColor : '#fa755a'
			}
		};

		//Create an instance of the card Element
		var card = elements.create('card', {
			style : style
		});

		// Add an instance of the card Element into the `card-element` <div>
		card.mount('#card-element');

		// Handle real-time validation errors from the card Element.
		card.addEventListener('change', function(event) {
			var displayError = document.getElementById('card-errors');
			if (event.error) {
				displayError.textContent = event.error.message;
			} else {
				displayError.textContent = '';
			}
		});

		// Handle form submission
		var form = document.getElementById('paymentForm');
		form.addEventListener('submit', function(event) {
			event.preventDefault();

			stripe.createToken(card).then(function(result) {
				if (result.error) {
					// Inform the user if there was an error
					var errorElement = document.getElementById('card-errors');
					errorElement.textContent = result.error.message;
				} else {
					// Send the token to your server
					stripeTokenHandler(result.token);
				}
			});
		});

		function stripeTokenHandler(token) {
			// Insert the token ID into the form so it gets submitted to the server
			var form = document.getElementById('paymentForm');
			var hiddenInput = document.createElement('input');
			hiddenInput.setAttribute('type', 'hidden');
			hiddenInput.setAttribute('name', 'stripeToken');
			hiddenInput.setAttribute('value', token.id);
			form.appendChild(hiddenInput);
			// Submit the form
			form.submit();

			App.blockUI({
				target : '#blockui_adminpayment_data'
			});
		}
	</script>

	<script
		src="<c:url value='/static/assets/global/fieldValidation.js' />"
		type="text/javascript"></script>

	<script>
		function clearErrorMsg() {
			document.getElementById('clearError').innerHTML = '';
			document.getElementById('paymentAmountError').innerHTML = '';
			if (!checkFloatingPointNum('totDue')) {
				document.getElementById('paymentAmountError').innerHTML = 'Invalid Amount';
				return false;
			}
			var payTotDue = <c:out value="${totalDue}"/>
			var givenAmt = document.getElementById('totDue').value;
			if (parseFloat(givenAmt) > parseFloat(payTotDue)) {
				document.getElementById('paymentAmountError').innerHTML = 'Amount should be less than or equal to total due';
				return false;
			}
		}
	</script>


	<style>
.StripeElement {
	background-color: white;
	padding: 8px 12px;
	border-radius: 4px;
	border: 1px solid transparent;
	box-shadow: 0 1px 3px 0 #e6ebf1;
	-webkit-transition: box-shadow 150ms ease;
	transition: box-shadow 150ms ease;
}

.StripeElement--focus {
	box-shadow: 0 1px 3px 0 #cfd7df;
}

.StripeElement--invalid {
	border-color: #fa755a;
}

.StripeElement--webkit-autofill {
	background-color: #fefde5 !important;
}
</style>