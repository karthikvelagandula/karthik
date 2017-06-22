<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper" id="blockui_citationdetails_data">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">
		<!-- BEGIN PAGE HEADER-->
		<div class="page-bar">
			<ul class="page-breadcrumb">
				<li><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/citationlist"><spring:message
							code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message
							code="lbl.sidemenu.tab.citation.details" /></span></li>
			</ul>

		</div>
		<!--<div class="btn green" style="width:100px;float:right;margin-bottom:20px;"><a href="getCitationId.action?citationId=${citationObj.citationId}" style="text-decoration:none;color:#fff;"><i class="fa fa-plus">&nbsp;&nbsp;<b>Calendar</b></i></a></div>-->

		<c:if
			test="${citationForm.status!='PAID' && citationForm.status!='CLOSED' &&citationForm.status!='VIOD' && citationForm.status!='OVERPAID' && citationForm.totalDue>0.00}">
			<div class="btn green btn-sm"
				style="width: 60px; float: right; margin-bottom: 10px; margin-top: 10px">
				<a onclick="enablePageLoadBar()"
					href="<c:url value='/citationview/${citationId}' />"
					style="text-decoration: none; color: #fff;">Back</a>
			</div>
		</c:if>
		<!-- END PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<div class="tabbable-line boxless tabbable-reversed">
					<div id="citationPortlet" class="portlet box green bg-inverse">
						<div class="portlet-title">
							<div class="caption">Violation Form</div>
						</div>
						<div class="portlet-body form">

							<!-- BEGIN FORM-->
							<form:form id="citationForm"
								onsubmit="return validateCitDetails()"
								action="${pageContext.request.contextPath}/citationdetails"
								modelAttribute="citationForm" method="POST" autocomplete="on"
								enctype="multipart/form-data">
								<div class="form-body">

									<h3 class="form-section " style="border-bottom-color: #32c5d2">
										Violation <span style="color: red; font-size: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;${errorMessage}
										</span>
									</h3>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group form-group-sm">
												<label class="control-label label-sm col-md-3">Violation
													Number<span class="required">*</span>
												</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="citationId"
														placeholder="Violation Number" id="citationid"
														readonly="true"></form:input>
													<span class="help-block">&nbsp;<%-- <form:errors
															path="citationId" cssClass="alert-danger" /> --%> <span
														class="alert-danger" id="citationidError"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Violation
													Type</label>
												<div class="col-md-9">
													<form:input path="citationType"
														class="form-control input-sm" readonly="true" />
												</div>
											</div>
										</div>
										<!--/span-->
									</div>

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
									<!--/row-->
									<div class="row">
										<!--/span-->
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
										<!--/span-->
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
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">City/County
													of Occurrence</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="cityOfViolation"
														placeholder="City/County of Occurrence"></form:input>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Bus
													Route/Rail Line</label>
												<div class="col-md-9">
													<input class="form-control input-sm"
														placeholder="Bus Route/Rail Line" disabled
														id="transitline"></input> <span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3"></label>
												<div class="col-md-9"></div>
											</div>
										</div>
									</div>
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
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Middle
													Name</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="patron.middleName" placeholder="Middle Name"
														id="mnamePatron"></form:input>
													<span class="help-block"> <span class="alert-danger"
														id="mnameError"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
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
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Address
												</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="patron.address.address" placeholder="Address"
														id="addressPatron"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="patron.address.address" cssClass="alert-danger" />
														<span class="alert-danger" id="aptError"></span>
													</span>
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Street
													Name </label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="patron.address.addressLine2"
														placeholder="Street Name" id="streetPatron"></form:input>
													<span class="help-block">&nbsp;<form:errors
															path="patron.address.addressLine2"
															cssClass="alert-danger" /> <span class="alert-danger"
														id="streetError"></span>
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
										<div class="col-md-6">
											<div class="form-group" style="padding-left: 15px;">
												<label class="icheckbox_square-green checked"> <form:checkbox
														id="inlineCheckbox1" path="nixie" value="1"></form:checkbox><span></span>
													NIXIE
												</label>
											</div>
										</div>
									</div>
									<div class="row">

										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Address
													Source</label>
												<div class="col-md-9">
													<form:select class="bs-select form-control"
														style="font-size:13px;width:455px;" path="addressSource">
														<form:option value="" label="Select an Option"></form:option>

														<form:option value="P" label="In-Person"></form:option>
														<form:option value="M" label="Mail"></form:option>
													</form:select>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
									</div>
									<!--/row-->
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
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">ID No</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm"
														path="patron.otherId" placeholder="ID No"></form:input>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->

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
												<label class="col-md-3 control-label label-sm">ID in
													Possession</label>
												<div class="col-md-9">
													<div class="mt-radio-inline">
														<label class="mt-radio label-sm"> <form:radiobutton
																path="patron.isIdVerified" id="optionsRadios34"
																value="true" />YES <span></span>
														</label> <label class="mt-radio label-sm"> <form:radiobutton
																path="patron.isIdVerified" id="optionsRadios35"
																value="false" />NO <span></span>
														</label>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->

									</div>
									<!--/row-->

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">

												<label class="control-label label-sm col-md-3">DOB</label>
												<div class="col-md-9">

													<form:input class="form-control" placeholder="mm/dd/yyyy"
														id="citationDob" path="patron.dob"
														onchange="_calculateAge(this.value)"></form:input>
													<!-- <span class="input-group-btn">
																	<button class="btn default" type="button">
																		<i class="fa fa-calendar"></i>
																	</button>
																</span> -->

													<!-- /input-group -->
													<span class="help-block">&nbsp;<span
														class="alert-danger" id="citationdobError"></span>
												</div>
											</div>
										</div>
										<!--/span-->


										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Age</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="patron.age"
														placeholder="Age" id="age" readonly="true"></form:input>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
										<!--/span-->

									</div>
									<!--/row-->
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
																path="patron.sex" id="femaleRadio" value="F" />Female <span></span>
														</label> <span class="help-block">&nbsp;<form:errors
																path="patron.sex" cssClass="alert-danger" /></span>
													</div>
												</div>
											</div>
										</div>
										<!--/span-->
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
										<!--/span-->
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
										<!--/span-->

									</div>
									<!--/row-->
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Height</label>
												<div class="col-md-4">
													&nbsp;
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
												<div class="col-md-4">
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
										<!--/span-->
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
									<!--/row-->
									<h3 class="form-section"
										style="margin-top: -1px; border-bottom-color: #32c5d2"></h3>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">LACMTA Admin
													Code </label>
												<div class="col-md-9">
													<form:select class="form-control select2" id="adminCode"
														name="adminCode" style="font-size:13px;width:455px;"
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
															path="violationCode" cssClass="alert-danger" /></span>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Fine
													Amount</label>
												<div class="col-md-9">
													<form:hidden id="penaltyAmthide" path="penaltyAmthide"></form:hidden>
													<form:input class="form-control input-sm" id="penaltyAmt"
														path="penaltyAmt" placeholder="$0.00" readonly="false"></form:input>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-3">Status</label>
												<div class="col-md-9">
													<form:select path="status" class="form-control input-sm">
														<form:option value="PENDING" label="PENDING"></form:option>
														<form:option value="PAID" label="PAID"></form:option>
														<form:option value="ISSUED" label="ISSUED"></form:option>
														<form:option value="CLOSED" label="CLOSED"></form:option>
														<form:option value="VIOD" label="CLOSED - VOID"></form:option>
														<form:option value="OVERPAID" label="CLOSED - OVERPAID"></form:option>
													</form:select>
													<span class="help-block">&nbsp;</span>
												</div>
											</div>

										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label label-sm col-md-3">Total
													Due</label>
												<div class="col-md-9">
													<form:input class="form-control input-sm" path="totalDue"
														placeholder="Total Due" id="totalDueCit"></form:input>
													<form:hidden path="totalDuehide" placeholder="Total Due"
														id="totalDueCithide"></form:hidden>
													<span class="help-block"> <span
														id="totalDueCitError" class="alert-danger"></span>
													</span>
												</div>
											</div>
										</div>

									</div>
									<!--/row-->
									<h3 class="form-section"
										style="margin-top: 1px; border-bottom-color: #32c5d2">Notes</h3>
										<c:choose>
										<c:when test="${not empty citationForm.comments[0].comment}">
									<div class="  col-md-9">
										<div class="mt-radio-inline">
											<label class="mt-radio label-sm"> <form:radiobutton
													path="comments[0].commentType" id="optionsRadios36"
													value="I" />Internal <span></span>
											</label> <label class="mt-radio label-sm"> <form:radiobutton
													path="comments[0].commentType" id="optionsRadios37"
													value="E" />External <span></span>
											</label>
										</div>
									</div>
									</c:when>
									<c:otherwise>
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
									</c:otherwise>
									</c:choose>
									<!--/row-->
									<div class="row">
										<div class="form-group">
											<div class="col-md-12">
												<form:textarea name="markdown" path="comments[0].comment"
													rows="5" cols="10"
													style="width:100%;text-transform: uppercase;"></form:textarea>
											</div>
										</div>
									</div>
								</div>

								<div class="row" style="margin-top: 25px;">
									<div class="col-md-6">
										<div class="form-group">
											<label class="control-label label-sm col-md-3">Issuing
												Officer</label>
											<div class="col-md-9">
												<form:select class="form-control select2" id="inspId"
													name="inspId" style="font-size:13px;width:455px;"
													path="issuingOfficer" placeholder="Issuing Officer">
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
									<!--/span-->
									<div class="col-md-6">
										<div class="form-group">
											<label class="control-label label-sm col-md-3">Employee
												No </label>
											<div class="col-md-9">
												<form:input class="form-control input-sm"
													path="employeeNumber" placeholder="Employee Number"></form:input>
												<span class="help-block">&nbsp;<form:errors
														path="employeeNumber" cssClass="alert-danger" /></span>
											</div>
										</div>

									</div>
									<!--/span-->
								</div>

								<h3 class="form-section"
									style="margin-left: 20px; margin-right: 20px; margin-bottom: 5px; border-bottom-color: #32c5d2">Attachments</h3>
								<div class="row">
									<div class="col-md-6"
										style="margin-left: 25px; margin-top: 30px;">
										<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
										<div class="row fileupload-buttonbar">
											<div class="col-lg-7">
												<span class="btn green btn-sm fileinput-button"><span>
														Browse</span> <input type="file" name="file" multiple="multiple">
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


								<h3 class="form-section"
									style="margin-left: 20px; margin-right: 20px; border-bottom-color: #32c5d2">Existing
									Files</h3>
								<!--/row-->
								<div class="row">
									<div class="col-md-12">
										<div class="form-body">
											<div class="form-group">
												<div class="col-md-12">
													<table
														class="table table-bordered table-hover  table-sortable"
														id="img_logic">
														<thead style="background-color: #26A1AB; color: #fff">
															<tr>
																<th>File Name</th>
																<th class="hidden-xs">Uploaded Date</th>
																<th class="hidden-xs">Download</th>
																<th class="hidden-xs">Delete</th>
															</tr>
														</thead>
														<tbody>
															<c:choose>
																<c:when test="${empty images}">
																	<tr>
																		<td colspan="6" align="center"><b>No results
																				found</b></td>
																	</tr>
																</c:when>
																<c:otherwise>
																	<c:forEach items="${images}" var="images">
																		<tr>
																			<td><c:out value="${images.imageName}" /></td>
																			<td><c:out value="${images.uploadedDate}" /></td>
																			<td><a style="color: #204d74"
																				href="<c:url value='/downloadImage/${images.id}' />">
																					<c:out value="Download" />
																			</a></td>
																			<td><a style="color: #FF0000"
																				href="<c:url value='/deleteCitAttachment/${images.id}/${citationId}' />">
																					<c:out value="Delete" />
																			</a></td>
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


								<div class="form-actions">
									<div class="row">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-offset-12 col-md-12">
													<input type="submit" id="blockui_updatebtn"
														class="btn green btn-sm"
														style="position: static; top: -2px; -left: -51px; right: 30px; bottom: 40px; float: none;"
														value="Update"
														formaction="${pageContext.request.contextPath}/citationdetails/${citationId}" />
													<button type="button"
														onclick="window.location='${pageContext.request.contextPath}/citationdetails/${citationId}';"
														class="btn green btn-sm"
														style="position: static; float: none; top: -2px; left: -500px; right: 30px; bottom: 40px">Cancel</button>
												</div>
											</div>
										</div>
										<div class="col-md-6"></div>
									</div>
								</div>
							</form:form>


							<!-- END FORM-->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT BODY -->
