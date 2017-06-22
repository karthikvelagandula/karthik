<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<div class="page-container" id="blockui_citationentry_data">
	<div class="page-content">
		<br /> <br />
		<div class="page-bar" style="margin: -25px 0px 0;">
			<ul class="page-breadcrumb">
				<li><a onclick="enablePageLoadBar()" style="margin-left: 50px;"
					href="${pageContext.request.contextPath}/citationlist"><spring:message
							code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message
							code="lbl.topmenu.tab.citation.entry" /></span></li>
			</ul>
		</div>

		<!-- Progress Bar -->
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
		<!-- Progress Bar -->


		<div class="row">
			<div class="col-md-12">
				<div class="tabbable-line boxless tabbable-reversed">
					<div id="citationPortlet" class="portlet box green bg-inverse">
						<div class="portlet-title">
							<div class="caption">Violation Form</div>
						</div>
						<div class="portlet-body form">
							<c:if test="${not empty errorInfo}">
								<div class="alert alert-danger">
									<span>${errorInfo}</span>
								</div>
							</c:if>
							<div class="form-body">
								<h3 class="form-section" style="border-bottom-color: #32c5d2">
									Violation <span style="color: red; font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;${errorMessage}
									</span>
								</h3>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label class="control-label label-sm col-md-3">Violation
												Number <span class="required">*</span>
											</label>
											<div class="col-md-9">
												<input type="text" class="form-control input-sm"
													value="${enteredCitionId}" name="citationId"
													placeholder="Violation Number" id="citationid" /> <span
													class="help-block">&nbsp;<%-- <form:errors
															path="citationId" cssClass="alert-danger" /> --%> <span
													class="alert-danger" id="citationidError"></span>
												</span>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label class="control-label label-sm col-md-3">Violation
												Type</label>
											<div class="col-md-9">
												<input id="citationType" class="form-control input-sm"
													disabled />
											</div>
										</div>
									</div>
								</div>
								<div id="transitCitation">
									<form:form id="citationForm"
										onsubmit="return validateCitEntry()"
										action="${pageContext.request.contextPath}/saveTransitCitation"
										modelAttribute="citationForm" method="POST" autocomplete="on"
										enctype="multipart/form-data">
										<form:hidden path="citationId" id="citationIdTransit"></form:hidden>
										<form:hidden path="citationType" id="citationTypeTransit"></form:hidden>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Date
														Of Violation</label>
													<div class="col-md-9">
														<div class="input-group input-group-sm date date-picker"
															data-date-format="mm/dd/yyyy" data-date-end-date="0d"
															data-date-viewmode="years">
															<form:input path="dateOfViolation" class="form-control"
																readonly="false" id="citationDateTransit" />
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
													<label class="control-label label-sm col-md-3">Time</label>
													<div class="col-md-9">
														<div
															class="input-group input-group-sm bootstrap-timepicker timepicker">
															<form:input id="timepickerTransit" path="timeofViolation"
																type="text" class="form-control" data-minute-step="1"></form:input>
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-time"></i></span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">RD
														Number</label>
													<div class="col-md-9">
														<form:select class="form-control select2"
															style="font-size:13px;width:455px;" path="rdNumber"
															placeholder="RD Number" id="rdNumberTransit">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${reportingDistricts}" var="rDistrict">
																<form:option value="${rDistrict.rdNumber}"
																	label="${rDistrict.rdNumber}-${rDistrict.stationName}"
																	data-value="${rDistrict.vehicle} - ${rDistrict.line}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Vehicle</label>
													<div class="col-md-9">
														<input class="form-control input-sm" placeholder="Vehicle"
															id="vehicleTransit" disabled>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Location
														of Violation</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm" path="location"
															placeholder="Location" id="transitLocation"></form:input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">City/County
														of Occurrence</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="cityOfViolation" value="Los Angeles"
															placeholder="City/County of Occurrence"></form:input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<!-- <div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Bus Route/Rail Line</label>
													<div class="col-md-9">
														<input class="form-control input-sm" placeholder="Bus Route/Rail Line" disabled id="transitline"></input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3"></label>
													<div class="col-md-9">
													</div>
												</div>
											</div>
										</div> -->
										<h3 class="form-section"
											style="margin-top: -1px; border-bottom-color: #32c5d2"></h3>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">First
														Name </label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.firstName" placeholder="First Name"
															id="fnamePatron"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="patron.firstName" cssClass="alert-danger" /> <span
															class="alert-danger" id="fnameError"></span>
														</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Middle
														Name</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.middleName" placeholder="Middle Name"
															id="mnamePatron"></form:input>
														<span class="help-block"> <span
															class="alert-danger" id="mnameError"></span>
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Last
														Name </label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.lastName" placeholder="Last Name"
															id="lnamePatron"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="patron.lastName" cssClass="alert-danger" /> <span
															class="alert-danger" id="lnameError"></span>
														</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Address</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.address.address" placeholder="Address"
															id="patronAddress"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="patron.address.address" cssClass="alert-danger" />
															<span class="alert-danger" id="aptError"></span>
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Street
														Name </label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.address.addressLine2"
															placeholder="Street Name" id="cityPatron"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="patron.address.city" cssClass="alert-danger" /> <span
															class="alert-danger" id="streetError"></span>
														</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Unit/Apt
														Number </label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.address.addressLine1"
															placeholder="Unit/Apt Number" id="addressPatron"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="patron.address.addressLine1"
																cssClass="alert-danger" /> <span class="alert-danger"
															id="aptError"></span>
														</span>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">City
													</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.address.city" placeholder="City"
															id="cityPatron"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="patron.address.city" cssClass="alert-danger" /> <span
															class="alert-danger" id="cityError"></span>
														</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Address
														State</label>
													<div class="col-md-9">
														<form:select class="bs-select form-control"
															style="font-size:13px;width:455px;"
															path="patron.address.state" placeholder="State">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${states}" var="state">
																<form:option value="${state.description}"
																	label="${state.description}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;<form:errors
																path="patron.address.state" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>

										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Zip
														Code </label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.address.zip" placeholder="Zip Code"
															id="zipcodePatron"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="patron.address.zip" cssClass="alert-danger" /> <span
															class="alert-danger" id="zipcodeError"></span>
														</span>
													</div>
												</div>
											</div>
										</div>
										<h3 class="form-section"
											style="margin-top: -1px; border-bottom-color: #32c5d2"></h3>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">TAP
														Card Number</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.tapNumber" placeholder="TAP Card Number"></form:input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">ID
														Type</label>
													<div class="col-md-9">
														<form:select path="patron.driverLicenseOrId"
															placeholder="ID Type"
															class="bs-select form-control input-sm">
															<form:option value="" label="Select an Option"></form:option>
															<form:option value="DL" label="Driver License"></form:option>
															<form:option value="ST" label="State ID"></form:option>
															<form:option value="PP" label="Passport"></form:option>
															<form:option value="SI" label="Student ID"></form:option>
															<form:option value="RA" label="Resident Alien Card"></form:option>
															<form:option value="None" label="None"></form:option>
															<form:option value="OT" label="Other"></form:option>
														</form:select>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">ID
														No</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.otherId" placeholder="ID No"></form:input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">ID
														State</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.otherState" placeholder="ID State"></form:input>

													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="col-md-3 control-label label-sm">ID
														in Possession</label>
													<div class="col-md-9">
														<div class="mt-radio-inline">
															<label class="mt-radio label-sm"> <form:radiobutton
																	path="patron.isIdVerified" id="optionsRadios34"
																	value="false" />YES <span></span>
															</label> <label class="mt-radio label-sm"> <form:radiobutton
																	path="patron.isIdVerified" id="optionsRadios35"
																	value="true" />NO <span></span>
															</label>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">DOB</label>
													<div class="col-md-9">
														<form:input class="form-control" readonly="false"
															id="citationDob" path="patron.dob"
															placeholder="mm/dd/yyyy"
															onchange="_calculateAge(this.value)"></form:input>
														<!-- <span class="input-group-btn">
																<button class="btn default" type="button">
																	<i class="fa fa-calendar"></i>
																</button>
															</span> -->
														<span class="help-block">&nbsp;<span
															class="alert-danger" id="citationdobError"></span>
														</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Age</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.age" placeholder="Age" id="age"
															readonly="true"></form:input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label class="control-label  label-sm col-md-3">Sex
													</label>
													<div class="col-md-9">
														<div class="mt-radio-inline">
															<label class="mt-radio label-sm"> <form:radiobutton
																	path="patron.sex" id="maleRadio" value="M" />Male <span></span>
															</label> <label class="mt-radio label-sm"> <form:radiobutton
																	path="patron.sex" id="femaleRadio" value="F" />Female
																<span></span>
															</label> <span class="help-block">&nbsp;<form:errors
																	path="patron.sex" cssClass="alert-danger" /></span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Hair</label>
													<div class="col-md-9">
														<form:select class="bs-select form-control"
															style="font-size:13px;width:455px;" path="patron.hair"
															placeholder="Hair">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${hair}" var="hairs">
																<form:option value="${hairs.code}"
																	label="${hairs.description}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Eyes</label>
													<div class="col-md-9">
														<form:select class="bs-select form-control"
															style="font-size:13px;width:455px;" path="patron.eyes"
															placeholder="Eyes">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${eyes}" var="eye">
																<form:option value="${eye.code}"
																	label="${eye.description}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Height</label>
													<div class="col-md-3">
														<form:select path="patron.heightInFeet"
															id="heightPatronInFeet" placeholder="Feet">
															<form:option value="" label=""></form:option>
															<form:option value="1">1</form:option>
															<form:option value="2">2</form:option>
															<form:option value="3">3</form:option>
															<form:option value="4">4</form:option>
															<form:option value="5">5</form:option>
															<form:option value="6">6</form:option>
															<form:option value="7">7</form:option>
														</form:select>
														<span class="help-block">(Ft)<!-- <span
														class="alert-danger" id="heightError"></span> --></span>
													</div>
													<div class="col-md-3">
														<form:select path="patron.heightInInch"
															id="heightPatronInInch" placeholder="Inches">
															<form:option value="" label=""></form:option>
															<form:option value="0">0</form:option>
															<form:option value="1">1</form:option>
															<form:option value="2">2</form:option>
															<form:option value="3">3</form:option>
															<form:option value="4">4</form:option>
															<form:option value="5">5</form:option>
															<form:option value="6">6</form:option>
															<form:option value="7">7</form:option>
															<form:option value="8">8</form:option>
															<form:option value="9">9</form:option>
															<form:option value="10">10</form:option>
															<form:option value="11">11</form:option>
														</form:select>
														<span class="help-block">(Inch)<!-- <span
														class="alert-danger" id="heightError"></span> --></span>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Weight</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="patron.weight" placeholder="Weight"
															id="weightPatron"></form:input>
														<span class="help-block"><span class="alert-danger"
															id="weightError"></span></span>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Race</label>
													<div class="col-md-9">
														<form:select class="bs-select form-control"
															style="font-size:13px;width:455px;" path="patron.race"
															placeholder="Race">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${race}" var="races">
																<form:option value="${races.code}"
																	label="${races.description}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<h3 class="form-section"
											style="margin-top: -1px; border-bottom-color: #32c5d2"></h3>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label col-md-3">LACMTA Admin
														Code </label>
													<div class="col-md-9">
														<form:select class="form-control select2"
															id="adminCodeTransit" name="adminCode"
															style="font-size:13px;width:455px;"
															path="violationCode.id" placeholder="Violation Code">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${violationCodes}" var="violationCode">
																<form:option value="${violationCode.id}"
																	data-value='{"fine":"${violationCode.standardFine}","minfine":"${violationCode.minorsFine}","desc":"${violationCode.description}","type":"${violationCode.discriminatorValue}"}'
																	data-type="${violationCode.discriminatorValue}"
																	label="${violationCode.code}-${violationCode.description}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;<form:errors
																path="violationCode" cssClass="alert-danger" /> <span
															id="citationidError" class="alert-danger"></span>
														</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Fine
														Amount</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															id="penaltyAmtTransit" placeholder="$0.00"
															path="penaltyAmt" readonly="false"></form:input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<h3 class="form-section"
											style="margin-top: 1px; border-bottom-color: #32c5d2">Notes</h3>
										<div class="  col-md-9">
											<div class="mt-radio-inline">
												<label class="mt-radio label-sm"> <form:radiobutton
														path="comments[0].commentType" id="optionsRadios36"
														value="I" />Internal <span></span>
												</label> <label class="mt-radio label-sm"> <form:radiobutton
														path="comments[0].commentType" id="optionsRadios37"
														value="E" checked="true" />External <span></span>
												</label>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-md-12">
													<form:textarea name="markdown" path="comments[0].comment"
														rows="5" cols="10"
														style="width:100%;text-transform: uppercase;"></form:textarea>
												</div>
											</div>
										</div>
										<div class="row" style="margin-top: 27px;">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Issuing
														Officer</label>
													<div class="col-md-9">
														<form:select class="form-control select2"
															id="inspIdTransit" name="inspId"
															style="font-size:13px;width:455px;" path="issuingOfficer"
															placeholder="Issuing Officer">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${inspectors}" var="inspector">
																<form:option
																	value="${inspector.lastName} ${inspector.firstName}"
																	data-value='{"inspId":"${inspector.employeeId}"}'
																	data-id="${inspector.employeeId}"
																	label="${inspector.lastName} ${inspector.firstName}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Employee
														No </label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="employeeNumber" placeholder="Employee Number"
															id="employeeNumberTransit"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="employeeNumber" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>
										</div>
										<h3 class="form-section"
											style="margin-top: 0px; margin-bottom: 5px; border-bottom-color: #32c5d2">
											Attachments<span style="color: red; font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;${errorMessage}
											</span>
										</h3>
										<div class="row">
											<div class="col-md-6"
												style="margin-left: 25px; margin-top: 30px;">
												<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
												<div class="row fileupload-buttonbar">
													<div class="col-lg-7">
														<span class="btn green btn-sm fileinput-button"> <i
															class="fa fa-plus"></i> <span> Browse</span> <input
															type="file" name="file" multiple="multiple">
														</span> <span class="fileupload-process"> </span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
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
										<div class="form-actions">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-offset-12 col-md-12">
															<input type="submit" class="btn green btn-sm"
																style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																value="Save" id="blockui_savebtn" />
															<button type="button"
																onclick="window.location='${pageContext.request.contextPath}/citationentry';"
																class="btn green btn-sm"
																style="position: static; float: none; top: -2px; left: -500px; right: 30px; bottom: 40px">Cancel</button>
														</div>
													</div>
												</div>
												<div class="col-md-6"></div>
											</div>
										</div>
									</form:form>
								</div>
								<div id="parkingCitation">
									<form:form id="citationForm"
										onsubmit="return validateCitParking()"
										action="${pageContext.request.contextPath}/saveParkingCitation"
										modelAttribute="citationForm" method="POST" autocomplete="on"
										enctype="multipart/form-data">
										<form:hidden path="citationId" id="citationIdParking"></form:hidden>
										<form:hidden path="citationType" id="citationTypeParking"></form:hidden>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Date
														Of Violation</label>
													<div class="col-md-9">
														<div class="input-group input-group-sm date date-picker"
															data-date-format="mm/dd/yyyy" data-date-end-date="0d"
															data-date-viewmode="years">
															<form:input path="dateOfViolation" class="form-control"
																readonly="false" id="citationDateParking" />
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
													<label class="control-label label-sm col-md-3">Time</label>
													<div class="col-md-9">
														<div
															class="input-group input-group-sm bootstrap-timepicker timepicker">
															<form:input id="timepickerParking" path="timeofViolation"
																type="text" class="form-control" data-minute-step="1"></form:input>
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-time"></i></span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">RD
														Number</label>
													<div class="col-md-9">
														<form:select class="form-control select2"
															style="font-size:13px;width:455px;" path="rdNumber"
															placeholder="RD Number" id="rdNumberParking">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${reportingDistricts}" var="rDistrict">
																<form:option value="${rDistrict.rdNumber}"
																	label="${rDistrict.rdNumber}-${rDistrict.stationName}"
																	data-value="${rDistrict.vehicle} - ${rDistrict.line}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Vehicle</label>
													<div class="col-md-9">
														<input class="form-control input-sm" placeholder="Vehicle"
															id="vehicleParking" disabled>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label col-md-3">Parked At Or
														Near</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="plateEntity.parkedAtOrNear"
															placeholder="Parked At Or Near" id="parkinglocation"></form:input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">In
														the City of</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															value="Los Angeles" path="location"
															placeholder="Location"></form:input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<!-- <div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Bus Route/Rail Line</label>
													<div class="col-md-9">
														<input class="form-control input-sm" placeholder="Bus Route/Rail Line" disabled id="parkingline"></input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div> -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label  label-sm col-md-3">Drive
														Away </label>
													<div class="col-md-9">
														<div class="mt-radio-inline">
															<label class="mt-radio label-sm"> <form:radiobutton
																	path="plateEntity.isDriveAway" id="optionsRadios25"
																	value="1" />Yes <span></span>
															</label> <label class="mt-radio label-sm"> <form:radiobutton
																	path="plateEntity.isDriveAway" id="optionsRadios26"
																	value="0" />No <span></span>
															</label>
														</div>
													</div>
												</div>
											</div>
										</div>
										<h3 class="form-section"
											style="margin-top: -1px; border-bottom-color: #32c5d2"></h3>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Vehicle
														Plate Number </label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="plateEntity.licenceNumber"
															placeholder="Vehicle Plate Number" id="vhclLicNmbr"></form:input>
														<span class="help-block"><form:errors
																path="plateEntity.licenceNumber" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">VIN
														Number </label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="plateEntity.vinNumber" placeholder="VIN Number"></form:input>
														<span class="help-block"><form:errors
																path="plateEntity.vinNumber" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Plate
														State</label>
													<div class="col-md-9">
														<form:select class="bs-select form-control"
															style="font-size:13px;width:455px;"
															path="plateEntity.licenseState"
															placeholder="License State">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${states}" var="state">
																<form:option value="${state.description}"
																	label="${state.description}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Plate
														Month/Year </label>
													<div class="col-md-3">
														<form:select path="plateEntity.licenseMonth"
															id="licenseMonth" placeholder="Month">
															<form:option value="" label=""></form:option>
															<form:option value="01">01</form:option>
															<form:option value="02">02</form:option>
															<form:option value="03">03</form:option>
															<form:option value="04">04</form:option>
															<form:option value="05">05</form:option>
															<form:option value="06">06</form:option>
															<form:option value="07">07</form:option>
															<form:option value="08">08</form:option>
															<form:option value="09">09</form:option>
															<form:option value="10">10</form:option>
															<form:option value="11">11</form:option>
															<form:option value="12">12</form:option>
														</form:select>
														<span class="help-block"></span>
													</div>
													<div class="col-md-3">
														<form:input class="form-control input-sm"
															path="plateEntity.licenseYear" placeholder="Year"></form:input>
														<span class="help-block"></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label col-md-3">Vehicle Body
														Type </label>
													<div class="col-md-9">
														<form:select path="plateEntity.bodyType"
															class="bs-select form-control input-sm">
															<form:option value="" label="Select an Option"></form:option>
															<form:option value="PASS" label="PASS"></form:option>
															<form:option value="TRUCK" label="TRUCK"></form:option>
															<form:option value="MOTORCYCLE" label="MOTORCYCLE"></form:option>
															<form:option value="SUV" label="SUV"></form:option>
															<form:option value="OTHER" label="OTHER"></form:option>
														</form:select>
														<span class="help-block">&nbsp;<form:errors
																path="plateEntity.bodyType" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label col-md-3">Vehicle Make
													</label>
													<div class="col-md-9">
														<form:select path="plateEntity.vehicleMake"
															class="bs-select form-control input-sm">
															<form:option value="" label="Select an Option"></form:option>
															<form:option value="BMW" label="BMW"></form:option>
															<form:option value="BUICK" label="BUICK"></form:option>
															<form:option value="CAD" label="CAD"></form:option>
															<form:option value="CHEV" label="CHEV"></form:option>
															<form:option value="CADI" label="CADI"></form:option>
															<form:option value="DODG" label="DODG"></form:option>
															<form:option value="FORD" label="FORD"></form:option>
															<form:option value="GMC" label="GMC"></form:option>
															<form:option value="HOND" label="HOND"></form:option>
															<form:option value="HYUN" label="HYUN"></form:option>
															<form:option value="INFI" label="INFI"></form:option>
															<form:option value="JEEP" label="JEEP"></form:option>
															<form:option value="KIA" label="KIA"></form:option>
															<form:option value="LEX" label="LEX"></form:option>
															<form:option value="MAZD" label="MAZD"></form:option>
															<form:option value="MER" label="MER"></form:option>
															<form:option value="NISS" label="NISS"></form:option>
															<form:option value="PONT" label="PONT"></form:option>
															<form:option value="SCION" label="SCION"></form:option>
															<form:option value="TOYT" label="TOYT"></form:option>
															<form:option value="VOLK" label="VOLK"></form:option>
															<form:option value="OTHER" label="OTHER"></form:option>
														</form:select>
														<span class="help-block">&nbsp;<form:errors
																path="plateEntity.vehicleMake" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label col-md-3">Vehicle Model
													</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="plateEntity.vehicleModel"
															placeholder="Vehicle Model"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="plateEntity.vehicleModel" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label col-md-3">Vehicle Color
													</label>
													<div class="col-md-9">
														<form:select path="plateEntity.vehicleColor"
															class="bs-select form-control input-sm">
															<form:option value="" label="Select an Option"></form:option>
															<form:option value="BGE" label="BGE"></form:option>
															<form:option value="BLK" label="BLK"></form:option>
															<form:option value="BLU" label="BLU"></form:option>
															<form:option value="BRN" label="BRN"></form:option>
															<form:option value="GLD" label="GLD"></form:option>
															<form:option value="GRY" label="GRY"></form:option>
															<form:option value="GRN" label="GRN"></form:option>
															<form:option value="MAR" label="MAR"></form:option>
															<form:option value="RED" label="RED"></form:option>
															<form:option value="SIL" label="SIL"></form:option>
															<form:option value="WHI" label="WHI"></form:option>
															<form:option value="YEL" label="YEL"></form:option>
															<form:option value="OTHER" label="OTHER"></form:option>
														</form:select>
														<span class="help-block">&nbsp;<form:errors
																path="plateEntity.vehicleColor" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>
										</div>
										<h3 class="form-section"
											style="margin-top: -1px; border-bottom-color: #32c5d2"></h3>
										<div class="row" style="margin-top: 27px;">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Issuing
														Officer</label>
													<div class="col-md-9">
														<form:select class="form-control select2"
															id="inspIdParking" name="inspId"
															style="font-size:13px;width:455px;" path="issuingOfficer"
															placeholder="Issuing Officer">
															<form:option value="" label="Select an Option"></form:option>
															<c:forEach items="${inspectors}" var="inspector">
																<form:option
																	value="${inspector.lastName} ${inspector.firstName}"
																	data-value='{"inspId":"${inspector.employeeId}"}'
																	data-id="${inspector.employeeId}"
																	label="${inspector.lastName} ${inspector.firstName}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Employee
														No </label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															path="employeeNumber" placeholder="Employee Number"
															id="employeeNumberParking"></form:input>
														<span class="help-block">&nbsp;<form:errors
																path="employeeNumber" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>
										</div>
										<h3 class="form-section"
											style="margin-top: 5px; border-bottom-color: #32c5d2">Notes</h3>
										<div class="row form-group">
											<div class="  col-md-9">
												<div class="mt-radio-inline">
													<label class="mt-radio label-sm"> <form:radiobutton
															path="comments[0].commentType" id="optionsRadios36"
															value="I" />Internal <span></span>
													</label> <label class="mt-radio label-sm"> <form:radiobutton
															path="comments[0].commentType" id="optionsRadios37"
															value="E" checked="true" />External <span></span>
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-md-12">
													<form:textarea name="markdown" path="comments[0].comment"
														rows="5" cols="10"
														style="width:100%;text-transform: uppercase;"></form:textarea>
												</div>
											</div>
										</div>
										<div class="row" style="margin-top: 20px;">
											<div class="col-md-6">
												<div class="form-group"></div>
											</div>
											<div class="col-md-6">Fine Amount
												<div class="form-group"></div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label col-md-3">LACMTA Admin
														Code </label>
													<div class="col-md-9">
														<form:select class="form-control select2"
															id="adminCodeParking" name="adminCode"
															style="font-size:13px;width:455px;"
															path="violationCode.id" placeholder="Violation Code">
															<form:option value="" label=""></form:option>
															<c:forEach items="${violationCodes}" var="violationCode">
																<form:option value="${violationCode.id}"
																	data-value='{"fine":"${violationCode.standardFine}","desc":"${violationCode.description}","type":"${violationCode.discriminatorValue}"}'
																	data-type="${violationCode.discriminatorValue}"
																	label="${violationCode.code}-${violationCode.description}"></form:option>
															</c:forEach>
														</form:select>
														<span class="help-block">&nbsp;<form:errors
																path="violationCode" cssClass="alert-danger" /> <span
															id="citationidError" class="alert-danger"></span>
														</span>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label label-sm col-md-3">Fine
														Amount</label>
													<div class="col-md-9">
														<form:input class="form-control input-sm"
															id="penaltyAmtParking" placeholder="$0.00"
															path="penaltyAmt" readonly="false"></form:input>
														<span class="help-block">&nbsp;</span>
													</div>
												</div>
											</div>
										</div>
										<h3 class="form-section"
											style="margin-top: 0px; margin-bottom: 5px; border-bottom-color: #32c5d2">
											Attachments<span style="color: red; font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;${errorMessage}
											</span>
										</h3>
										<div class="row">
											<div class="col-md-6"
												style="margin-left: 25px; margin-top: 30px;">
												<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
												<div class="row fileupload-buttonbar">
													<div class="col-lg-7">
														<span class="btn green btn-sm fileinput-button"> <i
															class="fa fa-plus"></i> <span> Browse</span> <input
															type="file" name="file" multiple="multiple"
															id="parkingFiles">
														</span> <span class="fileupload-process"> </span>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-body">
													<div class="form-group">
														<div class="col-md-12">
															<table
																class="table table-hover table-bordered  table-sortable"
																id="upload_files_parking" style="width:">
																<thead style="background-color: #26A1AB; color: #fff">
																	<tr>
																		<th>File Name</th>
																		<th class="hidden-xs">File Type</th>
																		<th class="hidden-xs">File size</th>
																	</tr>
																</thead>
																<tbody id="selectedFilesParkingRow">
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
															<span id="fileTypeParkingError" style="color: #E82734"></span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="form-actions">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-offset-12 col-md-12">
															<input type="submit" class="btn green btn-sm"
																style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
																value="Save" id="blockui_savebtn_parking" />
															<button type="button"
																onclick="window.location='${pageContext.request.contextPath}/citationentry';"
																class="btn green btn-sm"
																style="position: static; float: none; top: -2px; left: -500px; right: 30px; bottom: 40px">Cancel</button>
														</div>
													</div>
												</div>
												<div class="col-md-6"></div>
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
	<!-- END CONTENT BODY -->
