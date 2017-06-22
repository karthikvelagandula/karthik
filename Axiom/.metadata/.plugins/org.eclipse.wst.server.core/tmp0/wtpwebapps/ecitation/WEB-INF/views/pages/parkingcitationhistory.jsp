<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<!-- BEGIN CONTENT BODY -->
<div class="page-content-wrapper">
	<div class="page-content">
		<!-- BEGIN PAGE HEADER-->
		<div class="page-bar" style="margin: -25px 0px 0;">
			<div class="row">
				<div class="col-md-8">
					<ul class="page-breadcrumb">
						<li><a href="${pageContext.request.contextPath}/citationlist"><spring:message
									code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
						<li><span><spring:message
									code="lbl.topmenu.tab.citation.history" /></span></li>
					</ul>
				</div>
				<form
					action='${pageContext.request.contextPath}/history/${citationId}/'
					id="historySearchForm" method='GET'>
					<div class="form-group" style="margin-left: -20px;">
						<label class="control-label label-sm col-md-4"></label>
						<div class="col-md-3">
							<select class="form-control inut-sm"  id="historyItem" name="historyItem">
								<option value="All">VIEW ALL</option>
								<option value="Address">ADDRESS</option>
								<option value="Correspondence">CORRESPONDENCE</option>
								<option value="Hearing">HEARING</option>
								<option value="Misc">MISCELLANEOUS</option>
								<option value="Notes">NOTES</option>
								<option value="Notices">NOTICES</option>
								<option value="Payment">PAYMENTS</option>
								<option value="Penalty">PENALTY</option>
								<option value="PlateEntity">PLATE ENTITY</option>
								<option value="Refunds">REFUND</option>
								<option value="Suspend">SUSPENDS</option>
							</select>
						</div>
						<div class="col-md-2" style="margin-left:10px;">
							<button type="button" class="btn green btn-sm" id="printBtn"
								style="position: static; float: none; top: -2px; left: -500px; right: 30px; bottom: 40px">
								<i class="icon-printer"></i> Print
							</button>
						</div>
					</div>
				</form>
			</div>
			<br />
			<!-- END PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div id="printarea" class="portlet light portlet-fit bordered">
								<div style="text-align: center;">
									<span style="font-size: 16px;"><span
										style="font-size: 17px"> <b>License Number:</b></span>&nbsp;${licenseNumber}
										&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px"><b>Violation
												Number:</b></span>&nbsp;${citationId} </span>
								</div>
								<div class="portlet-title">
									<div class="caption">Violation History</div>
								</div>
								<div class="portlet-body">
									<div class="table-responsive scroller">
										<c:choose>
											<c:when test="${historyItem == 'All'}">
												<div class="portlet-body">
													<div class="table-responsive scroller">
														<table id="allDetailsTbl"
															class="table table-hover table-bordered">
															<thead>
																<tr style="background-color: #f5f3eb;">
																	<th style="color: #32c5d2" width="9%"><b>Type</b></th>
																	<th style="color: #32c5d2" width="64%"><b>Data</b></th>
																	<th style="color: #32c5d2" width="10%"><b>Updated
																			By</b></th>
																	<th style="color: #32c5d2" width="17%"><b>Updated
																			Date</b></th>

																</tr>
															</thead>
															<tbody>
																<c:if
																	test="${not empty externalCommentsHistory || not empty internalCommentsHistory}">
																	<c:if test="${not empty externalCommentsHistory }">
																		<c:forEach items="${externalCommentsHistory}"
																			var="externalComment">
																			<tr>
																				<td style="text-transform: uppercase;"><c:out
																						value="NOTES" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${externalComment.comment}" />,&nbsp;<c:out
																						value="External" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${externalComment.createdBy}" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${externalComment.formattedCreatedAt}" /></td>
																			</tr>
																		</c:forEach>
																	</c:if>
																	<c:if test="${not empty internalCommentsHistory }">
																		<c:forEach items="${internalCommentsHistory}"
																			var="internalComment">
																			<tr data-type="internalComment">
																				<td style="text-transform: uppercase;"><c:out
																						value="NOTES" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${internalComment.comment}" />,&nbsp;<c:out
																						value="Internal" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${internalComment.createdBy}" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${internalComment.formattedCreatedAt}" /></td>
																			</tr>
																		</c:forEach>
																	</c:if>
																</c:if>
																<c:if test="${not empty plateEntityHistory }">
																	<c:forEach items="${plateEntityHistory}"
																		var="plateEntity">
																		<tr>
																			<td style="text-transform: uppercase;"><c:out
																					value="PLATE ENTITY" /></td>
																			<c:choose>
																				<c:when test="${plateEntity.updatedAt == null}">
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.licenceNumber}" />,<c:out
																							value="${plateEntity.vinNumber}" />,<c:out
																							value="${plateEntity.licenseState}" />,<c:out
																							value="${plateEntity.licenseMonth}" />/<c:out
																							value="${plateEntity.licenseYear}" />,<c:out
																							value="${plateEntity.bodyType}" />,<c:out
																							value="${plateEntity.vehicleMake}" />,<c:out
																							value="${plateEntity.vehicleModel}" />,<c:out
																							value="${plateEntity.vehicleColor}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.createdBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.formattedCreatedAt}" /></td>
																				</c:when>
																				<c:otherwise>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.licenceNumber}" />,<c:out
																							value="${plateEntity.vinNumber}" />,<c:out
																							value="${plateEntity.licenseState}" />,<c:out
																							value="${plateEntity.licenseMonth}" />/<c:out
																							value="${plateEntity.licenseYear}" />,<c:out
																							value="${plateEntity.bodyType}" />,<c:out
																							value="${plateEntity.vehicleMake}" />,<c:out
																							value="${plateEntity.vehicleModel}" />,<c:out
																							value="${plateEntity.vehicleColor}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.updatedBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.formattedUpdatedAt}" /></td>
																				</c:otherwise>
																			</c:choose>
																		</tr>
																	</c:forEach>
																</c:if>
																<c:if test="${not empty penaltyHistory }">
																	<c:forEach items="${penaltyHistory}" var="penalty">
																		<tr>
																			<td><c:out value="PENALTY" /></td>
																			<c:choose>
																				<c:when test="${penalty.updatedAt == null}">
																					<td style="text-transform: uppercase;">&#36;<c:out
																							value="${penalty.fineAmount}" />, <c:choose>
																							<c:when
																								test="${not empty penalty.penaltyCode.penalty1}">
																								&#36;<c:out
																									value="${penalty.penaltyCode.penalty1}" />/
																								<c:out
																									value="${penalty.penaltyCode.formattedpenalty1}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/<c:out
																									value="${penalty.penaltyCode.formattedpenalty1}" />&#44;
																							</c:otherwise>
																						</c:choose> 
																						<c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty2}">
																								&#36;<c:out value="${penalty.penaltyCode.penalty2}" />/
																								<c:out value="${penalty.penaltyCode.formattedpenalty2}" />&#44;
																							</c:when>
																							<c:otherwise>
																								&#36;<c:out value="0.00" />/
																								<c:out value="${penalty.penaltyCode.formattedpenalty2}" />&#44;
																							</c:otherwise>
																						</c:choose> 
																						<c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty3}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty3}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty3}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty3}" />&#44;
																							</c:otherwise>
																						</c:choose>
																						<c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty4}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty4}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty4}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty4}" />&#44;
																							</c:otherwise>
																						</c:choose>
																						<c:choose>
																							<c:when	test="${not empty penalty.penaltyCode.penalty5}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty5}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty5}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty5}" />&#44;
																							</c:otherwise>
																						</c:choose>
																						<c:choose>
																							<c:when test="${not empty penalty.totalPaidAmount}">
																							&#36;<c:out value="${penalty.totalPaidAmount}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />&#44;
																							</c:otherwise>
																						</c:choose>
																						<c:choose>
																							<c:when test="${not empty penalty.reducedAmount}">
																							&#36;<c:out value="${penalty.reducedAmount}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />&#44;
																							</c:otherwise>
																						</c:choose> 
																						$<c:out value="${penalty.citation.totalDue}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${penalty.createdBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${penalty.formattedCreatedAt}" /></td>
																				</c:when>
																				<c:otherwise>
																					<td style="text-transform: uppercase;">&#36;<c:out
																							value="${penalty.fineAmount}" />, <c:choose>
																							<c:when
																								test="${not empty penalty.penaltyCode.penalty1}">
																								&#36;<c:out
																									value="${penalty.penaltyCode.penalty1}" />/
																								<c:out
																									value="${penalty.penaltyCode.formattedpenalty1}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/<c:out
																									value="${penalty.penaltyCode.formattedpenalty1}" />&#44;
																							</c:otherwise>
																						</c:choose> 
																						<c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty2}">
																								&#36;<c:out value="${penalty.penaltyCode.penalty2}" />/
																								<c:out value="${penalty.penaltyCode.formattedpenalty2}" />&#44;
																							</c:when>
																							<c:otherwise>
																								&#36;<c:out value="0.00" />/
																								<c:out value="${penalty.penaltyCode.formattedpenalty2}" />&#44;
																							</c:otherwise>
																						</c:choose> 
																						<c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty3}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty3}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty3}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty3}" />&#44;
																							</c:otherwise>
																						</c:choose>
																						<c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty4}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty4}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty4}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty4}" />&#44;
																							</c:otherwise>
																						</c:choose>
																						<c:choose>
																							<c:when	test="${not empty penalty.penaltyCode.penalty5}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty5}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty5}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty5}" />&#44;
																							</c:otherwise>
																						</c:choose>
																						<c:choose>
																							<c:when test="${not empty penalty.totalPaidAmount}">
																							&#36;<c:out value="${penalty.totalPaidAmount}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />&#44;
																							</c:otherwise>
																						</c:choose>
																						<c:choose>
																							<c:when test="${not empty penalty.reducedAmount}">
																							&#36;<c:out value="${penalty.reducedAmount}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />&#44;
																							</c:otherwise>
																						</c:choose> 
																						$<c:out value="${penalty.citation.totalDue}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${penalty.updatedBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${penalty.formattedUpdatedAt}" /></td>
																				</c:otherwise>
																			</c:choose>
																		</tr>
																	</c:forEach>
																</c:if>
																<c:if test="${not empty paymentHistory }">
																	<c:forEach items="${paymentHistory}" var="paymentList">
																		<c:forEach items="${paymentList}" var="payment">
																			<tr>
																				<td style="text-transform: uppercase;"><c:out
																						value="PAYMENTS" /></td>
																				<c:choose>
																					<c:when test="${payment.updatedAt == null}">
																						<td style="text-transform: uppercase;">$<c:out
																								value="${payment.amount}" />/<c:out
																								value="${payment.paymentDate}" />, <c:out
																								value="PAYMENT" />/<c:out
																								value="${payment.paymentMethod.description}" />,
																							<c:out value="${payment.account}" />, <c:out
																								value="${payment.processedOn}" />/<c:out
																								value="${payment.processedBy}" />, <c:if
																								test="${payment.ipp!=false}">
																								<c:out value="Yes" />,
																		</c:if> <c:if test="${payment.ipp!=true}">
																								<c:out value="No" />,
																		</c:if> $<c:out value="${payment.overPaid}" />, $<c:out
																								value="${payment.totalDue}" />&#44;&nbsp;<c:out
																								value="${payment.transaction.id}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.formattedCreatedAt}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${payment.amount}" />/<c:out
																								value="${payment.paymentDate}" />, <c:out
																								value="PAYMENT" />/<c:out
																								value="${payment.paymentMethod.description}" />,
																							<c:out value="${payment.account}" />, <c:out
																								value="${payment.processedOn}" />/<c:out
																								value="${payment.processedBy}" />, <c:if
																								test="${payment.ipp!=false}">
																								<c:out value="YES" />,
																		</c:if> <c:if test="${payment.ipp!=true}">
																								<c:out value="NO" />,
																		</c:if> $<c:out value="${payment.overPaid}" />, $<c:out
																								value="${payment.totalDue}" />&#44;&nbsp;<c:out
																								value="${payment.transaction.id}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.formattedUpdatedAt}" /></td>
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
																				<td style="text-transform: uppercase;"><c:out
																						value="HEARINGS" /></td>
																				<c:choose>
																					<c:when test="${hearing.updatedAt == null}">
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.id}" />, <c:out
																								value="${hearing.hearingOfficer}" />, <c:out
																								value="${hearing.formattedHearingDate}" />/<c:out
																								value="${hearing.hearingTime}" />,<c:out
																								value="${hearing.formattedDispDate}" />/<c:out
																								value="${hearing.dispositionTime}" />,<c:out
																								value="${hearing.disposition}" />/<c:out
																								value="${hearing.userId}" />, <c:out
																								value="${hearing.suspend}" />/<c:out
																								value="${hearing.formattedSuspendDate}" />, <c:out
																								value="${hearing.caseNumber}" />/<c:out
																								value="${hearing.plea}" />, $<c:out
																								value="${hearing.reduction}" />/$<c:out
																								value="${hearing.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.formattedCreatedAt}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.id}" />, <c:out
																								value="${hearing.hearingOfficer}" />, <c:out
																								value="${hearing.formattedHearingDate}" />/<c:out
																								value="${hearing.hearingTime}" />,<c:out
																								value="${hearing.formattedDispDate}" />/<c:out
																								value="${hearing.dispositionTime}" />,<c:out
																								value="${hearing.disposition}" />/<c:out
																								value="${hearing.userId}" />, <c:out
																								value="${hearing.suspend}" />/<c:out
																								value="${hearing.formattedSuspendDate}" />, <c:out
																								value="${hearing.caseNumber}" />/<c:out
																								value="${hearing.plea}" />, $<c:out
																								value="${hearing.reduction}" />/$<c:out
																								value="${hearing.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.formattedUpdatedAt}" /></td>
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
																				<td style="text-transform: uppercase;"><c:out
																						value="SUSPENDS" /></td>
																				<c:choose>
																					<c:when test="${suspend.updatedAt == null}">
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.suspendedCodes.description}" />,
																							<c:out value="${suspend.formattedSuspendDate}" />/<c:out
																								value="${suspend.suspended_time}" />, <c:out
																								value="${suspend.formattedProcessedOn}" />/<c:out
																								value="${suspend.userId}" />, <c:out
																								value="${suspend.caseSuspend}" />, <c:out
																								value="${suspend.dateOverride}" />, <c:choose>
																							<c:when	test="${not empty suspend.reduction}">
																							&#36;<c:out value="${suspend.reduction}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />&#44;
																							</c:otherwise>
																						</c:choose> $<c:out
																								value="${suspend.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.formattedCreatedAt}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.suspendedCodes.description}" />,
																							<c:out value="${suspend.formattedSuspendDate}" />/<c:out
																								value="${suspend.suspended_time}" />, <c:out
																								value="${suspend.formattedProcessedOn}" />/<c:out
																								value="${suspend.userId}" />, <c:out
																								value="${suspend.caseSuspend}" />, <c:out
																								value="${suspend.dateOverride}" />, <c:choose>
																							<c:when	test="${not empty suspend.reduction}">
																							&#36;<c:out value="${suspend.reduction}" />&#44;
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />&#44;
																							</c:otherwise>
																						</c:choose> $<c:out
																								value="${suspend.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.formattedUpdatedAt}" /></td>
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
																				<td style="text-transform: uppercase;"><c:out
																						value="CORRESPONDENCE" /></td>
																				<c:choose>
																					<c:when test="${correspond.updatedAt == null}">
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.id}" />, <c:out
																								value="${correspond.correspCode.correspDesc}" />,
																							<c:out value="${correspond.formattedCorresDate}" />,
																							<c:out value="${correspond.corresp_time}" />, <c:out
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
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.formattedCreatedAt}" /></td>

																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.id}" />, <c:out
																								value="${correspond.correspCode.correspDesc}" />,
																							<c:out value="${correspond.formattedCorresDate}" />,
																							<c:out value="${correspond.corresp_time}" />, <c:out
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
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.formattedUpdatedAt}" /></td>
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
																				<td style="text-transform: uppercase;"><c:out
																						value="NOTICES" /></td>
																				<c:choose>
																					<c:when test="${notice.updatedAt == null}">
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.noticeType.fullNm}" />,
																							<c:out value="${notice.formattedSentDate}" />,&nbsp;<c:out
																								value="${notice.formattedProcessedDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.formattedCreatedAt}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.noticeType.fullNm}" />,
																							<c:out value="${notice.formattedSentDate}" />,&nbsp;<c:out
																								value="${notice.formattedProcessedDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.formattedUpdatedAt}" /></td>
																					</c:otherwise>
																				</c:choose>
																			</tr>
																		</c:forEach>
																	</c:forEach>
																</c:if>
																<c:if test="${not empty refundsHistory}">
																					<c:forEach items="${refundsHistory}" var="refund">
																						<tr>
																							<td><c:out  value="REFUNDS"/></td>
																							<c:choose>
																								<c:when test="${refund.updatedAt == null}">
																									<td style="text-transform: uppercase;">$<c:out value="${refund.amount}" />,
																										<c:out value="${refund.formattedProcessDate}" />,&nbsp;<c:out	value="${refund.account}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.createdBy}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.formattedCreatedAt}" /></td>
																								</c:when>
																								<c:otherwise>
																									<td style="text-transform: uppercase;">$<c:out value="${refund.amount}" />,
																										<c:out value="${refund.formattedProcessDate}" />,&nbsp;<c:out	value="${refund.account}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.updatedBy}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.formattedUpdatedAt}" /></td>
																								</c:otherwise>
																							</c:choose>
																						</tr>
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
															</tbody>
														</table>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<c:if
													test="${not empty externalCommentsHistory || not empty internalCommentsHistory}">
													<div class="portlet-body">
														<div class="table-responsive scroller">
															<table id="cmntsTbl"
																class="table table-hover table-bordered ">
																<thead>
																	<tr style="background-color: #f5f3eb;">
																		<th style="color: #32c5d2" width="62%"><b>Notes</b></th>
																		<th style="color: #32c5d2" width="11%"><b>Updated
																				By</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Updated
																				Date</b></th>
																		<th style="color: #32c5d2" width="7%"><b>Type</b></th>
																	</tr>
																</thead>
																<tbody>
																	<c:if test="${not empty externalCommentsHistory }">
																		<c:forEach items="${externalCommentsHistory}"
																			var="externalComment">
																			<tr>
																				<td style="text-transform: uppercase;"><c:out
																						value="${externalComment.comment}" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${externalComment.createdBy}" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${externalComment.formattedCreatedAt}" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="EXTERNAL" /></td>
																			</tr>
																		</c:forEach>
																	</c:if>
																	<c:if test="${not empty internalCommentsHistory }">
																		<c:forEach items="${internalCommentsHistory}"
																			var="internalComment">
																			<tr data-type="internalComment">
																				<td style="text-transform: uppercase;"><c:out
																						value="${internalComment.comment}" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${internalComment.createdBy}" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="${internalComment.formattedCreatedAt}" /></td>
																				<td style="text-transform: uppercase;"><c:out
																						value="INTERNAL" /></td>
																			</tr>
																		</c:forEach>
																	</c:if>
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
												<c:if test="${not empty plateEntityHistory }">
													<div class="portlet-body">
														<div class="table-responsive scroller">
															<table id="pltEntTbl"
																class="table table-hover table-bordered">
																<thead>
																	<tr style="background-color: #f5f3eb;">
																		<th style="color: #32c5d2" width="20%"><b>Vehicle
																				License Number</b></th>
																		<th style="color: #32c5d2" width="20%"><b>VIN
																				Number</b></th>
																		<th style="color: #32c5d2" width="20%"><b>License
																				State</b></th>
																		<th style="color: #32c5d2" width="20%"><b>License
																				Month/Year</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Vehicle
																				Body Type</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Vehicle
																				Make</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Vehicle
																				Model</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Vehicle
																				Color</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Updated
																				By</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Updated
																				Date</b></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${plateEntityHistory}"
																		var="plateEntity">
																		<tr>
																			<c:choose>
																				<c:when test="${plateEntity.updatedAt == null}">
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.licenceNumber}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.vinNumber}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.licenseState}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.licenseMonth}" />/<c:out
																							value="${plateEntity.licenseYear}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.bodyType}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.vehicleMake}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.vehicleModel}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.vehicleColor}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.createdBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.formattedCreatedAt}" /></td>
																				</c:when>
																				<c:otherwise>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.licenceNumber}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.vinNumber}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.licenseState}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.licenseMonth}" />/<c:out
																							value="${plateEntity.licenseYear}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.bodyType}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.vehicleMake}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.vehicleModel}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.vehicleColor}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.updatedBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${plateEntity.formattedUpdatedAt}" /></td>
																				</c:otherwise>
																			</c:choose>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
												<c:if test="${not empty refundsHistory}">
																	<div class="portlet-body">
																		<div class="table-responsive scroller">
																			<table id="pmntTbl"
																				class="table table-hover table-bordered ">
																				<thead>
																					<tr style="background-color: #f5f3eb;">
																						<th style="color: #32c5d2" width="10%"><b>Amount</b></th>
																						<th style="color: #32c5d2" width="10%"><b>Refund
																								Date</b></th>
																						<th style="color: #32c5d2" width="10%"><b>Check
																								Number</b></th>
																						<th style="color: #32c5d2" width="10%"><b>Updated
																								By</b></th>
																						<th style="color: #32c5d2" width="10%"><b>Updated
																								Date</b></th>
																					</tr>
																				</thead>
																				<tbody>
																					<c:forEach items="${refundsHistory}" var="refund">
																						<tr>
																							<c:choose>
																								<c:when test="${payment.updatedAt == null}">
																									<td style="text-transform: uppercase;">$<c:out
																											value="${refund.amount}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.formattedProcessDate}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.account}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.createdBy}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.formattedCreatedAt}" /></td>
																								</c:when>
																								<c:otherwise>
																									<td style="text-transform: uppercase;">$<c:out
																											value="${refund.amount}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.formattedProcessDate}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.account}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.updatedBy}" /></td>
																									<td style="text-transform: uppercase;"><c:out
																											value="${refund.formattedUpdatedAt}" /></td>
																								</c:otherwise>
																							</c:choose>
																						</tr>
																					</c:forEach>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</c:if>
												<c:if test="${not empty penaltyHistory }">
													<div class="portlet-body">
														<div class="table-responsive scroller">
															<table id="pnltyTbl"
																class="table table-hover table-bordered">
																<thead>
																	<tr style="background-color: #f5f3eb;">
																		<th style="color: #32c5d2" width="10%"><b>Fine
																				Amt</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Penalty
																				1 / Date</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Penalty
																				2 / Date</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Penalty
																				3 / Date</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Penalty
																				4 / Date</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Penalty
																				5 / Date</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Total
																				Paid</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Reduced</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Total
																				Due/Over paid</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Updated
																				By</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Updated
																				Date</b></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${penaltyHistory}" var="penalty">
																		<tr>
																			<c:choose>
																				<c:when test="${penalty.updatedAt == null}">
																					<td style="text-transform: uppercase;">&#36;<c:out
																							value="${penalty.fineAmount}" /></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when
																								test="${not empty penalty.penaltyCode.penalty1}">
																								&#36;<c:out
																									value="${penalty.penaltyCode.penalty1}" />/
																								<c:out
																									value="${penalty.penaltyCode.formattedpenalty1}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/<c:out
																									value="${penalty.penaltyCode.formattedpenalty1}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty2}">
																								&#36;<c:out value="${penalty.penaltyCode.penalty2}" />/
																								<c:out value="${penalty.penaltyCode.formattedpenalty2}" />
																							</c:when>
																							<c:otherwise>
																								&#36;<c:out value="0.00" />/
																								<c:out value="${penalty.penaltyCode.formattedpenalty2}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty3}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty3}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty3}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty3}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty4}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty4}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty4}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty4}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when	test="${not empty penalty.penaltyCode.penalty5}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty5}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty5}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty5}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.totalPaidAmount}">
																							&#36;<c:out value="${penalty.totalPaidAmount}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.reducedAmount}">
																							&#36;<c:out value="${penalty.reducedAmount}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;">&#36;<c:out
																							value="${penalty.citation.totalDue}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${penalty.createdBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${penalty.formattedCreatedAt}" /></td>
																				</c:when>
																				<c:otherwise>
																					<td style="text-transform: uppercase;">&#36;<c:out
																							value="${penalty.fineAmount}" /></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when
																								test="${not empty penalty.penaltyCode.penalty1}">
																								&#36;<c:out
																									value="${penalty.penaltyCode.penalty1}" />/
																								<c:out
																									value="${penalty.penaltyCode.formattedpenalty1}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/<c:out
																									value="${penalty.penaltyCode.formattedpenalty1}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty2}">
																								&#36;<c:out value="${penalty.penaltyCode.penalty2}" />/
																								<c:out value="${penalty.penaltyCode.formattedpenalty2}" />
																							</c:when>
																							<c:otherwise>
																								&#36;<c:out value="0.00" />/
																								<c:out value="${penalty.penaltyCode.formattedpenalty2}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty3}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty3}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty3}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty3}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.penaltyCode.penalty4}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty4}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty4}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty4}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when	test="${not empty penalty.penaltyCode.penalty5}">
																							&#36;<c:out value="${penalty.penaltyCode.penalty5}" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty5}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />/
																							<c:out value="${penalty.penaltyCode.formattedpenalty5}" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.totalPaidAmount}">
																							&#36;<c:out value="${penalty.totalPaidAmount}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;"><c:choose>
																							<c:when test="${not empty penalty.reducedAmount}">
																							&#36;<c:out value="${penalty.reducedAmount}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />
																							</c:otherwise>
																						</c:choose></td>
																					<td style="text-transform: uppercase;">&#36;<c:out
																							value="${penalty.citation.totalDue}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${penalty.updatedBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${penalty.formattedUpdatedAt}" /></td>
																				</c:otherwise>
																			</c:choose>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
												<c:if test="${not empty paymentHistory}">
													<div class="portlet-body">
														<div class="table-responsive scroller">
															<table id="pmntTbl"
																class="table table-hover table-bordered ">
																<thead>
																	<tr style="background-color: #f5f3eb;">
																		<th style="color: #32c5d2" width="10%"><b>Amount/Payment
																				Date</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Type/Method</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Account</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Processed
																				On/User Id</b></th>
																		<th style="color: #32c5d2" width="10%"><b>IPP</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Over
																				paid</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Total
																				Due</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Transaction
																				Number</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Updated
																				By</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Updated
																				Date</b></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${paymentHistory}" var="paymentList">
																		<c:forEach items="${paymentList}" var="payment">
																			<tr>
																				<c:choose>
																					<c:when test="${payment.updatedAt == null}">
																						<td style="text-transform: uppercase;">$<c:out
																								value="${payment.amount}" />/<c:out
																								value="${payment.paymentDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="PAYMENT" />/<c:out
																								value="${payment.paymentMethod.description}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.account}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.processedOn}" />/<c:out
																								value="${payment.processedBy}" /></td>
																						<c:if test="${payment.ipp!=false}">
																							<td style="text-transform: uppercase;"><c:out
																									value="Yes" /></td>
																						</c:if>
																						<c:if test="${payment.ipp!=true}">
																							<td style="text-transform: uppercase;"><c:out
																									value="No" /></td>
																						</c:if>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${payment.overPaid}" /></td>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${payment.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.transaction.id}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.formattedCreatedAt}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${payment.amount}" />/<c:out
																								value="${payment.paymentDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="PAYMENT" />/<c:out
																								value="${payment.paymentMethod.description}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.account}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.processedOn}" />/<c:out
																								value="${payment.processedBy}" /></td>
																						<c:if test="${payment.ipp!=false}">
																							<td style="text-transform: uppercase;"><c:out
																									value="Yes" /></td>
																						</c:if>
																						<c:if test="${payment.ipp!=true}">
																							<td style="text-transform: uppercase;"><c:out
																									value="No" /></td>
																						</c:if>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${payment.overPaid}" /></td>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${payment.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.transaction.id}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${payment.formattedUpdatedAt}" /></td>
																					</c:otherwise>
																				</c:choose>
																			</tr>
																		</c:forEach>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
												<c:if test="${not empty hearingHistory}">
													<div class="portlet-body">
														<div class="table-responsive scroller">
															<table id="hearingTbl"
																class="table table-hover table-bordered">
																<thead>
																	<tr style="background-color: #f5f3eb;">
																		<th style="color: #32c5d2" width="10%"><b>ID</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Hearing
																				Officer</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Hearing
																				Date/<br>Time
																		</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Disposition
																				Date/<br>Time
																		</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Disposition/<br>User
																				Name
																		</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Suspend/<br>Suspend
																				Untill
																		</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Case
																				# /<br>Plea
																		</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Reduction/<br>Total
																				Due
																		</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Updated
																				By</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Updated
																				Date</b></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${hearingHistory}" var="hearingList">
																		<c:forEach items="${hearingList}" var="hearing">
																			<tr>
																				<c:choose>
																					<c:when test="${hearing.updatedAt == null}">
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.id}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.hearingOfficer}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.formattedHearingDate}" />/<br>
																						<c:out value="${hearing.hearingTime}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.formattedDispDate}" />/<br>
																						<c:out value="${hearing.dispositionTime}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.disposition}" />/<br>
																						<c:out value="${hearing.userId}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.suspend}" />/<c:out
																								value="${hearing.suspendUntil}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.caseNumber}" />/<br>
																						<c:out value="${hearing.plea}" /></td>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${hearing.reduction}" />/<br>$<c:out
																								value="${hearing.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.formattedCreatedAt}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.id}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.hearingOfficer}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.formattedHearingDate}" />/<br>
																						<c:out value="${hearing.hearingTime}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.formattedDispDate}" />/<br>
																						<c:out value="${hearing.dispositionTime}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.disposition}" />/<br>
																						<c:out value="${hearing.userId}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.suspend}" />/<br>
																						<c:out value="${hearing.suspendUntil}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.caseNumber}" />/<br>
																						<c:out value="${hearing.plea}" /></td>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${hearing.reduction}" />/<br>$<c:out
																								value="${hearing.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${hearing.formattedUpdatedAt}" /></td>
																					</c:otherwise>
																				</c:choose>
																			</tr>
																		</c:forEach>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
												<c:if test="${not empty suspendHistory}">
													<div class="portlet-body">
														<div class="table-responsive scroller">
															<table id="spndTbl"
																class="table table-hover table-bordered ">
																<thead>
																	<tr style="background-color: #f5f3eb;">
																		<th style="color: #32c5d2" width="10%"><b>Suspended</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Suspend
																				Date / Time</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Processed
																				On/User Id</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Case
																				#</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Date
																				Override</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Reduction</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Total
																				Due</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Updated
																				By</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Updated
																				Date</b></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${suspendHistory}" var="suspendList">
																		<c:forEach items="${suspendList}" var="suspend">
																			<tr>
																				<c:choose>
																					<c:when test="${suspend.updatedAt == null}">
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.suspendedCodes.description}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.formattedSuspendDate}" /> / <c:out
																								value="${suspend.suspended_time}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.formattedProcessedOn}" />/<c:out
																								value="${suspend.userId}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.caseSuspend}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.dateOverride}" /></td>
																						<td style="text-transform: uppercase;"><c:choose>
																							<c:when	test="${not empty suspend.reduction}">
																							&#36;<c:out value="${suspend.reduction}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />
																							</c:otherwise>
																						</c:choose></td>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${suspend.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.formattedCreatedAt}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.suspendedCodes.description}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.formattedSuspendDate}" /> / <c:out
																								value="${suspend.suspended_time}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.formattedProcessedOn}" />/<c:out
																								value="${suspend.userId}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.caseSuspend}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.dateOverride}" /></td>
																						<td style="text-transform: uppercase;"><c:choose>
																							<c:when	test="${not empty suspend.reduction}">
																							&#36;<c:out value="${suspend.reduction}" />
																							</c:when>
																							<c:otherwise>
																							&#36;<c:out value="0.00" />
																							</c:otherwise>
																						</c:choose></td>
																						<td style="text-transform: uppercase;">$<c:out
																								value="${suspend.totalDue}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${suspend.formattedUpdatedAt}" /></td>
																					</c:otherwise>
																				</c:choose>
																			</tr>
																		</c:forEach>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
												<c:if test="${not empty corresHistory}">
													<div class="portlet-body">
														<div class="table-responsive scroller">
															<table id="crspTbl"
																class="table table-hover table-bordered ">
																<thead>
																	<tr style="background-color: #f5f3eb;">
																		<th style="color: #32c5d2" width="10%"><b>ID</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Correspondence</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Date</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Time</b></th>
																		<th style="color: #32c5d2" width="10%"><b>User
																				ID</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Sent</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Document
																				Number</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Correspondence
																				Type</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Letter&nbsp;Sent</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Updated
																				By</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Updated
																				Date</b></th>

																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${corresHistory}" var="corresList">
																		<c:forEach items="${corresList}" var="correspond">
																			<tr>
																				<c:choose>
																					<c:when test="${correspond.updatedAt == null}">
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.id}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.correspCode.correspDesc}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.formattedCorresDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.corresp_time}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.corresp_sent}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.documentNumber}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.correspondenceType}" /></td>
																						<c:if test="${correspond.letterSent==true }">
																						<td style="text-transform: uppercase;"><c:out
																								value="Yes" /></td>
																						</c:if>
																						<c:if test="${correspond.letterSent==false }">
																						<td style="text-transform: uppercase;"><c:out
																								value="No" /></td>
																						</c:if>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.formattedCreatedAt}" /></td>

																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.id}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.correspCode.correspDesc}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.formattedCorresDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.corresp_time}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.corresp_sent}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.documentNumber}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.correspondenceType}" /></td>
																						<c:if test="${correspond.letterSent==true }">
																						<td style="text-transform: uppercase;"><c:out
																								value="Yes" /></td>
																						</c:if>
																						<c:if test="${correspond.letterSent==false }">
																						<td style="text-transform: uppercase;"><c:out
																								value="No" /></td>
																						</c:if>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${correspond.formattedUpdatedAt}" /></td>
																					</c:otherwise>
																				</c:choose>
																			</tr>
																		</c:forEach>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
												<c:if test="${not empty noticeHistory}">
													<div class="portlet-body">
														<div class="table-responsive scroller">
															<table id="noticeTbl"
																class="table table-hover table-bordered ">
																<thead>
																	<tr style="background-color: #f5f3eb;">
																		<th style="color: #32c5d2" width="10%"><b>Notice
																				Type</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Sent
																				Date</b></th>
																		<th style="color: #32c5d2" width="10%"><b>Processed
																				Date</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Updated
																				By</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Updated
																				Date</b></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${noticeHistory}" var="noticesList">
																		<c:forEach items="${noticesList}" var="notice">
																			<tr>
																				<c:choose>
																					<c:when test="${notice.updatedAt == null}">
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.noticeType.fullNm}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.formattedSentDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.formattedProcessedDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.createdBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.formattedCreatedAt}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.noticeType.fullNm}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.formattedSentDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.formattedProcessedDate}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.updatedBy}" /></td>
																						<td style="text-transform: uppercase;"><c:out
																								value="${notice.formattedUpdatedAt}" /></td>
																					</c:otherwise>
																				</c:choose>
																			</tr>
																		</c:forEach>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
												<c:if test="${not empty miscHistory}">
													<div class="portlet-body">
														<div class="table-responsive scroller">
															<table id="citationTbl"
																class="table table-hover table-bordered ">
																<thead>
																	<tr style="background-color: #f5f3eb;">
																		<th style="color: #32c5d2" width="80%"><b>Data</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Updated By</b></th>
																		<th style="color: #32c5d2" width="20%"><b>Updated Date</b></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${miscHistory}" var="historyBean">
																		<tr>
																					<td style="text-transform: uppercase;"><c:out
																							value="${historyBean.data}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${historyBean.updatedBy}" /></td>
																					<td style="text-transform: uppercase;"><c:out
																							value="${historyBean.updatedDate}" /></td>																			
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- view all -->
		</div>
	</div>