<!-- END CONTENT -->

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
						toggleAdminCode("T");
						$('input[type="file"]')
								.change(
										function(e) {
											document
													.getElementById('fileTypeError').innerHTML = '';
											document
													.getElementById('blockui_updatebtn').disabled = false;
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
															.getElementById('blockui_updatebtn').disabled = true;
													document
															.getElementById('fileTypeError').innerHTML = 'Invalid File Uploaded. Allowed PDF,JPG,TIFF type of files';
												}
											}
										});

						function toggleAdminCode(violationCodetype) {
							$('#adminCode > option').each(function() {
								var obj = $(this).data("type");
								if (obj == violationCodetype) {
									$(this).show();
									$(this).prop('disabled', false);
								} else {
									$(this).hide();
									$(this).prop('disabled', true);
								}

							});
							var $owner_id = $("#adminCode");
							$owner_id.select2();
						}
						$("#adminCode")
								.change(
										function() {
											var age = $('#age').val();
											var val = 0.00;
											if (age && age < 17)
											{	
												val = $(this).find(':selected').data("value").minfine;
											}
											else
											{
												val = $(this).find(':selected').data("value").fine;	
											}
											var tot = document
													.getElementById('totalDueCit').value;
											var old = document
													.getElementById('penaltyAmt').value;
											var due = Number(tot)
													- Number(old.substr(1));
											$('#penaltyAmt').val("$" + val);
											var gtot = Number(due)
													+ Number(val);
											$('#totalDueCit').val(
													gtot.toFixed(2));
										});
						$("#penaltyAmt")
								.on(
										"change paste",
										function() {
											var old = document
													.getElementById('penaltyAmthide').value;

											var tot = document
													.getElementById('totalDueCithide').value;

											var newpmt = document
													.getElementById('penaltyAmt').value;
											if (newpmt.indexOf("$") <= -1) {
												newpmt = "$"
														+ document
																.getElementById('penaltyAmt').value;
												$("#penaltyAmt").val(newpmt);
											}
											if (newpmt.indexOf(".") <= -1) {
												newpmt = document
														.getElementById('penaltyAmt').value
														+ ".00";
												$("#penaltyAmt").val(newpmt);
											}
											var due = Number(tot)
													- Number(old.substr(1));
											var gtot = Number(due)
													+ Number(newpmt.split('$')[1]);

											$('#totalDueCit').val(
													gtot.toFixed(2));
										});
						$("#citationDateTransit").datepicker({
							format : 'mm/dd/yyyy'
						});
						$("#timepickerTransit").timepicker();
						$("#inspId").change(
								function() {
									if ($(this).find(':selected').val() != "") {
										var val = $(this).find(':selected')
												.data("value").inspId;
										$('#employeeNumber').val(val);
									}
								});
						$('#employeeNumber').focusout(function() {
							var empno = $(this).val();
							var empnoNotFond = true;
							$('#inspId > option').each(function() {
								var inspId = $(this).data("id");
								if (inspId == empno) {
									$("#inspId").val($(this).val()).change();
									empnoNotFond = false;
								}
							});
							if (empnoNotFond) {
								$("#inspId").val("").change();
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
						var val = $('#rdNumberTransit').val();
						$('#transitline').val(val);
						var vechilce = $("#rdNumberTransit").find(':selected')
								.data('value');
						$('#vehicleTransit').val(vechilce);
						$("#rdNumberTransit")
								.change(
										function() {
											var vechilce = $("#rdNumberTransit")
													.find(':selected').data(
															'value');
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
					});
</script>





<script src="<c:url value='/static/assets/global/fieldValidation.js' />"
	type="text/javascript"></script>
<script type="text/javascript">
	function validateCitDetails() {
		App.blockUI({
			target : '#blockui_citationdetails_data'
		});
		document.getElementById('heightError').innerHTML = '';
		document.getElementById('weightError').innerHTML = '';
		document.getElementById('fnameError').innerHTML = '';
		document.getElementById('mnameError').innerHTML = '';
		document.getElementById('lnameError').innerHTML = '';
		document.getElementById('addressError').innerHTML = '';
		document.getElementById('cityError').innerHTML = '';
		document.getElementById('citationidError').innerHTML = '';
		document.getElementById('totalDueCitError').innerHTML = '';

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

		if (!checkFloatingPointNum('totalDueCit')) {
			document.getElementById('totalDueCitError').innerHTML = 'Invalid Amount';
			return false;
		}
		if ($("#citationType").val() == "Transit") {
			if (checkInputCharRange('fnamePatron', 50)) {
				document.getElementById('fnameError').innerHTML = 'Invalid First Name';
				return false;
			}

			if (checkCharRangeWhenNotNull('mnamePatron', 46)) {
				document.getElementById('mnameError').innerHTML = 'Invalid Middle Name';
				return false;
			}

			if (checkInputCharRange('lnamePatron', 46)) {
				document.getElementById('lnameError').innerHTML = 'Invalid Last Name';
				return false;
			}

			if (!checkFloatingPointNum('weightPatron')) {
				document.getElementById('weightError').innerHTML = 'Invalid Weight';
				return false;
			}

			if (checkInputCharRange('addressPatron', 95)) {
				document.getElementById('addressError').innerHTML = 'Invalid Address(< 95 chars)';
				return false;
			}

			if (checkInputCharRange('cityPatron', 30)) {
				document.getElementById('cityError').innerHTML = 'Invalid City';
				return false;
			}
		}
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
	left: 650px;
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