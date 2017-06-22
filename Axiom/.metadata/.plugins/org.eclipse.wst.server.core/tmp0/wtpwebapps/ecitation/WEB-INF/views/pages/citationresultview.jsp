<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">
		<br /> <br />
		<!-- BEGIN PAGE HEADER-->
		<div class="page-bar" style="margin: -70px 0px 10px;">
			<ul class="page-breadcrumb">
				<li><a href="${pageContext.request.contextPath}/citationlist"><spring:message
							code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message
							code="lbl.topmenu.tab.citation.view" /></span></li>
			</ul>
		</div>
		<div style="margin-bottom: 15px">
			<a onclick="enablePageLoadBar()"
				style="text-decoration: none; color: #fff;"
				href="${pageContext.request.contextPath}/citationdetails/${citationId}"><span
				class="btn green btn-sm"
				style="width: 65px; float: left; margin-bottom: 2px; margin-left: 10px;">EDIT</span></a>
		</div>

		<c:if
			test="${citationForm.status!='PAID' && citationForm.status!='CLOSED'  &&  citationForm.status!='VIOD' && citationForm.status!='OVERPAID' && citationForm.totalDue>0.00}">
			<div style="margin-bottom: 15px">
				<a onclick="enablePageLoadBar()"
					style="text-decoration: none; color: #fff;"
					href="${pageContext.request.contextPath}/payment/${citationId}"><span
					class="btn green btn-sm"
					style="width: 65px; float: right; margin-bottom: 2px; margin-right: 10px;">PAY</span></a>
			</div>
		</c:if>
		<!-- END PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="row">
						<div class="col-md-3 col-sm-3">
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
														<c:when test="${citationForm.status == 'OVERPAID'}">
														<b><c:out value="CLOSED - OVERPAID" /></b>
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


						<div class="col-md-3 col-sm-3">
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
											<td><c:if test="${not empty citationForm.addressSource}">
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
												</c:if> 
												<c:if test="${citationForm.nixie}">
												<font style="font-weight: 400; color: #FEFDFD; background-color: #F50C2D; float: right;"><b>NIXIE</b></font>
												</c:if>
											</td>
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
											<td ><font style="font-weight: 400;text-transform: uppercase;"><c:out
														value="${citationForm.comments[0].formattedCreatedAtNoss}" /></font></td>
										</tr>
										</table>
										</div>
										<div class="portlet-body scroller" style="padding: 6px;overflow: scroll;height:100px;">
									<table style="font-size: 13px;" >
										<tr>
											<td>												
													<font style="font-weight: 400;text-transform: uppercase;"><c:out
														value="${citationForm.comments[0].comment}" /></font>		
											</td>
										</tr>										
									</table>
								</div>
								<div class="portlet-body" style="padding-top: 5px;padding-bottom: 5px;padding-left: 6px;">
									<table style="font-size: 13px;" >
										<tr>
											<td><a style="color: blue"
												href="${pageContext.request.contextPath}/history/${citationId}?historyItem=Notes"><b>View
														All Notes</b></a></td>
										</tr>
										<tr>
											<td><a style="color: blue" data-toggle="modal"
												href="#addNotesModal"><b>Add
														Notes</b></a></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-3">
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
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-3">
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
									<td><font style="font-weight: 400;"><c:if
												test="${citationForm.penaltyAmt!='' && citationForm.penaltyAmt!=NULL}">
												<c:out value="${citationForm.penaltyAmt}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Penalty 1:</b></th>
									<td><font style="font-weight: 400;"> <c:if
												test="${penalty.penaltyCode.penalty1!='' && penalty.penaltyCode.penalty1!=NULL}">$<c:out
													value="${penalty.penaltyCode.penalty1}" />
											</c:if>
									</font></td>
								</tr>
								<tr>
									<th><b>Penalty 2:</b></th>
									<td><font style="font-weight: 400;"><c:if
												test="${penalty.penaltyCode.penalty2!='' && penalty.penaltyCode.penalty2!=NULL}">$<c:out
													value="${penalty.penaltyCode.penalty2}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Penalty 3:</b></th>
									<td><font style="font-weight: 400;"><c:if
												test="${penalty.penaltyCode.penalty3!='' && penalty.penaltyCode.penalty3!=NULL}">$<c:out
													value="${penalty.penaltyCode.penalty3}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Penalty 4:</b></th>
									<td><font style="font-weight: 400;"><c:if
												test="${penalty.penaltyCode.penalty4!='' && penalty.penaltyCode.penalty4!=NULL}">$<c:out
													value="${penalty.penaltyCode.penalty4}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Penalty 5:</b></th>
									<td><font style="font-weight: 400;"><c:if
												test="${penalty.penaltyCode.penalty5!='' && penalty.penaltyCode.penalty5!=NULL}">$<c:out
													value="${penalty.penaltyCode.penalty5}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Reduction:</b></th>
									<td><font style="font-weight: 400;"><c:if
												test="${penalty.reducedAmount!='' && penalty.reducedAmount!=NULL}">$<c:out
													value="${penalty.reducedAmount}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Total Amount Paid:</b></th>
									<td><font style="font-weight: 400;"><c:if
												test="${totalPaid!='' && totalPaid!=NULL}">$<c:out
													value="${totalPaid}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Total Due:</b></th>
									<td><font
										style="font-weight: 400; color: #FEFDFD; background-color: #F50C2D;"><c:if
												test="${citationForm.totalDue!='' && citationForm.totalDue!=NULL}">$<c:out
													value="${citationForm.totalDue}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Overpaid:</b></th>
									<td><font
										style="font-weight: 400; color: #FEFDFD; background-color: #F50C2D;"><c:if
												test="${paymentDetails.overPaid!='' && paymentDetails.overPaid!=NULL&& paymentDetails.overPaid!='0.00'}">$<c:out
													value="${paymentDetails.overPaid}" />
											</c:if>  </font></td>
								</tr>
								<tr>
									<th><b>Unapplied Amt:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out value="" /></font></td>
								</tr>
								<tr>
									<th><b>Next Penalty Date:&nbsp;&nbsp;</b></th>
									<c:if
										test="${citationForm.status!='PAID' && citationForm.status!='CLOSED' && citationForm.status!='OVERPAID' &&  citationForm.status!='VIOD' && citationForm.totalDue>0.00}">
										<td><font style="font-weight: 400;"><c:out
													value="${citationForm.penaltyDueDate}" /></font></td>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
					<div class="portlet box green bg-inverse">
						<div class="portlet-title"
							style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
							<div class="caption"
								style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
								<b>CORRESPONDENCE</b>
							</div>
						</div>
						<div class="portlet-body " style="padding: 6px;">
							<!-- Type, Description, Letter Type, Date, Time, User ID, Sent  -->
							<table style="font-size: 13px;">
								<tr>
									<th><b>Type:</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${correspondenceDetails.correspCode.typCd}" /></font></td>
								</tr>
								<tr>
									<th><b>Description:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${correspondenceDetails.correspCode.correspDesc}" /></font></td>
								</tr>
								<tr>
									<th><b>Letter Type:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out value="" /></font></td>
								</tr>
								<tr>
									<th><b>Date:</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${correspondenceDetails.formattedCorresDate}" /></font></td>
								</tr>
								<tr>
									<th><b>Time:</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${correspondenceDetails.corresp_time}" /></font></td>
								</tr>
								<tr>
									<th><b>User ID:</b></th>
									<td><font style="font-weight: 400;"><c:out value="" /></font></td>
								</tr>
								<tr>
									<th><b>Sent:</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${correspondenceDetails.corresp_sent}" /></font></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
					<div class="portlet box green bg-inverse">
						<div class="portlet-title"
							style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
							<div class="caption"
								style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
								<b>PAYMENTS</b>
							</div>
						</div>
						<div class="portlet-body " style="padding: 6px;">
							<!--Accounts, Type, Batch, Process Date, Payment Dep, Method, Amount, Refund Check, Reapply Source  -->
							<table style="font-size: 13px;">
								<tr>
									<th><b>Accounts:</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${paymentDetails.account}" /></font></td>
								</tr>
								<tr>
									<th><b>Type:</b></th>
									<td><font style="font-weight: 400;"><c:out value="" /></font></td>
								</tr>
								<tr>
									<th><b>Batch:</b></th>
									<td><font style="font-weight: 400;"><c:out value="" /></font></td>
								</tr>
								<tr>
									<th><b>Process Date:</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${paymentDetails.processedOn}" /></font></td>
								</tr>
								<tr>
									<th><b>Payment Dep:</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${paymentDetails.paymentDate}" /></font></td>
								</tr>
								<tr>
									<th><b>Method:</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${paymentDetails.paymentMethod.description}" /></font></td>
								</tr>
								<tr>
									<th><b>Amount:</b></th>
									<td><font style="font-weight: 400;"><c:if
												test="${paymentDetails.amount!='' && paymentDetails.amount!=NULL}">$<c:out
													value="${paymentDetails.amount}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Refund Check:</b></th>
									<td><font style="font-weight: 400;"><c:if
												test="${refundCheck!='' && refundCheck!=NULL}"><c:out
													value="${refundCheck}" />
											</c:if> </font></td>
								</tr>
								<tr>
									<th><b>Reapply Source:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out value="" /></font></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-3">
					<div class="portlet box green bg-inverse">
						<div class="portlet-title"
							style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
							<div class="caption"
								style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
								<b>HEARING AND DISPOSITION</b>
							</div>
						</div>
						<div class="portlet-body " style="padding: 6px;">
							<!--Hearing Officer, Hearing Date, Hearing Time, User ID, Hearing Proc Date, Disposition Code, Description, Plea, Disposition Date, Disp process Date, Disposition User ID, Reduction Amount, Case -->
							<table style="font-size: 13px;">
								<tr>
									<th><b>Hearing Officer:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.hearingOfficer}" /></font></td>
								</tr>
								<tr>
									<th><b>Hearing Date:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.formattedHearingDate}" /></font></td>
								</tr>
								<tr>
									<th><b>Hearing Time:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.hearingTime}" /></font></td>
								</tr>
								<tr>
									<th><b>User ID:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.userId}" /></font></td>
								</tr>
								<tr>
									<th><b>Hearing Proc Date:&nbsp;&nbsp;&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out value="" /></font></td>
								</tr>

								<c:choose>
									<c:when test="${not empty hearingDetails.disposition}">
										<tr>
											<th><b>Disposition Code:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="${dispCode}" /></font></td>
										</tr>
										<tr>
											<th><b>Description:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="${dispDesc}" /></font></td>
										</tr>

									</c:when>
									<c:otherwise>
										<tr>
											<th><b>Disposition Code:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="" /></font></td>
										</tr>
										<tr>
											<th><b>Description:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="" /></font></td>
										</tr>
									</c:otherwise>
								</c:choose>
								<tr>
									<th><b>Disposition Date:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.formattedDispDate}" /></font></td>
								</tr>
								<tr>
									<th><b>Disp process Date:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.dispositionTime}" /></font></td>
								</tr>
								<tr>
									<th><b>Disposition User ID:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.userId}" /></font></td>
								</tr>
								<tr>
									<th><b>Reduction Amount:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.reduction}" /></font></td>
								</tr>
								<tr>
									<th><b>Case #:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.caseNumber}" /></font></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
					<div class="portlet box green bg-inverse">
						<div class="portlet-title"
							style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
							<div class="caption"
								style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
								<b>ACTIVITY SUSPENSION</b>
							</div>
						</div>
						<div class="portlet-body " style="padding: 6px;">
							<!-- Suspend Code, Description, Date, Process Date, Time, User ID, Suspend Until -->
							<table style="font-size: 13px;">
								<tr>
									<th><b>Suspend Code:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${suspendDetails.suspendedCodes.code}" /></font></td>
								</tr>
								<tr>
									<th><b>Description:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${suspendDetails.suspendedCodes.description}" /></font></td>
								</tr>
								<tr>
									<th><b>Date:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${suspendDetails.formattedSuspendDate}" /></font></td>
								</tr>
								<tr>
									<th><b>Process Date:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${suspendDetails.formattedProcessedOn}" /></font></td>
								</tr>
								<tr>
									<th><b>Time:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${suspendDetails.suspended_time}" /></font></td>
								</tr>
								<tr>
									<th><b>User ID:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${suspendDetails.userId}" /></font></td>
								</tr>
								<tr>
									<th><b>Suspend Until:&nbsp;&nbsp;</b></th>
									<td><font style="font-weight: 400;"><c:out
												value="${hearingDetails.formattedSuspendDate}" /></font></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
					<div class="portlet box green bg-inverse">
						<div class="portlet-title"
							style="padding: 0 6px; margin-bottom: -3px; height: 27px; min-height: 10px;">
							<div class="caption"
								style="width: -10px; font-size: 12px; padding-top: 2px; padding-bottom: 1px;">
								<b>NOTICES</b>
							</div>
						</div>
						<div class="portlet-body " style="padding: 6px;">
							<!-- Notice Type, Description,Date, Date Proc, Notice Date, Status -->
							<table style="font-size: 13px;">
								<c:choose>
									<c:when test="${not empty noticeDetails}">
										<tr>
											<th><b>Notice Type:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="${noticeType}" /></font></td>
										</tr>
										<tr>
											<th><b>Description:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="${description}" /></font></td>
										</tr>
										<tr>
											<th><b>Date:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="${noticeDate}" /></font></td>
										</tr>
										<tr>
											<th><b>Date Proc:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="${dateProc}" /></font></td>
										</tr>
										<tr>
											<th><b>Status:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="" /></font></td>
										</tr>
										<tr>
											<th><b>Next Notice Date:&nbsp;&nbsp;</b></th>
											<c:if
												test="${citationForm.status!='PAID' && citationForm.status!='CLOSED' && citationForm.status!='OVERPAID' &&  citationForm.status!='VIOD' && citationForm.totalDue>0.00}">
												<td><font style="font-weight: 400;"><c:out
															value="${citationForm.noticeDueDate}" /></font></td>
											</c:if>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th><b>Notice Type:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="" /></font></td>
										</tr>
										<tr>
											<th><b>Description:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="" /></font></td>
										</tr>
										<tr>
											<th><b>Date:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="" /></font></td>
										</tr>
										<tr>
											<th><b>Date Proc:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="" /></font></td>
										</tr>
										<tr>
											<th><b>Status:&nbsp;&nbsp;</b></th>
											<td><font style="font-weight: 400;"><c:out
														value="" /></font></td>
										</tr>
										<tr>
											<th><b>Next Notice Date:&nbsp;&nbsp;</b></th>
											<c:if
												test="${citationForm.status!='PAID' && citationForm.status!='CLOSED'  &&  citationForm.status!='VIOD' &&  citationForm.status!='OVERPAID' && citationForm.totalDue>0.00}">
												<td><font style="font-weight: 400;"><c:out
															value="${citationForm.noticeDueDate}" /></font></td>
											</c:if>
										</tr>
									</c:otherwise>
								</c:choose>

							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="addNotesModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<input type="button" class="btn btn-xs pull-right" value="&times;"
						data-dismiss="modal" id="close" />
					<h4 class="modal-title" id="myModalLabel">
						<i class="text-muted fa fa-sticky-note-o"></i> Add Notes
					</h4>
				</div>
				<div class="modal-body">
					<form:form id="commentForm"
						action="${pageContext.request.contextPath}/addnotesmodal"
						modelAttribute="commentForm" method="post" autocomplete="on">
						<div class="row form-group">
							<div class="  col-md-9">
								<div class="mt-radio-inline">
									<label class="mt-radio label-sm"> <form:radiobutton
											path="commentType" id="commentType" value="I" />Internal <span></span>
									</label> <label class="mt-radio label-sm"> <form:radiobutton
											path="commentType" id="commentType" value="E" checked="true" />External
										<span></span>
									</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-md-12">
									<form:textarea name="markdown" path="comment" rows="5"
										cols="10" style="width:100%;text-transform: uppercase;"></form:textarea>
								</div>
							</div>
						</div>
						<form:hidden path="citationId" id="citationId"></form:hidden>
						<div class="modal-footer">
							<input type="submit" class="btn green btn-sm" value="Save"
								id="blockui_savebtn_comment" />
						</div>
					</form:form>
					<c:if test="${not empty comments}">
						<div class="portlet-body">
							<div class="table-responsive scroller">
								<div class="scroller"
									style="height: 180px; overflow-y: scroll; overflow-x: hidden;">
									<table id="cmntsTbl" class="table table-hover table-bordered ">
										<thead>
											<tr style="background-color: #f5f3eb;">
												<th style="color: #32c5d2; text-align: center;" width="60%"
													t><b>Notes</b></th>
												<th style="color: #32c5d2; text-align: center;" width="15%"><b>Updated
														By</b></th>
												<th style="color: #32c5d2; text-align: center;" width="18%"><b>Updated
														Date</b></th>
												<th style="color: #32c5d2; text-align: center;" width="2%"><b>Type</b></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${comments}" var="comment">
												<tr>
													<td style="text-transform: uppercase;"><c:out
															value="${comment.comment}" /></td>
													<td style="text-transform: uppercase;"><c:out
															value="${comment.createdBy}" /></td>
													<td style="text-transform: uppercase;"><c:out
															value="${comment.formattedCreatedAtNoss}" /></td>
													<td style="text-transform: uppercase;"><c:choose>
															<c:when test="${comment.commentType== 'I'}">
												Internal
											</c:when>
															<c:otherwise>
												External
											</c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</c:if>
				</div>

				<!-- END Portlet PORTLET-->

			</div>
		</div>
		<script
			src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
			type="text/javascript"></script>
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$('#commentForm')
										.submit(
												function(e) {
													var frm = $('#commentForm');
													e.preventDefault();

													var data = {}
													var Form = this;
													//Gather Data also remove undefined keys(buttons)
													$
															.each(
																	this,
																	function(i,
																			v) {
																		var input = $(v);
																		data[input
																				.attr("name")] = input
																				.val();
																		delete data["undefined"];
																	});
													var commentType = $(
															"input[name='commentType']:checked")
															.val();
													data['commentType'] = commentType;
													$
															.ajax(
																	{
																		contentType : 'application/json; charset=utf-8',
																		type : frm
																				.attr('method'),
																		url : frm
																				.attr('action'),
																		dataType : 'json',
																		data : JSON
																				.stringify(data)
																	})
															.done(
																	function(
																			response) {
																		$(
																				'#addNotesModal')
																				.modal(
																						'hide');
																		window.top.location
																				.reload();
																	});
												});
							});
		</script>
	</div>
</div>
<!-- </div> -->

<!-- END CONTENT -->
<!-- END CONTAINER -->

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