</div>

<!-- END CONTENT -->
<!-- END CONTAINER -->
<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>

<script>
	$(document)
			.ready(
					function() {
						$('#historyItem').val('${historyItem}').attr(
								"selected", "selected");
						$("#historyItem").change(function() {
							console.log("a");
							var val = $('#historyItem').val();
							console.log(val);
							if (val != "") {
								$('#historySearchForm').submit();
							}
						});
						var historyItemVal = $('#historyItem').val();
						if (historyItemVal === "All") {

							$('#allDetailsTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,
								"columnDefs": [ {
									"targets": [0, 1, 2], 
									"orderable": false,  
									}],
								"order": [[ 3, "desc" ]]
							});
						} else if (historyItemVal === "PlateEntity") {

							$('#pltEntTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,
								"columnDefs": [ {
									"targets": [0, 1, 2,3,4,5,6,7,8], 
									"orderable": false,  
									}],
								"scrolly" : false,								
								"order": [[ 9, "desc" ]]
							});
						} else if (historyItemVal === "Notes") {
							$('#cmntsTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,
								"columnDefs": [ {
									"targets": [0, 1,3], 
									"orderable": false,  
									}],
								"order": [[ 2, "desc" ]]
							});

						} else if (historyItemVal === "Penalty") {
							$('#pnltyTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,
								"columnDefs": [ {
									"targets": [0, 1, 2,3,4,5,6,7,8,9], 
									"orderable": false,  
									}],
								"order": [[ 10, "desc" ]]
							}

							);

						} else if (historyItemVal === "Notices") {
							$('#noticeTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,
								"columnDefs": [ {
									"targets": [0, 1, 2,3], 
									"orderable": false,  
									}],
								"order": [[ 4, "desc" ]]
							});

						} else if (historyItemVal === "Payment") {
							$('#pmntTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,
								"columnDefs": [ {
									"targets": [0, 1, 2,3,4,5,6,7,8], 
									"orderable": false,  
									}],
								"order": [[ 9, "desc" ]]
							});

						} else if (historyItemVal === "Hearing") {
							$('#hearingTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,
								"columnDefs": [ {
									"targets": [0, 1, 2,3,4,5,6,7,8], 
									"orderable": false,  
									}],
								"order": [[ 9, "desc" ]]
							});

						} else if (historyItemVal === "Suspend") {
							$('#spndTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,
								"columnDefs": [ {
									"targets": [0, 1, 2,3,4,5,6,7], 
									"orderable": false,  
									}],
								"order": [[ 8, "desc" ]]
							});

						} else if (historyItemVal === "Correspondence") {
							$('#crspTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,
								"columnDefs": [ {
									"targets": [0, 1, 2,3,4,5,6,7,8], 
									"orderable": false,  
									}],
								"order": [[ 9, "desc" ]]
							});

						}  else if (historyItemVal === "Misc") {
							$('#citationTbl').DataTable({
								"paging" : false,
								"info" : false,
								"searching" : false,
								"orderClasses" : false,
								"autoWidth": false,								
								"columnDefs": [ {
									"targets": [0, 1], 
									"orderable": false,  
									}],
								"order": [[2, "desc" ]]
							});

						} 
						$("#printBtn")
								.click(
										function() {

											var val = $('#historyItem').val();

											console.log(val);
											if (val === "All"
													|| val === "Notes") {
												var divToPrint = $('#printarea')
														.clone();
												divToPrint
														.find(
																'.table tr[data-type="internalComment"]')
														.remove();
												var newWin = window.open('',
														'Print-Window');
												newWin.document.open();
												newWin.document
														.write('<html><body onload="window.print()">'
																+ divToPrint
																		.html()
																+ '</body></html>');
												newWin.document.close();
												setTimeout(function() {
													newWin.close();
												}, 10);
											} else {

												var divToPrint = document
														.getElementById('printarea');

												var newWin = window.open('',
														'Print-Window');

												newWin.document.open();

												newWin.document
														.write('<html><body onload="window.print()">'
																+ divToPrint.innerHTML
																+ '</body></html>');

												newWin.document.close();

												setTimeout(function() {
													newWin.close();
												}, 10);

											}

										});
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