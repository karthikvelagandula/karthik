<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<div class="page-content">
		<br /> <br />
		<div class="page-bar" style="margin: -25px 0px 0;">
			<ul class="page-breadcrumb">
				<li><a style="margin-left: 50px;"
					href="${pageContext.request.contextPath}/citationview/${citationId}"><spring:message
							code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message code="lbl.sidemenu.tab.review" /></span></li>
			</ul>
			<div style="margin-top: 10px">
				<a onclick="enablePageLoadBar()"
					style="text-decoration: none; color: #fff;"
					href="${pageContext.request.contextPath}/citationview/${citationId}"><span
					class="btn green btn-sm"
					style="width: 65px; float: right; margin-right: 10px;">Back</span></a>
			</div>
			<div style="text-align: center;">
				<span style="font-size: 16px;"><span style="font-size: 17px"><b>Name:</b></span>&nbsp;${lastName}
					&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px"><b>Violation
							Number:</b></span>&nbsp;${citationId} </span>
			</div>
		</div>

		<div class="row"
			style="padding-bottom: 20px; padding-right: 10px; padding-left: 5px;">
			<div class="col-md-12 col-sm-12">
				<div class="col-md-3 col-sm-3"
					style="padding-left: 0px; padding-right: 0px;">
					<!-- BEGIN Portlet PORTLET-->
					<div class="portlet box green bg-inverse"
						style="margin: 10px 0 0 10px;">
						<div class="portlet-title">
							<div class="caption">Review Process</div>
						</div>
						<div class="portlet-body">

							<div class="portlet-body form">
								<form:form class="form-horizontal"
									action="/ecitation/initialReview/${citationId}"
									id="submit_form" method="POST" modelAttribute="reviewProcess">
									<div class="form-wizard">
										<div class="form-body">
											<div class="tab-content">
												<div class="tab-pane active" id="tab1">
													<div class="form-group">
														<label class="col=-md-12 control-label label-sm"
															style="text-align: left;">Review requested: <span
															class="required"> * </span>
														</label>
														<div class="col-md-12">
															<div class="mt-radio-inline">
																<label class="mt-radio label-sm"> <form:radiobutton
																		onclick="next_Question2()" path="question1"
																		id="optionsRadios34" value="Person"
																		data-title="In-person" />In-Person <span></span>
																</label> <label class="mt-radio label-sm"> <form:radiobutton
																		onclick="next_Question2()" path="question1"
																		id="optionsRadios35" value="Mail" data-title="By mail" />By
																	Mail <span></span>
																</label> <label class="mt-radio label-sm"> <form:radiobutton
																		onclick="next_Question2()" path="question1"
																		id="optionsRadios33" value="Phone"
																		data-title="By mail" />By Phone <span></span>
																</label>
															</div>
														</div>
														<div style="margin-top: 10px;">
															<a id="button1" href="#tab2" data-toggle="tab"
																style="display: none"><span class="btn green btn-sm"
																style="width: 65px;" onclick="validatePeriod()">NEXT</span></a>
														</div>
													</div>
												</div>
												<div class="tab-pane" id="tab2">
													<div class="form-group">
														<label class=" col-md-12 control-label label-sm"
															style="text-align: left;">Is the citation
															properly filled out/valid?</label>
														<div class="col-md-12">
															<div class="mt-radio-inline">
																<label class="mt-radio label-sm"> <form:radiobutton
																		onclick="submit_Form2()" path="question2"
																		id="optionsRadios36" value="Yes" data-title="Yes" />Yes
																	<span></span>
																</label> <label class="mt-radio label-sm"> <form:radiobutton
																		onclick="submit_Form2()" path="question2"
																		id="optionsRadios37" value="No" data-title="No" />No
																	<span></span>
																</label>
															</div>
														</div>
														<c:choose>
															<c:when test="${period==true}">
																<div style="margin-top: 20px;">
																	<a href="#tab1" data-toggle="tab"><span
																		class="btn green btn-sm"
																		style="width: 65px; float: left;">BACK</span></a>
																</div>
															</c:when>
															<c:otherwise>
																<div style="margin-top: 20px;">
																	<a href="#tab6" data-toggle="tab"><span
																		class="btn green btn-sm"
																		style="width: 65px; float: left;">BACK</span></a>
																</div>
															</c:otherwise>
														</c:choose>
														<div id="button22" style="display: none">
															<div class="form-actions">
																<div style="margin-top: 20px; margin-left: 60px;">
																	<input type="submit" class="btn green btn-sm"
																		value="SUBMIT" style="width: 65px;" />
																</div>
															</div>
														</div>
													</div>

												</div>
												<div class="tab-pane" id="tab6">
													<div class="form-group">
														<label class="col-md-12 control-label label-sm"
															style="text-align: left;">Time period for initial
															review has elapsed.</label>
														<div class="col-md-12">
															<div class="form-group" style="padding-left: 15px;">
																<label class="icheckbox_square-green checked"> <form:checkbox
																		onclick="validatecheck()" id="inlineCheckbox1"
																		path="ignoreTime" value="Yes"></form:checkbox><span></span>
																	Ignore Time
																</label>
															</div>
														</div>
														<div>
															<span>&nbsp; <form:errors cssClass="alert-danger" />
																<span class="alert-danger" id="form_question6_error"></span>
															</span>
														</div>
														<div style="margin-top: 10px;">
															<a href="#tab1" data-toggle="tab"><span
																class="btn green btn-sm"
																style="width: 65px; float: left;">BACK</span></a>
														</div>
														<div id="button6" style="display: none">
															<div style="margin-top: 10px; margin-left: 80px;">
																<a id="next6" href="#tab2" data-toggle="tab"><span
																	class="btn green btn-sm" style="width: 65px;">NEXT</span></a>
															</div>
														</div>
														<div id="button7" style="display: block">
															<div class="form-actions">
																<div style="margin-top: -20px; margin-left: 60px;">
																	<input type="submit" class="btn green btn-sm"
																		value="SUBMIT" style="width: 65px;" />
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
					<div class="portlet box green bg-inverse"
						style="margin: 10px 0 0 10px;">
						<div class="portlet-title">
							<div class="caption">Review Results</div>
						</div>
						<div class="portlet-body" style="padding-left: 6px;">
							<div class="row">
								<div class="col-md-12">
									<form:form class="form-horizontal"
										action="/ecitation/reviewResults/${citationId}" method="POST"
										modelAttribute="reviewProcess">
										<div class="form-actions">
											<div class="tab-content">
												<div class="tab-pane active" id="tab11">
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<label class="control-label label-sm col-md-5">Suspends:</label>
																<div class="col-md-7">
																	<form:select path="suspends"
																		class="bs-select form-control" id="suscode">
																		<form:option value="0" label="Select an Option"></form:option>
																		<c:forEach items="${suspendCodesDetails}"
																			var="suspendedcode">
																			<form:option value="${suspendedcode.id}"
																				label="${suspendedcode.code}-${suspendedcode.description}-${suspendedcode.days}"></form:option>
																		</c:forEach>
																	</form:select>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">
																<label class="control-label label-sm col-md-5"
																	style="align: left;">Correspondence:</label>
																<div class="col-md-7">
																	<form:select path="correspondence"
																		class="bs-select form-control" id="correscode">
																		<form:option value="" label="Select an Option"></form:option>
																		<c:forEach items="${correspCodeDetails}"
																			var="correspcode">
																			<form:option value="${correspcode.id}"
																				label="${correspcode.typCd}-${correspcode.correspDesc}"></form:option>
																		</c:forEach>
																	</form:select>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-12">
															<div class="form-group" style="padding-left: 15px;">
																<label class="icheckbox_square-green checked"> <form:checkbox
																		onclick="validatecheck()" id="letterSent"
																		path="letterSent" value="Yes"></form:checkbox><span></span>
																	Letter Sent
																</label>
															</div>
														</div>
													<%-- <div style="padding-left:6px;">
															<form:input path="letterSent" id="letterSent" type="checkbox" name="letterSent"
																value="yes">Letter Sent
														</form:input>
														</div> --%>
													<div class="row">
														<div class="col-md-12">
															<div class="form-group">

																<label class="control-label label-sm col-md-5">Comments:</label>
																<div class="col-md-7">
																	<form:select path="commentsInfoID"
																		class="bs-select form-control" id="notes"
																		onchange="append_Comment()">
																		<form:option value="" label="Select an Option"></form:option>
																		<c:forEach items="${commentDetails}" var="note">
																			<form:option value="${note.comment}"
																				label="${note.comment}"></form:option>
																		</c:forEach>
																	</form:select>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="form-group">
															<div class="col-md-11">
																<form:textarea name="markdown" path="noteedited"
																	id="noteedit" rows="5" cols="10"
																	style="width:100%;margin-left:20px;text-transform: uppercase;"></form:textarea>
															</div>
														</div>
													</div>
													<div class="row">
														<div style="margin-top: 20px; margin-left: 140px;">

															<input type="submit" class="btn green btn-sm"
																value="COMPLETE" style="width: 80px;" />
														</div>
													</div>
												</div>
											</div>
											<span class="help-block">&nbsp;</span>

										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-6"
					style="padding-left: 0px; padding-right: 0px;">
					<!-- BEGIN Portlet PORTLET-->
					<div class="portlet box green bg-inverse"
						style="margin: 10px 0 0 10px;">
						<div class="portlet-title">
							<div class="caption">Ticket Summary</div>
						</div>
						<div class="portlet-body">
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<div class="portlet box green bg-inverse">
										<div class="portlet-title"
											style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
											<div class="caption"
												style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
												<b>VIOLATION</b>
											</div>
										</div>
										<div class="portlet-body " style="padding: 6px;">

											<table style="font-size: 13px;">
												<tr>
													<th><b>Violation Number:</b></th>
													<td><font style="font-weight: 400;"><b><c:out
																	value="${citationId}" /></b></font></td>
												</tr>
												<tr>
													<th><b>Status:</b></th>
													<td><font
														style="font-weight: 400; color: #FEFDFD; background-color: #F50C2D;"><c:choose>
																<c:when test="${citationForm.status == 'VIOD'}">
																	<b><c:out value="CLOSED - VOID" /></b>
																</c:when>
																<c:otherwise>
																	<b><c:out value="${citationForm.status}" /></b>
																</c:otherwise>
															</c:choose></font></td>
												</tr>
												<tr>
													<th><b>Violation:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="${citationForm.violationCode.description}" /></font></td>
												</tr>
												<tr>
													<th><b>Violation Code:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="${citationForm.violationCode.code}" /></font></td>
												</tr>
												<tr>
													<th><b>Issued:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="${citationForm.dateOfViolation}" />&nbsp;<c:out
																value="${dayOfWeek}" /></font></td>
												</tr>
												<tr>
													<th><b>Issued Time:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="${citationForm.timeofViolation}" /></font></td>
												</tr>
												<tr>
													<th><b>Processed:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="${citationForm.processDate}" />&nbsp;<c:out
																value="${processDay}" /></font></td>
												</tr>
												<tr>
													<th><b>Vehicle:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="${vehicle}" /></font></td>
												</tr>
												<tr>
													<th><b>Location:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="${citationForm.location}" /></font></td>
												</tr>
												<tr>
													<th style="width: 50%"><b>Related
															Violations:&nbsp;&nbsp;</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="" /></font></td>
												</tr>
												<tr>
													<th><b></b></th>
													<td><font style="font-weight: 400;"><c:out
																value="" /></font></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6">
									<div class="portlet box green bg-inverse"
										style="margin-bottom: 20px;">
										<div class="portlet-title"
											style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
											<div class="caption"
												style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
												<b>VIOLATOR NAME AND ADDRESS</b>
											</div>
										</div>
										<div class="portlet-body " style="padding: 6px;">
											<table style="font-size: 13px;">
												<tr>
													<td><font style="font-weight: 400;"><c:out
																value="${name}" /></font></td>
												</tr>
												<tr>
													<td><font style="font-weight: 400;"> <c:out
																value="${citationForm.patron.address.formattedAddress}" /></font></td>
												</tr>
												<tr>
													<td><c:if
															test="${not empty citationForm.addressSource}">
															<font
																style="font-weight: 400; float: Left; Padding-right: 5px;">
																<c:choose>
																	<c:when test="${citationForm.addressSource =='P'}">
																		<b>In-Person</b>
																	</c:when>
																	<c:otherwise>
																		<b>Mail</b>
																	</c:otherwise>
																</c:choose>
															</font>
														</c:if> <c:if test="${citationForm.nixie}">
												<font style="font-weight: 400; color: #FEFDFD; background-color: #F50C2D; float: right;"><b>NIXIE</b></font>
												</c:if></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="portlet box green bg-inverse"
										style="padding-top: 5px;">
										<div class="portlet-title"
											style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
											<div class="caption"
												style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
												<b>VIOLATION NOTES</b>
											</div>
										</div>
										<div class="portlet-body" style="padding: 6px;">
									<table style="font-size: 13px;" >
										<tr>
											<td style="text-transform: uppercase;"><font style="font-weight: 400;"><c:out
														value="${citationForm.comments[0].formattedCreatedAtNoss}" /></font></td>
										</tr>
										</table>
										</div>
										<div class="portlet-body scroller" style="padding: 6px;overflow: scroll;height:100px;">
									<table style="font-size: 13px;" >
										<tr>
											<td style="text-transform: uppercase;">												
													<font style="font-weight: 400;"><c:out
														value="${citationForm.comments[0].comment}" /></font>		
											</td>
										</tr>										
									</table>
								</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<div class="portlet box green bg-inverse">
										<div class="portlet-title"
											style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
											<div class="caption"
												style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
												<b>ISSUANCE INFORMATION</b>
											</div>
										</div>
										<div class="portlet-body " style="padding: 6px;">
											<table style="font-size: 13px;">
												<tr>
													<th><b>Badge:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="${citationForm.employeeNumber}" /></font></td>
												</tr>
												<tr>
													<th><b>Agency:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="" /></font></td>
												</tr>
												<tr>
													<th><b>Division:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="" /></font></td>
												</tr>
												<tr>
													<th><b>RD:</b></th>
													<td><font style="font-weight: 400;"><c:out
																value="${citationForm.rdNumber}" /></font></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6">
									<div class="portlet box green bg-inverse">
										<div class="portlet-title"
											style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
											<div class="caption"
												style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
												<b>FINANCIAL</b>
											</div>
										</div>
										<div class="portlet-body " style="padding: 6px;">
											<!--Fine, Penalty 1, Penalty 2, Penalty 3, Penalty 4,Penalty 5, Reduction, Total Due, Unapplied Amt -->
											<table style="font-size: 13px;">
												<tr>
													<th><b>Fine:</b></th>
													<td></td>
													<td><font style="font-weight: 400;"><c:if
																test="${citationForm.penaltyAmt!='' && citationForm.penaltyAmt!=NULL}">
																<c:out value="${citationForm.penaltyAmt}" />
															</c:if> </font></td>
												</tr>
												<tr>
													<th><b>Total Penalties:</b></th>
													<td><font style="font-weight: 400;"> <c:choose>
																<c:when test="${citation.totalPenaltyAmount == '0' }">
																	<td>$<c:out value="0.00" /></td>
																</c:when>
																<c:otherwise>
																	<td>$<c:out value="${citation.totalPenaltyAmount}" /></td>
																</c:otherwise>
															</c:choose>
													</font></td>
												</tr>
												<tr>
													<th><b>Total Amount Paid:</b></th>
													<td><font style="font-weight: 400;"> <c:choose>
																<c:when test="${totalPaid == '0' }">
																	<td>$<c:out value="0.00" /></td>
																</c:when>
																<c:otherwise>
																	<td>$<c:out value="${totalPaid}" /></td>
																</c:otherwise>
															</c:choose>
													</font></td>
												</tr>
												<tr>
													<th><b>Total Due:</b></th>
													<td></td>
													<td><font
														style="font-weight: 400; color: #FEFDFD; background-color: #F50C2D;"><c:if
																test="${citationForm.totalDue!='' && citationForm.totalDue!=NULL}">$<c:out
																	value="${citationForm.totalDue}" />
															</c:if> </font></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="portlet box green bg-inverse "
						style="margin: 10px 0 0 10px;">
						<div class="portlet-title">
							<div class="caption">Ticket History</div>
						</div>
						<div class="portlet-body">
							<div class="table-responsive scroller">
								<table id="allDetailsTbl"
									class="table table-hover table-bordered ">
									<thead>
										<tr style="background-color: #f5f3eb;">
											<th style="color: #32c5d2" width="9%"><b>Type</b></th>
											<th style="color: #32c5d2" width="64%"><b>Data</b></th>
											<th style="color: #32c5d2" width="10%"><b>Updated&nbsp;By</b></th>
											<th style="color: #32c5d2" width="17%"><b>Updated&nbsp;Date</b></th>
										</tr>
									</thead>
									<tbody>
										<c:if
											test="${not empty externalCommentsHistory || not empty internalCommentsHistory}">
											<c:if test="${not empty externalCommentsHistory }">
												<c:forEach items="${externalCommentsHistory}"
													var="externalComment">
													<tr>
														<td><c:out value="Notes" /></td>
														<td style="text-transform: uppercase;"><c:out value="${externalComment.comment}" />,&nbsp;<c:out
																value="External" /></td>
														<td style="text-transform: uppercase;"><c:out value="${externalComment.createdBy}" /></td>
														<td style="text-transform: uppercase;"><c:out
																value="${externalComment.formattedCreatedAt}" /></td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${not empty internalCommentsHistory }">
												<c:forEach items="${internalCommentsHistory}"
													var="internalComment">
													<tr data-type="internalComment">
														<td><c:out value="Notes" /></td>
														<td style="text-transform: uppercase;"><c:out value="${internalComment.comment}" />,&nbsp;<c:out
																value="Internal" /></td>
														<td style="text-transform: uppercase;"><c:out value="${internalComment.createdBy}" /></td>
														<td style="text-transform: uppercase;"><c:out
																value="${internalComment.formattedCreatedAt}" /></td>
													</tr>
												</c:forEach>
											</c:if>
										</c:if>
										<c:if test="${not empty addressHistory }">
											<c:forEach items="${addressHistory}" var="address">
												<tr>
													<td><c:out value="Address" /></td>
													<c:choose>
														<c:when test="${address.updatedAt == null}">
															<td style="text-transform: uppercase;"><c:out value="${address.formattedAddress}" /></td>
															<td style="text-transform: uppercase;"><c:out value="${address.createdBy}" /></td>
															<td style="text-transform: uppercase;"><c:out value="${address.formattedCreatedAt}" /></td>
														</c:when>
														<c:otherwise>
															<td style="text-transform: uppercase;"><c:out value="${address.formattedAddress}" /></td>
															<td style="text-transform: uppercase;"><c:out value="${address.updatedBy}" /></td>
															<td style="text-transform: uppercase;"><c:out value="${address.formattedUpdatedAt}" /></td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${not empty penaltyHistory }">
											<c:forEach items="${penaltyHistory}" var="penalty">
												<tr>
													<td><c:out value="Penalty" /></td>
													<c:choose>
														<c:when test="${penalty.updatedAt == null}">
															<td style="text-transform: uppercase;"><c:out value="${penalty.fineAmount}" />, $<c:out
																	value="${penalty.penaltyCode.penalty1}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty1}" />$<c:out
																	value="${penalty.penaltyCode.penalty2}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty2}" />, $<c:out
																	value="${penalty.penaltyCode.penalty3}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty3}" />, $<c:out
																	value="${penalty.penaltyCode.penalty4}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty4}" />, $<c:out
																	value="${penalty.penaltyCode.penalty5}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty5}" />, $<c:out
																	value="${penalty.totalPaidAmount}" />, $<c:out
																	value="${penalty.reducedAmount}" />, $<c:out
																	value="${penalty.totalDueAmount}" /></td>
															<td style="text-transform: uppercase;"><c:out value="${penalty.createdBy}" /></td>
															<td><c:out value="${penalty.formattedCreatedAt}" /></td>
														</c:when>
														<c:otherwise>
															<td style="text-transform: uppercase;"><c:out value="${penalty.fineAmount}" />, $<c:out
																	value="${penalty.penaltyCode.penalty1}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty1}" />, $<c:out
																	value="${penalty.penaltyCode.penalty2}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty2}" />, $<c:out
																	value="${penalty.penaltyCode.penalty3}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty3}" />, $<c:out
																	value="${penalty.penaltyCode.penalty4}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty4}" />, $<c:out
																	value="${penalty.penaltyCode.penalty5}" />/<c:out
																	value="${penalty.penaltyCode.formattedpenalty5}" />, $<c:out
																	value="${penalty.totalPaidAmount}" />, $<c:out
																	value="${penalty.reducedAmount}" />, $<c:out
																	value="${penalty.totalDueAmount}" /></td>
															<td style="text-transform: uppercase;"><c:out value="${penalty.updatedBy}" /></td>
															<td><c:out value="${penalty.formattedUpdatedAt}" /></td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${not empty paymentHistory }">
											<c:forEach items="${paymentHistory}" var="paymentList">
												<c:forEach items="${paymentList}" var="payment">
													<tr>
														<td><c:out value="Payments" /></td>
														<c:choose>
															<c:when test="${payment.updatedAt == null}">
																<td style="text-transform: uppercase;">$<c:out value="${payment.amount}" />/<c:out
																		value="${payment.paymentDate}" />, <c:out
																		value="PAYMENT" />/<c:out
																		value="${payment.paymentMethod.description}" />, <c:out
																		value="${payment.account}" />, <c:out
																		value="${payment.processedOn}" />/<c:out
																		value="${payment.processedBy}" />, <c:if
																		test="${payment.ipp!=false}">
																		<c:out value="Yes" />,
																		</c:if> <c:if test="${payment.ipp!=true}">
																		<c:out value="No" />,
																		</c:if> $<c:out value="${payment.overPaid}" />, $<c:out
																		value="${payment.totalDue}" /></td>
																<td style="text-transform: uppercase;"><c:out value="${payment.createdBy}" /></td>
																<td><c:out value="${payment.formattedCreatedAt}" /></td>
															</c:when>
															<c:otherwise>
																<td style="text-transform: uppercase;">$<c:out value="${payment.amount}" />/<c:out
																		value="${payment.paymentDate}" />, <c:out
																		value="PAYMENT" />/<c:out
																		value="${payment.paymentMethod.description}" />, <c:out
																		value="${payment.account}" />, <c:out
																		value="${payment.processedOn}" />/<c:out
																		value="${payment.processedBy}" />, <c:if
																		test="${payment.ipp!=false}">
																		<c:out value="Yes" />,
																		</c:if> <c:if test="${payment.ipp!=true}">
																		<c:out value="No" />,
																		</c:if> $<c:out value="${payment.overPaid}" />, $<c:out
																		value="${payment.totalDue}" /></td>
																<td style="text-transform: uppercase;"><c:out value="${payment.updatedBy}" /></td>
																<td><c:out value="${payment.formattedUpdatedAt}" /></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</c:forEach>
										</c:if>
										<c:if test="${not empty hearingHistory }">
											<c:forEach items="${hearingHistory}" var="hearingList">
												<c:forEach items="${hearingList}" var="hearing">
													<tr>
														<td><c:out value="Hearings" /></td>
														<c:choose>
															<c:when test="${hearing.updatedAt == null}">
																<td style="text-transform: uppercase;"><c:out
																		value="${hearing.hearingOfficer}" />, <c:out
																		value="${hearing.formattedHearingDate}" />/<c:out
																		value="${hearing.hearingTime}" />,&nbsp;<c:out
																		value="${hearing.formattedDispDate}" />/<c:out
																		value="${hearing.dispositionTime}" />,&nbsp;<c:out
																		value="${hearing.disposition}" />/<c:out
																		value="${hearing.userId}" />, <c:out
																		value="${hearing.suspend}" />/<c:out
																		value="${hearing.formattedSuspendDate}" />, <c:out
																		value="${hearing.caseNumber}" />/<c:out
																		value="${hearing.plea}" />, $<c:out
																		value="${hearing.reduction}" />/$<c:out
																		value="${hearing.totalDue}" /></td>
																<td style="text-transform: uppercase;"><c:out value="${hearing.createdBy}" /></td>
																<td><c:out value="${hearing.formattedCreatedAt}" /></td>
															</c:when>
															<c:otherwise>
																<td style="text-transform: uppercase;"><c:out
																		value="${hearing.hearingOfficer}" />, <c:out
																		value="${hearing.formattedHearingDate}" />/<c:out
																		value="${hearing.hearingTime}" />,&nbsp;<c:out
																		value="${hearing.formattedDispDate}" />/<c:out
																		value="${hearing.dispositionTime}" />,&nbsp;<c:out
																		value="${hearing.disposition}" />/<c:out
																		value="${hearing.userId}" />, <c:out
																		value="${hearing.suspend}" />/<c:out
																		value="${hearing.formattedSuspendDate}" />, <c:out
																		value="${hearing.caseNumber}" />/<c:out
																		value="${hearing.plea}" />, $<c:out
																		value="${hearing.reduction}" />/$<c:out
																		value="${hearing.totalDue}" /></td>
																<td style="text-transform: uppercase;"><c:out value="${hearing.updatedBy}" /></td>
																<td><c:out value="${hearing.formattedUpdatedAt}" /></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</c:forEach>
										</c:if>
										<c:if test="${not empty suspendHistory }">
											<c:forEach items="${suspendHistory}" var="suspendList">
												<c:forEach items="${suspendList}" var="suspend">
													<tr>
														<td><c:out value="Suspends" /></td>
														<c:choose>
															<c:when test="${suspend.updatedAt == null}">
																<td style="text-transform: uppercase;"><c:out
																		value="${suspend.suspendedCodes.description}" />, <c:out
																		value="${suspend.formattedSuspendDate}" />, <c:out
																		value="${suspend.formattedProcessedOn}" />/<c:out
																		value="Helen" />, <c:out
																		value="${suspend.caseSuspend}" />, <c:out
																		value="${suspend.dateOverride}" />, $<c:out
																		value="${suspend.reduction}" />, $<c:out
																		value="${suspend.totalDue}" /></td>
																<td style="text-transform: uppercase;"><c:out value="${suspend.createdBy}" /></td>
																<td><c:out value="${suspend.formattedCreatedAt}" /></td>
															</c:when>
															<c:otherwise>
																<td style="text-transform: uppercase;"><c:out
																		value="${suspend.suspendedCodes.description}" />, <c:out
																		value="${suspend.formattedSuspendDate}" />, <c:out
																		value="${suspend.formattedProcessedOn}" />/<c:out
																		value="Helen" />, <c:out
																		value="${suspend.caseSuspend}" />, <c:out
																		value="${suspend.dateOverride}" />, $<c:out
																		value="${suspend.reduction}" />, $<c:out
																		value="${suspend.totalDue}" /></td>
																<td style="text-transform: uppercase;"><c:out value="${suspend.updatedBy}" /></td>
																<td><c:out value="${suspend.formattedUpdatedAt}" /></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</c:forEach>
										</c:if>
										<c:if test="${not empty corresHistory }">
											<c:forEach items="${corresHistory}" var="corresList">
												<c:forEach items="${corresList}" var="correspond">
													<tr>
														<td><c:out value="Correspondence" /></td>
														<c:choose>
															<c:when test="${correspond.updatedAt == null}">
																<td style="text-transform: uppercase;"><c:out
																		value="${correspond.correspCode.correspDesc}" />, <c:out
																		value="${correspond.formattedCorresDate}" />, <c:out
																		value="${correspond.corresp_time}" />, <c:out
																		value="${correspond.createdBy}" />, <c:out
																		value="${correspond.corresp_sent}" />, <c:out
																		value="${correspond.documentNumber}" />, <c:out
																		value="${correspond.correspondenceType}" />,
																		<c:if test="${correspond.letterSent==true}">
																		<c:out value="Yes" />
																		</c:if>
																		<c:if test="${correspond.letterSent==false}">
																		<c:out value="No" />
																		</c:if></td>
																<td style="text-transform: uppercase;"><c:out value="${correspond.createdBy}" /></td>
																<td><c:out value="${correspond.formattedCreatedAt}" /></td>

															</c:when>
															<c:otherwise>
																<td style="text-transform: uppercase;"><c:out
																		value="${correspond.correspCode.correspDesc}" />, <c:out
																		value="${correspond.formattedCorresDate}" />, <c:out
																		value="${correspond.corresp_time}" />, <c:out
																		value="${correspond.updatedBy}" />, <c:out
																		value="${correspond.corresp_sent}" />, <c:out
																		value="${correspond.documentNumber}" />, <c:out
																		value="${correspond.correspondenceType}" />,
																		<c:if test="${correspond.letterSent==true}">
																		<c:out value="Yes" />
																		</c:if>
																		<c:if test="${correspond.letterSent==false}">
																		<c:out value="No" />
																		</c:if></td>
																<td style="text-transform: uppercase;"><c:out value="${payment.updatedBy}" /></td>
																<td><c:out value="${payment.formattedUpdatedAt}" /></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</c:forEach>
										</c:if>
										<c:if test="${not empty noticeHistory }">
											<c:forEach items="${noticeHistory}" var="noticesList">
												<c:forEach items="${noticesList}" var="notice">
													<tr>
														<td><c:out value="Notices" /></td>
														<c:choose>
															<c:when test="${notice.updatedAt == null}">
																<td style="text-transform: uppercase;"><c:out
																		value="${notice.noticeType.fullNm}" /> <c:out
																		value="${notice.formattedSentDate}" />&nbsp;<c:out
																		value="${notice.formattedProcessedDate}" /></td>
																<td style="text-transform: uppercase;"><c:out value="${notice.createdBy}" /></td>
																<td><c:out value="${notice.formattedCreatedAt}" /></td>
															</c:when>
															<c:otherwise>
																<td style="text-transform: uppercase;"><c:out
																		value="${notice.noticeType.fullNm}" /> <c:out
																		value="${notice.formattedSentDate}" />&nbsp;<c:out
																		value="${notice.formattedProcessedDate}" /></td>
																<td style="text-transform: uppercase;"><c:out value="${notice.updatedBy}" /></td>
																<td><c:out value="${notice.formattedUpdatedAt}" /></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</c:forEach>
										</c:if>
										<c:if test="${not empty miscHistory}">
																	<c:forEach items="${miscHistory}" var="historyBean">
																		<tr>
																			<td><c:out value="MISCELLANEOUS" /></td>
																			<td style="text-transform: uppercase;"><c:out
																					value="${historyBean.data}" /></td>
																			<td style="text-transform: uppercase;"><c:out
																					value="${historyBean.updatedBy}" /></td>
																			<td style="text-transform: uppercase;"><c:out
																					value="${historyBean.updatedDate}" /></td>
																		</tr>
																	</c:forEach>
										</c:if> 
										<c:if test="${not empty refundsHistory}">
																	<c:forEach items="${refundsHistory}" var="refund">
																		<tr>
																			<td><c:out value="REFUNDS" /></td>
																			<c:choose>
																				<c:when test="${refund.updatedAt == null}">
																					<td style="text-transform: uppercase;">$<c:out
																							value="${refund.amount}" />, <c:out
																							value="${refund.formattedProcessDate}" />,&nbsp;<c:out
																							value="${refund.account}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${refund.createdBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${refund.formattedCreatedAt}" /></td>
																				</c:when>
																				<c:otherwise>
																					<td style="text-transform: uppercase;">$<c:out
																							value="${refund.amount}" />, <c:out
																							value="${refund.formattedProcessDate}" />,&nbsp;<c:out
																							value="${refund.account}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${refund.updatedBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${refund.formattedUpdatedAt}" /></td>
																				</c:otherwise>
																			</c:choose>
																		</tr>
																	</c:forEach>
																</c:if>
										<c:if test="${not empty plateEntityHistory }">
											<c:forEach items="${plateEntityHistory}" var="plateEntity">
												<tr>
													<td><c:out value="Plate Entity" /></td>
													<c:choose>
														<c:when test="${plateEntity.updatedAt == null}">
															<td style="text-transform: uppercase;"><c:out value="${plateEntity.licenceNumber}" />,<c:out
																	value="${plateEntity.vinNumber}" />,<c:out
																	value="${plateEntity.licenseState}" />,<c:out
																	value="${plateEntity.licenseMonth}" />/<c:out
																	value="${plateEntity.licenseYear}" />,<c:out
																	value="${plateEntity.bodyType}" />,<c:out
																	value="${plateEntity.vehicleMake}" />,<c:out
																	value="${plateEntity.vehicleModel}" />,<c:out
																	value="${plateEntity.vehicleColor}" /></td>
															<td style="text-transform: uppercase;"><c:out value="${plateEntity.createdBy}" /></td>
															<td><c:out value="${plateEntity.formattedCreatedAt}" /></td>
														</c:when>
														<c:otherwise>
															<td style="text-transform: uppercase;"><c:out value="${plateEntity.licenceNumber}" />,<c:out
																	value="${plateEntity.vinNumber}" />,<c:out
																	value="${plateEntity.licenseState}" />,<c:out
																	value="${plateEntity.licenseMonth}" />/<c:out
																	value="${plateEntity.licenseYear}" />,<c:out
																	value="${plateEntity.bodyType}" />,<c:out
																	value="${plateEntity.vehicleMake}" />,<c:out
																	value="${plateEntity.vehicleModel}" />,<c:out
																	value="${plateEntity.vehicleColor}" /></td>
															<td style="text-transform: uppercase;"><c:out value="${plateEntity.updatedBy}" /></td>
															<td><c:out value="${plateEntity.formattedUpdatedAt}" /></td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3"
					style="padding-left: 0px; padding-right: 0px;">
					<div class="portlet box green bg-inverse "
						style="margin: 10px 0 0 10px;">
						<div class="portlet-title">
							<div class="caption">Attachments</div>
						</div>
						<div class="portlet-body">
							<div class="row">
								<div class="col-md-12">
									<form:form id="fileupload"
										action="/ecitation/imageupload/${citationId}"
										modelAttribute="reviewProcess" method="POST" autocomplete="on"
										enctype="multipart/form-data">
										<div class="form-actions">
											<div class="row" style="margin-left: 0px;">
												<div class="form-group">
													<label class="control-label label-sm col-md-2">Type:</label>
													<div class="col-md-3">
														<form:select path="fileType" id="fileType">
															<form:option value="Attachments">Attachments</form:option>
															<form:option value="Checks">Checks</form:option>
															<form:option value="Correspondence Files">Correspondence Files</form:option>

														</form:select>
													</div>
												</div>
											</div>
											<span class="help-block">&nbsp;</span>
											<div class="row" style="margin-left: 17px;">
												<span class="btn green btn-sm fileinput-button"> <span>
														Browse </span> <input type="file" name="files"
													multiple="multiple">
												</span> <span> </span>
											</div>
										</div>
										<div class="row fileupload-buttonbar"></div>
										<div class="row" id="viewLoadFiles" style="display: none">
											<div class="col-md-12">
												<div class="form-body">
													<div class="form-group">
														<div class="col-md-12">
															<table
																class="table table-hover table-bordered  table-sortable "
																id="upload_files" style="width:">
																<thead style="background-color: #26A1AB; color: #fff">
																	<tr>
																		<th class="hidden-xs " style="width: 50%;">File
																			Name</th>
																		<th class="hidden-xs " style="width: 25%;">File
																			Type</th>
																		<th class="hidden-xs " style="width: 25%;">File
																			size</th>
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
															<span id="fileTypeError" style="color: #E82734">${printError}</span>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<input type="submit"
												style="margin-left: 150px; display: none;"
												class="btn green btn-sm fileinput-button"
												id="blockui_uploadbtn" value=" Upload ">
										</div>
									</form:form>
								</div>
							</div>

							<span class="help-block">&nbsp;</span>
							<div class="row">
								<table class="table table-bordered table-hover  table-sortable"
									id="img_logic"
									style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px;">
									<tbody>
										<c:forEach items="${images}" var="images">
											<tr>
												<td id="partFileInfoColumn"
													style="width: 450px; font-size: 13px;"><span
													id="fileNameInfo_${images.id}"> <a target="popup"
														onclick="window.open('<c:url value='/viewReviewAttachment/${images.id}/${citationId}' />','popup','width=500,height=500'); return false;"
														onclick="enablePageLoadBar()" style="color: #26A1AB;"
														href="<c:url value='/viewAttachmentAsImages/${images.id}/${citationId}' />"
														target="pop-up"><span style="width: 50px;"><c:out
																	value="${images.imageName}" /></span></a>
												</span></td>
											</tr>
										</c:forEach>
										<c:forEach items="${checks}" var="images">
											<tr>
												<td id="partFileInfoColumn"
													style="width: 450px; font-size: 13px;"><span
													id="fileNameInfo_${images.id}"> <a target="popup"
														onclick="window.open('<c:url value='/viewReviewAttachment/${images.id}/${citationId}' />','popup','width=500,height=500'); return false;"
														onclick="enablePageLoadBar()" style="color: #26A1AB;"
														href="<c:url value='/viewAttachmentAsImages/${images.id}/${citationId}' />"
														target="pop-up"><span style="width: 50px;"><c:out
																	value="${images.imageName}" /></span></a>
												</span></td>
											</tr>
										</c:forEach>
										<c:forEach items="${corresp}" var="images">
											<tr>
												<td id="partFileInfoColumn"
													style="width: 450px; font-size: 13px;"><span
													id="fileNameInfo_${images.id}"> <a target="popup"
														onclick="window.open('<c:url value='/viewReviewAttachment/${images.id}/${citationId}' />','popup','width=500,height=500'); return false;"
														onclick="enablePageLoadBar()" style="color: #26A1AB;"
														href="<c:url value='/viewAttachmentAsImages/${images.id}/${citationId}' />"
														target="pop-up"><span style="width: 50px;"><c:out
																	value="${images.imageName}" /></span></a>
												</span></td>
											</tr>
										</c:forEach>
										<c:forEach items="${paymentList}" var="payment">
											<tr>
												<td><a style="color: #26A1AB;" target="popup"
														onclick="window.open('<c:url value='/previewCheque/${payment.id}' />','popup','width=500,height=500'); return false;"
													href="<c:url value='/previewCheque/${payment.id}' />"
													target="_blank">${payment.chequeFileName}</a></td>
											</tr>
										</c:forEach>
										<c:forEach items="${corrList}" var="corr">
											<tr>
												<td><a style="color: #26A1AB;"  target="popup"
														onclick="window.open('${pageContext.request.contextPath}/previewCorrespFile/${corr.id}','popup','width=500,height=500'); return false;"
													href="${pageContext.request.contextPath}/previewCorrespFile/${corr.id}"
													target="_blank">${corr.documentName}</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<script>
	window.onload = function(e) {
		if(document.getElementById("correscode").value!=""){
			document.getElementById("letterSent").checked = true;
		}		
		if (document.getElementById("optionsRadios34").checked
				|| document.getElementById("optionsRadios35").checked) {
			next_Question2();
		}

		if (document.getElementById("optionsRadios36").checked) {
			submit_Form2();
		} else if (document.getElementById("optionsRadios37").checked) {
			submit_Form2();
		}
		$('#allDetailsTbl').DataTable({
			"paging" : false,
			"info" : false,
			"searching" : false,
			"orderClasses" : false,			
			"columnDefs" : [ {
				"targets" : [ 0, 1, 2 ],
				"orderable" : false,
			} ],
			"order" : [ [ 3, "desc" ] ]
		});
		validatecheck();
		set_Comment();
		$('input[type="file"]').change(function(e){
			$("#viewLoadFiles").show();
			document.getElementById('fileTypeError').innerHTML = '';
			document.getElementById('blockui_uploadbtn').style.display = 'block';
	        var files = e.target.files;
	        $("#selectedFilesRow").empty();
	        for (var i = 0; i < files.length; i++)
	        {
	        	var newRowContent = "<tr><td>"+files[i].name+"</td><td>"+files[i].name.substr(files[i].name.lastIndexOf('.')+1).toUpperCase()+"</td><td>"+Math.round(files[i].size/1024)+ " Kb"+"</td></tr>";
	        	$(newRowContent).appendTo($("#upload_files"));
	        	var fileTypeUploaded = files[i].name.substr(files[i].name.lastIndexOf('.')+1).toUpperCase();
	        	var validFileTypes = ['JPEG', 'PDF', 'JPG', 'TIFF', 'TIF','4X6M','PRC'];
	            if(validFileTypes.indexOf(fileTypeUploaded) == -1) {
	            	document.getElementById('blockui_uploadbtn').style.display = 'none';
	            	document.getElementById('fileTypeError').innerHTML = 'Invalid File Uploaded. Allowed PDF,JPG,TIFF type of files';
	            }
	        }
	    });
	}

	function next_Question2() {
		document.getElementById("button1").style.display = 'block';
	}
	function submit_Form2() {
		var initialReview = "${initialReview}";
		if (initialReview == 'True') {
			document.getElementById("button22").style.display = 'none';
		} else {
			document.getElementById("button22").style.display = 'block';
		}
	}
	function validatePeriod() {
		var period = "${period}";
		if (period == 'true') {
			document.getElementById("button1").href = "#tab2";
		} else {
			document.getElementById("button1").href = "#tab6";
		}
	}
	function validatecheck() {
		if (document.getElementById("inlineCheckbox1").checked) {
			document.getElementById("button6").style.display = 'block';
			document.getElementById("button7").style.display = 'none';
		} else {
			document.getElementById("button6").style.display = 'none';
			var initialReview = "${initialReview}";
			if (initialReview == 'True') {
				document.getElementById("button7").style.display = 'none';
			} else {
				document.getElementById("button7").style.display = 'block';
			}
		}
	}
	function set_Comment() {
		var selectednote = document.getElementById("notes").value;

		document.getElementById("noteedit").value = selectednote;
	}
	function append_Comment() {
		var selectednote = document.getElementById("noteedit").value;
		var changednote = document.getElementById("notes").value;

		document.getElementById("noteedit").value = selectednote + " "
				+ changednote;
	}	
</script>
