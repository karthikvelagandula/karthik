<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- <body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
 -->
<!-- END HEADER -->
<!-- END HEADER -->
<!-- BEGIN HEADER & CONTENT DIVIDER -->
<div class="clearfix"></div>
<!-- END HEADER & CONTENT DIVIDER -->
<!-- BEGIN CONTAINER -->
<br />
<div class="col-md-12">
	<!-- BEGIN CONTENT BODY -->
	<br />
	<div class="page-content" style="background-color: #f5f3eb;"
		id="blockui_consumerpayment_data">
		<!-- BEGIN PAGE HEADER-->
		<!-- BEGIN THEME PANEL -->


		<!-- END PAGE BAR -->
		<!-- BEGIN PAGE TITLE-->
		<h3 class="page-title" style="padding-top: 15px;">
			&nbsp; Payment Methods <span
				style="font-size: 16px; margin-left: 220px; white-space: nowrap;"><span
				style="font-size: 18px" class="fa font-black"><b>Name:</b></span>&nbsp;<b
				class="fa font-gray">${lastName}</b> &nbsp;&nbsp;&nbsp;&nbsp;<span
				style="font-size: 18px" class="fa font-black"><b>Violation
						Number:</b></span> &nbsp;<b class="fa font-gray">${citationId} </b></span>
		</h3>
		<div class="col-md-offset-6 col-md-6">
			<a href="${pageContext.request.contextPath}/consumerdetails"><button
					type="button" class="btn green btn-sm"
					style="width: 70px; float: right; margin-top: -50px;">Back</button></a>
		</div>
		<!-- END PAGE TITLE-->
		<!-- END PAGE HEADER-->

		<div class="row">
			<div class="col-md-12">
				<div class="tabbable-line boxless tabbable-reversed">
					<div class="tab-content">
						<div class="tab-pane active" id="tab_0">
							<div class="portlet box blue">
								<div class="portlet-title">
									<div class="caption">Provide your billing and credit card
										details</div>
								</div>

								<div class="portlet-body">
									<!-- BEGIN FORM-->
									<form:form id="payment-form" method="post"
										action="/ecitation/processConsumerCardPayment"
										modelAttribute="paymentForm" class="form-horizontal">
										<div class="form-body">
											<span>Please select from the following:</span><br>
											<div class="radio-inline">
												<label class="radio label-sm"> <form:radiobutton
														path="amount" id="optionsRadios25" name="amount"
														value="${totalDue}" onclick="clearOtherAmount();"
														checked="checked" />Total Amount Due:&nbsp;$${totalDue} <span></span>
												</label> <label class="radio label-sm"> <form:radiobutton
														path="amount" id="optionsRadios28" name="amount"
														value="0.00" onclick="read();" />Other Amount:&nbsp;<input
													type="text" id="amounttext" name="otheramount"> <span></span>
												</label>
											</div>
											<br />
											<div class="form-group form-md-line-input has-success">
												<label class="col-md-3 control-label" for="form_control_1"
													style="width: 10%;"><b>Credit Card</b></label>
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
											<div class="form-actions" style="margin-top: 12px;">
												<div class="row" style="margin-bottom: 12px;">
													<div class="col-md-offset-3 col-md-9">
														<span style="color: red;" id="clearError">${errorMessage}</span>
														<span style="color: red;" id="paymentAmountError"></span>
													</div>
												</div>
											</div>

											<div class="form-actions">
												<div class="row" style="margin-bottom: 70px;">
													<div class="col-md-offset-3 col-md-9">
														<input type="submit" class="btn green"
															value="Process Payment" /> <a
															href="${pageContext.request.contextPath}/consumerdetails"
															class="btn default">Cancel</a>
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



<script src="/ecitation/static/assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>

<script src="https://js.stripe.com/v3/"></script>

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
	var form = document.getElementById('payment-form');
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
		var form = document.getElementById('payment-form');
		var hiddenInput = document.createElement('input');
		hiddenInput.setAttribute('type', 'hidden');
		hiddenInput.setAttribute('name', 'stripeToken');
		hiddenInput.setAttribute('value', token.id);
		form.appendChild(hiddenInput);
		// Submit the form
		form.submit();

		App.blockUI({
			target : '#blockui_consumerpayment_data'
		});
	}
</script>

<script src="<c:url value='/static/assets/global/fieldValidation.js' />"
	type="text/javascript"></script>

<script>
	$(document).ready(function() {

		$('#amounttext').attr("readonly", true);
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