</div>
<!-- END CONTENT -->
<!-- END CONTAINER -->
<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>
<script>
	function _calculateAge(birthday) {
		var birthDate = new Date(birthday);
		var ageDifMs = Date.now() - birthDate.getTime();
		if (ageDifMs < 0) {
			document.getElementById('citationDob').innerHTML = "";
			document.getElementById('citationdobError').innerHTML = 'Invalid Dob';
			return false;
		} else {
			var ageDate = new Date(ageDifMs);
			var age = Math.abs(ageDate.getUTCFullYear() - 1970);
			document.getElementById("age").value = age;
		}
	}
	$(document)
			.ready(
					function() {
						$('#citationType').val('${citationForm.citationType}');
						var enteredCITID = $('#citationid').val();
						if (enteredCITID != '') {
							if (enteredCITID.includes('T')) {
								$("#parkingCitation").hide();
								$("#transitCitation").show();
							} else if (enteredCITID.includes('P')) {
								$("#parkingCitation").show();
								$("#transitCitation").hide();
							} else {
								$("#parkingCitation").hide();
								$("#transitCitation").show();
							}
						} else {
							$("#citationTypeTransit").val("Transit");
							$("#citationType").val("Transit");
						}
						if ($("#citationTypeTransit").val() == "Transit") {
							$("#parkingCitation").hide();
							$("#transitCitation").show();
							toggleAdminCode("T");
						} else if ($("#citationTypeParking").val() == "Parking") {
							$("#parkingCitation").show();
							$("#transitCitation").hide();
							toggleAdminCodeParking("P");
						} else {
							$("#parkingCitation").hide();
							$("#transitCitation").hide();
						}
						$('input[type="file"]')
								.change(
										function(e) {
											document
													.getElementById('fileTypeError').innerHTML = '';
											document
													.getElementById('blockui_savebtn').disabled = false;
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
														'PDF', 'JPG', 'TIFF' ];
												if (validFileTypes
														.indexOf(fileTypeUploaded) == -1) {
													document
															.getElementById('blockui_savebtn').disabled = true;
													document
															.getElementById('fileTypeError').innerHTML = 'Invalid File Uploaded. Allowed PDF,JPG,TIFF type of files';
												}
											}
										});
						$('#parkingFiles')
								.change(
										function(e) {
											document
													.getElementById('fileTypeParkingError').innerHTML = '';
											document
													.getElementById('blockui_savebtn_parking').disabled = false;
											var files = e.target.files;
											$("#selectedFilesParkingRow")
													.empty();
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
												$(newRowContent)
														.appendTo(
																$("#upload_files_parking"));
												var fileTypeUploaded = files[i].name
														.substr(
																files[i].name
																		.lastIndexOf('.') + 1)
														.toUpperCase();
												var validFileTypes = [ 'JPEG',
														'PDF', 'JPG', 'TIFF' ];
												if (validFileTypes
														.indexOf(fileTypeUploaded) == -1) {
													document
															.getElementById('blockui_savebtn_parking').disabled = true;
													document
															.getElementById('fileTypeParkingError').innerHTML = 'Invalid File Uploaded. Allowed PDF,JPG,TIFF type of files';
												}
											}
										});
						$("#citationDateTransit").datepicker({
							format : 'mm/dd/yyyy'
						}).datepicker("setDate", 'today');
						$("#citationDateParking").datepicker({
							format : 'mm/dd/yyyy'
						}).datepicker("setDate", 'today');
						$("#timepickerTransit").timepicker('setTime',
								new Date());
						$("#timepickerParking").timepicker('setTime',
								new Date());
						function toggleAdminCode(violationCodetype) {
							$('#adminCodeTransit > option').each(function() {
								var obj = $(this).data("type");
								if (obj == violationCodetype) {
									$(this).show();
									$(this).prop('disabled', false);
								} else {
									$(this).hide();
									$(this).prop('disabled', true);
								}

							});
							var $owner_id = $("#adminCodeTransit");
							$owner_id.select2();
						}
						function toggleAdminCodeParking(violationCodetype) {
							$('#adminCodeParking > option').each(function() {
								var obj = $(this).data("type");
								if (obj == violationCodetype) {
									$(this).show();
									$(this).prop('disabled', false);
								} else {
									$(this).hide();
									$(this).prop('disabled', true);
								}

							});
							var $owner_id = $("#adminCodeParking");
							$owner_id.select2();
						}
						$("#adminCodeTransit").change(
								function() {
									var age = $('#age').val();									
									if (age && age < 17)
									{										
										var val = $(this).find(':selected').data("value").minfine;
										$('#penaltyAmtTransit').val("$" + val);
									}
									else
									{
										var val = $(this).find(':selected').data("value").fine;
										$('#penaltyAmtTransit').val("$" + val);
									}
								     
								});
						$("#penaltyAmtTransit")
								.on(
										"change paste",
										function() {
											var newpmt = document
													.getElementById('penaltyAmtTransit').value;
											if (newpmt.indexOf("$") <= -1) {
												newpmt = "$"
														+ document
																.getElementById('penaltyAmtTransit').value;
												$("#penaltyAmtTransit").val(
														newpmt);
											}
											if (newpmt.indexOf(".") <= -1) {
												newpmt = document
														.getElementById('penaltyAmtTransit').value
														+ ".00";
												$("#penaltyAmtTransit").val(
														newpmt);
											}

										});
						$("#penaltyAmtParking")
								.on(
										"change paste",
										function() {
											var newpmt = document
													.getElementById('penaltyAmtParking').value;
											if (newpmt.indexOf("$") <= -1) {
												newpmt = "$"
														+ document
																.getElementById('penaltyAmtParking').value;
												$("#penaltyAmtParking").val(
														newpmt);
											}
											if (newpmt.indexOf(".") <= -1) {
												newpmt = document
														.getElementById('penaltyAmtParking').value
														+ ".00";
												$("#penaltyAmtParking").val(
														newpmt);
											}

										});
						$("#inspIdTransit").change(
								function() {
									if ($(this).find(':selected').val() != "") {
										var val = $(this).find(':selected')
												.data("value").inspId;
										$('#employeeNumberTransit').val(val);
									}
								});
						$('#employeeNumberTransit')
								.focusout(
										function() {
											var empno = $(this).val();
											var empnoNotFond = true;
											$('#inspIdTransit > option')
													.each(
															function() {
																var inspId = $(
																		this)
																		.data(
																				"id");
																if (inspId == empno) {
																	$(
																			"#inspIdTransit")
																			.val(
																					$(
																							this)
																							.val())
																			.change();
																	empnoNotFond = false;
																}
															});
											if (empnoNotFond) {
												$("#inspIdTransit").val("")
														.change();
											}
										});
						$("#inspIdParking").change(
								function() {
									if ($(this).find(':selected').val() != "") {
										var val = $(this).find(':selected')
												.data("value").inspId;
										$('#employeeNumberParking').val(val);
									}
								});
						$('#employeeNumberParking')
								.focusout(
										function() {
											var empno = $(this).val();
											var empnoNotFond = true;
											$('#inspIdParking > option')
													.each(
															function() {
																var inspId = $(
																		this)
																		.data(
																				"id");
																if (inspId == empno) {
																	$(
																			"#inspIdParking")
																			.val(
																					$(
																							this)
																							.val())
																			.change();
																	empnoNotFond = false;
																}
															});
											if (empnoNotFond) {
												$("#inspIdParking").val("")
														.change();
											}
										});
						$("#adminCodeParking").change(
								function() {
									var val = $(this).find(':selected').data(
											"value").fine;
									$('#penaltyAmtParking').val("$" + val);
								});
						$('#citationid')
								.keyup(
										function() {
											var val = $(this).val();
											if (val.length == 1) {
												var isnum = /^\d+$/.test(val
														.charAt(0));
												var res = val.toUpperCase();
												document
														.getElementById("citationid").value = res;
											}
											if ($(this).val().startsWith("T") === true) {
												$("#parkingCitation").hide();
												$("#transitCitation").show();
												$("#citationTypeTransit").val(
														"Transit");
												$("#citationType").val(
														"Transit");
												toggleAdminCode("T");
											} else if ($(this).val()
													.startsWith("P") === true) {
												$("#parkingCitation").show();
												$("#transitCitation").hide();
												$("#citationTypeParking").val(
														"Parking");
												$("#citationType").val(
														"Parking");
												toggleAdminCodeParking("P");
											}
										});
						$("#citationDob")
								.keyup(
										function(d) {
											if (d.keyCode != 193
													&& d.keyCode != 111) {
												if (d.keyCode != 8) {
													if ($(this).val().length == 2) {
														if ($(this).val() > 12
																|| $(this)
																		.val() < 1) {
															document
																	.getElementById('citationdobError').innerHTML = 'Month must be between 1 and 12';
															$(this).val("");
															return false;
														} else {
															document
																	.getElementById('citationdobError').innerHTML = ' ';
															$(this)
																	.val(
																			$(
																					this)
																					.val()
																					+ "/");
														}
													} else if ($(this).val().length == 5) {
														var temp = $(this)
																.val();
														var dobdate = temp
																.substring(3, 5) - 0;
														var month = temp
																.substring(0, 2) - 0;
														if (month == 4
																|| month == 6
																|| month == 9
																|| month == 11) {
															if (dobdate > 30) {
																document
																		.getElementById('citationdobError').innerHTML = 'Month '
																		+ month
																		+ ' does not have '
																		+ dobdate
																		+ ' days!';
																$(this)
																		.val(
																				temp
																						.substring(
																								0,
																								3)
																						+ "");
																return false;
															} else {
																document
																		.getElementById('citationdobError').innerHTML = ' ';
																$(this)
																		.val(
																				$(
																						this)
																						.val()
																						+ "/");
															}
														} else {
															if (dobdate > 31) {
																document
																		.getElementById('citationdobError').innerHTML = 'Month '
																		+ month
																		+ ' does not have '
																		+ dobdate
																		+ ' days!';
																$(this)
																		.val(
																				temp
																						.substring(
																								0,
																								3)
																						+ "");
																return false;
															} else {
																document
																		.getElementById('citationdobError').innerHTML = ' ';
																$(this)
																		.val(
																				$(
																						this)
																						.val()
																						+ "/");
															}
														}
													}
													else if($(this).val().length == 10)
														{
															var temp = $(this)
																.val();
															var dobdate = temp
																.substring(3, 5) - 0;
															var month = temp
																.substring(0, 2) - 0;
															var year = temp.substring(6,10) - 0;
															var leapyear = year%4;
															if (month == 2 && leapyear == 0) {
																if (dobdate > 29) {
																	document
																			.getElementById('citationdobError').innerHTML = 'Month '
																			+ month
																			+ ' does not have '
																			+ dobdate
																			+ ' days!';
																	$(this)
																			.val(
																					temp
																							.substring(
																									0,
																									3)
																							+ "");
																	return false;
																}
															}
															else if(month == 2)
																{
																if (dobdate > 28) {
																	document
																			.getElementById('citationdobError').innerHTML = 'Month '
																			+ month
																			+ ' does not have '
																			+ dobdate
																			+ ' days!';
																	$(this)
																			.val(
																					temp
																							.substring(
																									0,
																									3)
																							+ "");
																	return false;
																}
																}
														}
												} else {
													var temp = $(this).val();
													if ($(this).val().length == 5) {
														$(this).val(
																temp.substring(
																		0, 4));
													} else if ($(this).val().length == 2) {
														$(this).val(
																temp.substring(
																		0, 1));
													}
												}
											} else {
												var temp = $(this).val();
												var tam = $(this).val().length;
												$(this).val(
														temp.substring(0,
																tam - 1));
											}
										});
						$("#rdNumberTransit")
								.change(
										function() {
											var vechilce = $(this).find(
													':selected').data('value');
											console.log(vechilce);
											var val = $('#rdNumberTransit')
													.val();
											console.log(val);
											console.log("rdNumber value" + val);
											var text = $(
													'#rdNumberTransit option:selected')
													.text();
											var myStringArray = text.split('-');
											console.log("rdNumber text" + text)
											$('#transitline').val(val);
											$('#transitLocation').val(
													myStringArray[1]);
											$('#vehicleTransit').val(vechilce);

										});
						$("#rdNumberParking")
								.change(
										function() {
											var vechilce = $(this).find(
													':selected').data('value');
											console.log(vechilce);
											var val = $('#rdNumberParking')
													.val();
											console.log(val);
											console.log("rdNumber value" + val);
											var text = $(
													'#rdNumberParking option:selected')
													.text();
											console.log("rdNumber text" + text)
											var myStringArray = text.split('-');
											$('#parkingline').val(val);
											$('#parkinglocation').val(
													myStringArray[1]);
											$('#vehicleParking').val(vechilce);
										});

					});
</script>
<script src="<c:url value='/static/assets/global/fieldValidation.js' />"
	type="text/javascript"></script>
<script type="text/javascript">
	function validateCitEntry() {
		//document.getElementById('weightError').innerHTML = '';
		//document.getElementById('fnameError').innerHTML = '';
		//document.getElementById('mnameError').innerHTML = '';
		//	document.getElementById('lnameError').innerHTML = '';
		//document.getElementById('addressError').innerHTML = '';
		//document.getElementById('cityError').innerHTML = '';
		//document.getElementById('citationidError').innerHTML = '';
		var citId = document.getElementById('citationid').value;
		if (citId.length < 7) {
			document.getElementById('citationidError').innerHTML = 'Invalid citationId';
			document.getElementById('citationid').focus();
			return false;
		} else {
			var preChar = citId.slice(0, 1);
			var postNum = citId.slice(1, 6);
			var preRes = /^[a-zA-Z]+$/.test(preChar);
			var postRes = /^[0-9]+$/.test(postNum);
			if (!preRes || !postRes) {
				document.getElementById('citationidError').innerHTML = 'Invalid citationId';
				return false;
			}
		}
		if ($("#citationTypeTransit").val() == "Transit") {
			$('#citationIdTransit').val($('#citationid').val());
		}
		//if (checkInputCharRange('fnamePatron', 50)) {
		// document.getElementById('fnameError').innerHTML = 'Invalid First Name';
		//return false;
		//}
		//if (checkCharRangeWhenNotNull('mnamePatron', 46)) {
		//document.getElementById('mnameError').innerHTML = 'Invalid Middle Name';
		//return false;
		//}
		//if (checkInputCharRange('lnamePatron', 46)) {
		//document.getElementById('lnameError').innerHTML = 'Invalid Last Name';
		//return false;
		//	}
		//if (!checkFloatingPointNum('weightPatron')) {
		//document.getElementById('weightError').innerHTML = 'Invalid Weight';
		//return false;
		//}
		//if (checkInputCharRange('addressPatron', 95)) {
		//document.getElementById('addressError').innerHTML = 'Invalid Address(< 95 chars)';
		//return false;
		//}
		//if (checkInputCharRange('cityPatron', 30)) {
		//document.getElementById('cityError').innerHTML = 'Invalid City';
		//return false;
		//}
		//}
		App.blockUI({
			target : '#blockui_citationentry_data'
		});
	}
</script>
<script type="text/javascript">
	function validateCitParking() {
		$('#citationIdParking').val($('#citationid').val());
		document.getElementById('citationidError').innerHTML = '';

		var citId = document.getElementById('citationid').value;
		if (citId.length < 7) {
			document.getElementById('citationidError').innerHTML = 'Invalid citationId';
			document.getElementById('citationid').focus();
			return false;
		} else {
			var preChar = citId.slice(0, 1);
			var postNum = citId.slice(1, 6);
			var preRes = /^[a-zA-Z]+$/.test(preChar);
			var postRes = /^[0-9]+$/.test(postNum);
			if (!preRes || !postRes) {
				document.getElementById('citationidError').innerHTML = 'Invalid citationId';
				return false;
			}
		}
		App.blockUI({
			target : '#blockui_citationentry_data'
		});
	}
</script>
<script type="text/javascript">
	$("#maleRadio").change(function() {
		$("#nameSuffixId").val('Mr');
	});
	$("#femaleRadio").change(function() {
		$("#nameSuffixId").val('Ms');
	});
</script>

<script type="text/javascript">
	$('#blockui_uploadbtn').click(function() {
		App.blockUI({
			target : '#blockui_citationentry_data'
		});
	});
</script>


<!-- Progress Bar -->
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
	top: 170px;
	left: 600px;
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
</script>
<script>
	function enablePageLoadBar() {
		document.getElementById('uil-default-css-id').style.display = "block";
	}
</script>
<!-- Progress Bar -->