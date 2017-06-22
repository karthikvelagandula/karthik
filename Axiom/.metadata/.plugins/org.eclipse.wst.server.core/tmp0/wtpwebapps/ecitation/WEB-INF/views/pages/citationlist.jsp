<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<div class="page-content">
		<br /> <br />
		<div class="page-bar" style="margin: -25px 0px 0;">
			<ul class="page-breadcrumb">
				<li><a style="margin-left: 50px;"
					href="${pageContext.request.contextPath}/citationlist"><spring:message
							code="lbl.home" /></a> <i class="fa fa-circle"></i></li>
				<li><span><spring:message
							code="lbl.topmenu.tab.citation.search" /></span></li>
			</ul>
		</div>
		<!-- END PAGE BAR -->
		<!--<div class="btn green" style="width:100px;float:right;margin-bottom:20px;"><a href="getCitationId.action?citationId=${citationObj.citationId}" style="text-decoration:none;color:#fff;"><i class="fa fa-plus">&nbsp;&nbsp;<b>Calendar</b></i></a></div>-->


		<!-- END PAGE HEADER-->
		<div class="row">
			<div class="col-md-2">
				<!-- BEGIN Portlet PORTLET-->
				<div class="portlet box green scroller"
					style="margin: 10px 10px 0; border-top-left-radius: 5px;">
					<div class="portlet-title">
						<div class="caption">Recent Items</div>
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height: 234px;">
							<c:forEach items="${recentSearches}" var="search">
								<c:choose>
									<c:when test="${search.type== 'Zip'}">
										<a style="color: blue" href='#'
											onclick='searchRecentItems(this);'
											data-item='{"type":"${search.type}","ticketNumber":"${search.ticketNumber}","firstName":"${search.firstName}","lastName":"${search.lastName}"}'>
											<c:out value="${search.ticketNumber }" /> <c:if
												test="${not empty search.firstName }"> & <c:out
													value="${search.firstName }" />
											</c:if> <c:if test="${not empty search.lastName }"> & <c:out
													value="${search.lastName }" />
											</c:if><br>
										</a>
									</c:when>
									<c:when test="${search.type== 'Number'}">
										<a style="color: blue" href='#'
											onclick='searchRecentItems(this);'
											data-item='{"type":"${search.type}","ticketNumber":"${search.ticketNumber}","vinNUmber":"${search.vinNUmber}"}'>
											<c:out value="${search.ticketNumber }" /> <c:if
												test="${not empty search.vinNUmber }"> & <c:out
													value="${search.vinNUmber }" />
											</c:if> <br>
										</a>
									</c:when>
									<c:when test="${search.type== 'VIN'}">
										<a style="color: blue" href='#'
											onclick='searchRecentItems(this);'
											data-item='{"type":"${search.type}","ticketNumber":"${search.ticketNumber}"}'>
											<c:out value="${search.ticketNumber }" /><br>
										</a>
									</c:when>
									<c:when test="${search.type== 'Name'}">
										<a style="color: blue" href='#'
											onclick='searchRecentItems(this);'
											data-item='{"type":"${search.type}","ticketNumber":"${search.ticketNumber}"}'>
											<c:out value="${search.ticketNumber }" /><br>
										</a>
									</c:when>
									<c:when test="${search.type== 'TAPNumber'}">
										<a style="color: blue" href='#'
											onclick='searchRecentItems(this);'
											data-item='{"type":"${search.type}","ticketNumber":"${search.ticketNumber}"}'>
											<c:out value="${search.ticketNumber }" /><br>
										</a>
									</c:when>
									<c:when
										test="${search.type== 'Transit' || search.type== 'Parking'}">
										<a style="color: blue" href='#'
											onclick='searchRecentItems(this);'
											data-item='{"type":"${search.type}","ticketNumber":"${search.ticketNumber}"}'>
											<c:out value="${search.ticketNumber }" /><br>
										</a>
									</c:when>
									<c:when test="${search.type== 'All'}">
										<a style="color: blue" href='#'
											onclick='searchRecentItems(this);'
											data-item='{"type":"${search.type}","ticketNumber":"${search.ticketNumber}"}'>
											<c:out value="${search.ticketNumber }" /><br>
										</a>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<!-- BEGIN Portlet PORTLET-->
				<div class="portlet">

					<div class="portlet-body">
						<div class="row">
							<div class="col-md-12">
								<div class="portlet-body form">
									<!-- BEGIN  SEARCH FORM-->
									<form:form id="citationSearchForm"
										action="${pageContext.request.contextPath}/citationlist/1"
										modelAttribute="citationSearchForm" method="post"
										autocomplete="on">
										<div class="form-body">
											<div class="row">
												<div class="col-md-5">
													<div class="form-group">
														<div class="col-md-4">
															<form:input type="text" class="searchText"
																path="ticketNumber" placeholder="Search..."
																value="${citationObj.type}" name="searchText"
																id='searchText'></form:input>
															<span class="help-block">&nbsp;</span>
														</div>
													</div>
												</div>
												<!--/span-->
												<div class="col-md-5">
													<div class="form-group">
														<label class="control-label label-sm font-blue col-md-3">Search&nbsp;Type</label>
														<div class="col-md-4">
															<form:select id="searchType" name="searchType"
																path="type">
																<option value="Parking">Parking Violation</option>
																<option value="Transit">Transit Violation</option>
																<option value="Name">Name</option>
																<option value="Zip">Zip Code</option>
																<option value="Number">State Number Plate</option>
																<option value="VIN">VIN Number</option>
																<option value="TAPNumber">TAP Number</option>
																<option value="All">All</option>
															</form:select>
															<span class="help-block">&nbsp;</span>
														</div>
													</div>
												</div>
												<!--/span-->
												<div class="col-md-1">
													<div class="btn-group">
														<button id="search" onclick="enablePageLoadBar()"
															type="submit" class="btn green btn-sm">Search</button>
													</div>
												</div>
											</div>
											<!--/row-->
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
											<div class="row" id="Namerow" style="display: none">
												<div class="col-md-5">
													<div class="form-group">
														<label class="control-label label-sm col-md-3"
															id="firstNameLabel">First Name</label>
														<div class="col-md-5">
															<form:input type="text" class="form-control input-sm"
																path="firstName" placeholder=""
																value="${citationObj.firstName}" name="firstName"
																id="firstName"></form:input>
															<span class="help-block">&nbsp;</span>
														</div>
													</div>
												</div>
												<div class="col-md-5">
													<div class="form-group">
														<label class="control-label label-sm col-md-3"
															id="lastNameLabel">Last Name</label>
														<div class="col-md-5">
															<form:input type="text" class="form-control input-sm"
																path="lastName" placeholder=""
																value="${citationObj.lastName}" name="lastName"
																id="lastName"></form:input>
															<span class="help-block">&nbsp;</span>
														</div>
													</div>
												</div>
											</div>
											<div class="row" id="VINrow" style="display: none">
												<div class="col-md-5">
													<div class="form-group">
														<label class="control-label label-sm col-md-3"
															id="firstNameLabel">VIN Number</label>
														<div class="col-md-5">
															<form:input type="text" class="form-control input-sm"
																path="vinNUmber" placeholder=""
																value="${citationObj.vinNUmber}" name="vinNUmber"
																maxlength="17"></form:input>
															<span class="help-block">&nbsp;</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form:form>
									</input> <span class="alert-danger" id="nameError"></span> <span
										class="help-block">&nbsp;</span>
									<c:if test="${not empty successMessage}">
										<div class="alert alert-info">
											<span>${successMessage}</span>
										</div>
									</c:if>
									<!-- To be un commented in phase II -->
									<!--<c:if test="${fn:length(citationList) gt 1}">
										<div class="col-md-2 pull-right">
											<div class="btn-group">
												<input type="hidden" id="list" name="list" /> <a
													style="text-decoration: none; color: #fff;"
													onclick='clickEvent();'><div class="btn green btn-sm"
														style="width: 66px; margin-bottom: 20px;">Merge</div></a>
											</div>
										</div>
									</c:if>-->
									<!-- END SEARCH FORM-->
									<c:if test="${not empty citationListView}">
										<div class="row">
											<div class="col-md-12">
												<!-- BEGIN EXAMPLE TABLE PORTLET-->
												<div class="portlet light portlet-fit bordered">
													<div class="portlet-title">
														<div class="caption">
															<span class="caption-subject font-blue sbold uppercase">Violation
																List</span>
														</div>
													</div>
													<div class="portlet-body">
														<%-- <c:if test="${empty citationList}">
										<div class="table-toolbar">
											<div class="row">
												<div class="col-md-6">
													<div class="btn-group">
														<form>
															<button id="sample_editable_1_new"
																formaction="citationentry" class="btn green btn-sm">
																Add New <i class="fa fa-plus"></i>
															</button>
														</form>
													</div>
												</div>
											</div>
										</div>
										</c:if> --%>
														<table class="table  table-hover table-bordered table-sm"
															id="sample_editable_1">
															<thead>
																<tr>
																	<th></th>
																	<th>Violation Number</th>
																	<th>Status / Issued On</th>
																	<th>Name</th>
																	<th>Address</th>
																	<th>Violation Code & Description</th>
																	<th>Violation&nbsp;Location</th>
																	<th>Fine&nbsp;Amt</th>
																	<th>Penalties</th>
																	<th>Total&nbsp;Due</th>
																	<!-- To be un commented in phase II -->

																	<!--<th><a style="color: #32c5d2" data-toggle="modal"
																		href="#searchModal"><b>Search More <c:out
																					value="" /></b></a></th> -->
																</tr>
															</thead>
															<tbody>
																<c:choose>
																	<c:when test="${empty citationList}">
																		<tr>
																			<td colspan="6" align="center"><b>No results
																					found</b></td>
																		</tr>
																	</c:when>
																	<c:otherwise>
																		<c:forEach items="${citationList}" var="citation">
																			<tr>
																				<td><label
																					class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
																						<input type="checkbox" id="checkboxid"
																						class="checkboxes" value="${citation.citationId}"
																						onclick="checkBoxselect(this)" /> <span></span>
																				</label></td>
																				<td><c:choose>
																						<c:when
																							test="${ fn:length(citationList) > 1 && citation.citationId == citationSearchForm.ticketNumber}">
																							<b><a onclick="enablePageLoadBar()"
																								style="color: red"
																								href="<c:url value='../citationview/${citation.citationId}' />">
																									<c:out value="${citation.citationId}" />
																							</a></b>
																						</c:when>
																						<c:otherwise>
																							<b><a onclick="enablePageLoadBar()"
																								style="color: #32c5d2"
																								href="<c:url value='../citationview/${citation.citationId}' />">
																									<c:out value="${citation.citationId}" />
																							</a></b>
																						</c:otherwise>
																					</c:choose> <!-- 		<a href=""> <img
																		border="0" alt="Documents" src=<c:url value='/static/img/preview.png' />
																		width="25" height="25">
																</a> --></td>
																				<td><c:choose>
																					<c:when test="${citation.status == 'OVERPAID'}">
																							<b><c:out value="CLOSED - OVERPAID" /></b>
																						</c:when>
																						<c:when test="${citation.status == 'VIOD'}">
																							<b><c:out value="CLOSED - VOID" /></b>
																						</c:when>
																						<c:otherwise>
																							<b><c:out value="${citation.status}" /></b>
																						</c:otherwise>
																					</c:choose> / <c:out value="${citation.dateOfViolation}" /></td>
																				<c:choose>
																					<c:when
																						test="${citation.citationType == 'Transit' }">
																						<td><c:out
																								value="${citation.patron.firstName}" /> <c:out
																								value="${citation.patron.lastName}" /></td>
																						<td><c:out
																								value="${citation.patron.address.formattedAddress}" /></td>
																					</c:when>
																					<c:otherwise>
																						<td><c:out
																								value="${citation.patron.firstName}" /> <c:out
																								value="${citation.patron.lastName}" /></td>
																						<td><c:out
																								value="${citation.patron.address.formattedAddress}" /></td>
																					</c:otherwise>
																				</c:choose>
																				<td><c:out
																						value="${citation.violationCode.code}" />/<c:out
																						value="${citation.violationCode.description}" />
																				</td>
																				<td><c:out value="${citation.location}" /></td>
																				<!--<td><a style="color:#32c5d2" data-toggle="modal" href="#myModal"><b>$<c:out
																					value="${citation.totalDue}" /></b></a></td>-->
																				<td><c:out value="${citation.penaltyAmt}" /></td>
																				<c:choose>
																					<c:when
																						test="${citation.totalPenaltyAmount == '0' }">
																						<td>$<c:out value="0.00" /></td>
																					</c:when>
																					<c:otherwise>
																						<td>$<c:out
																								value="${citation.totalPenaltyAmount}" /></td>
																					</c:otherwise>
																				</c:choose>
																				<td>$<c:out value="${citation.totalDue}" /></td>
																				<c:if
																					test="${citation.status!='PAID' && citation.status!='CLOSED' && citation.status!='VIOD' && citation.status!='OVERPAID' && citation.totalDue>0.00}">
																					<td><b><a style="color: #32c5d2"
																							href="<c:url value='/payment/${citation.citationId}' />">Pay</a></b>
																					</td>
																				</c:if>
																			</tr>
																		</c:forEach>
																	</c:otherwise>
																</c:choose>
															</tbody>
														</table>
													</div>
													<div>
														<c:if test="${not empty pageHolder}">
															<ul class="pagination pagination-sm">
																<c:if test="${pageno > 1}">
																	<li><a href="javascript:;"
																		onclick="searchPage('1')">&laquo;</a></li>
																</c:if>
																<c:if test="${pageno != 1}">
																	<li><a href="javascript:;"
																		onclick="searchPage('${pageno-1}')">Previous</a></li>
																</c:if>
																<c:forEach begin="${pageHolder.startPage}"
																	end="${pageHolder.endPage}" var="i">
																	<c:if test="${pageHolder.totalPages gt 1}">
																		<c:choose>
																			<c:when test="${pageno eq i}">
																				<li class="active"><a href="#"><c:out
																							value="${i}" /></a>
																				<li>
																			</c:when>
																			<c:otherwise>
																				<li><a href="javascript:;"
																					onclick="searchPage('${i}')"> <c:out
																							value="${i}" />
																				</a></li>
																			</c:otherwise>
																		</c:choose>
																	</c:if>
																</c:forEach>
																<c:if test="${pageno lt pageHolder.totalPages}">
																	<li><a href="javascript:;"
																		onclick="searchPage('${pageno+1}')">Next</a></li>
																</c:if>
																<c:if test="${pageno lt pageHolder.totalPages}">
																	<li><a href="javascript:;"
																		onclick="searchPage('${pageHolder.totalPages}')">&raquo;</a></li>
																</c:if>
															</ul>
														</c:if>
													</div>
												</div>
												<!-- END EXAMPLE TABLE PORTLET-->
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<!-- END Portlet PORTLET-->
				</div>
			</div>
		</div>
	</div>
	<!-- END CONTENT BODY -->
	<!-- END CONTENT -->
	<!-- END CONTAINER -->
	<!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<a href="#" class="close" data-dismiss="modal">&times;</a>
					<h4 class="modal-title" id="myModalLabel">
						<i class="text-muted fa fa-university"></i>Payment
					</h4>
				</div>
				<div class="modal-body">

					<table class="pull-left col-md-8 ">
						<tbody>
							<tr>
								<td class="h6"><strong>Citation Number</strong></td>
								<td></td>
								<td class="h5">02051</td>
							</tr>

							<tr>
								<td class="h6"><strong>Amount/Payment Date</strong></td>
								<td></td>
								<td class="h5">descrição do produto</td>
							</tr>

							<tr>
								<td class="h6"><strong>Type/Method</strong></td>
								<td></td>
								<td class="h5">Marca do produto</td>
							</tr>

							<tr>
								<td class="h6"><strong>Account</strong></td>
								<td></td>
								<td class="h5">0230316</td>
							</tr>

							<tr>
								<td class="h6"><strong>Processed On/User Id</strong></td>
								<td></td>
								<td class="h5">032165</td>
							</tr>

							<tr>
								<td class="h6"><strong>IPP</strong></td>
								<td></td>
								<td class="h5">0321649843</td>
							</tr>

							<tr>
								<td class="h6"><strong>Overpaid</strong></td>
								<td></td>
								<td class="h5">50</td>
							</tr>

						</tbody>
					</table>
					<div class="modal-footer">
						<div class="text-right pull-right col-md-3">
							Total Due: <br /> <span class="h3 text-muted"><strong>$39.00</strong></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- fim Modal-->
	<!-- Start search modal -->
	<div class="modal" id="searchModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<a href="#" class="close" data-dismiss="modal">&times;</a>
					<h4 class="modal-title" id="myModalLabel">
						<i class="text-muted fa fa-university"></i>Violation Search
					</h4>
				</div>
				<div class="modal-body">
					<div class="portlet">
						<div class="portlet-body">
							<div class="row">
								<div class="col-md-12">
									<div class="portlet-body form">
										<!-- BEGIN  SEARCH FORM-->
										<form:form id="citationSearchFormNew"
											action="citationlistmodal"
											modelAttribute="citationSearchForm" method="post"
											autocomplete="on">
											<div class="form-body">
												<div class="row">
													<div class="col-md-8">
														<div class="form-group">
															<div class="col-md-3">
																<form:input type="text" class="searchText"
																	path="ticketNumber" placeholder="Search..." value=" "
																	name="searchText1" id='searchText1'></form:input>
																<span class="help-block">&nbsp;</span>
															</div>
														</div>
													</div>
													<!--/span-->
													<div class="col-md-8">
														<div class="form-group">
															<label class="control-label label-sm col-md-4">Search
																Type</label>
															<div class="col-md-4">
																<form:select id="searchType1" name="searchType1"
																	path="type">
																	<option value="Parking">Parking Citation</option>
																	<option value="Transit">Transit Citation</option>
																	<option value="Name">Name</option>
																	<option value="Zip">Zip Code</option>
																	<option value="Number">State Number Plate</option>
																	<option value="VIN">VIN Number</option>
																	<option value="TAPNumber">TAP Number</option>
																	<option value="All">All</option>
																</form:select>
																<span class="help-block">&nbsp;</span>
															</div>
														</div>
													</div>
													<!--/span-->
													<div class="col-md-1">
														<div class="btn-group">
															<button id="search" onclick="enablePageLoadBar()"
																type="submit" class="btn green btn-sm">Search</button>
														</div>
													</div>
												</div>
												<!--/row-->
												<div class="row" id="Namerow1" style="display: none">
													<div class="col-md-10">
														<div class="form-group">
															<label class="control-label label-sm col-md-4"
																id="firstNameLabel">First Name</label>
															<div class="col-md-8">
																<form:input type="text" class="form-control input-sm"
																	path="firstName" placeholder=""
																	value="${citationObj.firstName}" name="firstName"
																	id="firstName"></form:input>
																<span class="help-block">&nbsp;</span>
															</div>
														</div>
													</div>
													<div class="col-md-10">
														<div class="form-group">
															<label class="control-label label-sm col-md-4"
																id="lastNameLabel">Last Name</label>
															<div class="col-md-8">
																<form:input type="text" class="form-control input-sm"
																	path="lastName" placeholder=""
																	value="${citationObj.lastName}" name="lastName"
																	id="lastName"></form:input>
																<span class="help-block">&nbsp;</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row" id="VINrow1" style="display: none">
													<div class="col-md-10">
														<div class="form-group">
															<label class="control-label label-sm col-md-4"
																id="firstNameLabel">VIN Number</label>
															<div class="col-md-8">
																<form:input type="text" class="form-control input-sm"
																	path="vinNUmber" placeholder=""
																	value="${citationObj.vinNUmber}" name="vinNUmber"
																	maxlength="17"></form:input>
																<span class="help-block">&nbsp;</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</form:form>
										<!-- END SEARCH FORM-->
									</div>
									<!-- END EXAMPLE TABLE PORTLET-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END Portlet PORTLET-->
		</div>
		<div class="modal-footer">
			<div class="text-right pull-right col-md-12"></div>
		</div>
	</div>
</div>
<!--  -->
<script
	src="<c:url value='/static/assets/global/plugins/jquery.min.js' />"
	type="text/javascript"></script>
<script>
	function searchRecentItems(obj) {
		enablePageLoadBar();
		var type = $(obj).data('item').type;
		console.log(type);
		var ticketNumber = $(obj).data('item').ticketNumber
		console.log(ticketNumber);
		console.log("searchRecentItems");
		$('#searchType').val(type).attr("selected", "selected");
		if (type == 'Zip') {
			var firstName = $(obj).data('item').firstName
			console.log(firstName);
			var lastName = $(obj).data('item').lastName
			console.log(lastName);
			$('#firstName').val(firstName);
			$('#lastName').val(lastName);
		} else {
			$('#firstName').val('');
			$('#lastName').val('');
		}
		$('#searchText').val(ticketNumber);
		$('#citationSearchForm').submit();
	}
	function searchPage(pageIndex) {
		enablePageLoadBar();
		var action = $('#citationSearchForm').attr("action");
		action = '<c:out value="${pageContext.request.contextPath}"/>'
				+ '/citationlist/' + pageIndex
		$('#citationSearchForm').attr("action", action).submit();
	}
	$(document)
			.ready(
					function() {
						$('#firstName').val('');
						$('#lastName').val('');
						var val = $('#searchText').val();
						if (val.startsWith("T") === true) {
							$("#searchType").val("Transit");
							document.getElementById("VINrow").style.display = 'none';
							document.getElementById("Namerow").style.display = 'none';
						} else if (val.startsWith("P") === true) {
							$("#searchType").val("Parking");
							document.getElementById("VINrow").style.display = 'none';
							document.getElementById("Namerow").style.display = 'none';
						} else if (val.length <= 6 && /^\d+$/.test(val)) {
							$("#searchType").val("Zip");
							document.getElementById("VINrow").style.display = 'none';
							document.getElementById("Namerow").style.display = 'block';
						} else if (/[A-Z]{2}\d{1}/i.test(val)) {
							$("#searchType").val("Number");
							document.getElementById("VINrow").style.display = 'block';
							document.getElementById("Namerow").style.display = 'none';
						} else if (val.length > 9) {
							$("#searchType").val("VIN");
							document.getElementById("VINrow").style.display = 'none';
							document.getElementById("Namerow").style.display = 'none';
						} else if (/[A-Z]/i.test(val)) {
							$("#searchType").val("Name");
							document.getElementById("VINrow").style.display = 'none';
							document.getElementById("Namerow").style.display = 'none';
						}
						$('#searchType').val('${citationSearchForm.type}')
								.attr("selected", "selected");
						$("#searchType")
								.change(
										function() {
											var val = $('#searchType').val();
											if (val == "Zip") {
												document
														.getElementById("VINrow").style.display = 'none';
												document
														.getElementById("Namerow").style.display = 'block';
											} else if (val == "Number") {
												document
														.getElementById("VINrow").style.display = 'block';
												document
														.getElementById("Namerow").style.display = 'none';
											} else {
												document
														.getElementById("VINrow").style.display = 'none';
												document
														.getElementById("Namerow").style.display = 'none';
											}
										});
						$('#searchText')
								.keyup(
										function() {
											var val = $(this).val();
											if (val.length == 1) {
												var isnum = /^\d+$/.test(val
														.charAt(0));
												var res = val.toUpperCase();
												document
														.getElementById("searchText").value = res;
											}
											if ($(this).val().startsWith("T") === true) {
												$("#searchType").val("Transit");
												document
														.getElementById("VINrow").style.display = 'none';
												document
														.getElementById("Namerow").style.display = 'none';
											} else if ($(this).val()
													.startsWith("P") === true) {
												$("#searchType").val("Parking");
												document
														.getElementById("VINrow").style.display = 'none';
												document
														.getElementById("Namerow").style.display = 'none';
											} else if ($(this).val().length <= 6
													&& /^\d+$/.test($(this)
															.val())) {
												$("#searchType").val("Zip");
												document
														.getElementById("VINrow").style.display = 'none';
												document
														.getElementById("Namerow").style.display = 'block';
											} else if (/[A-Z]{2}\d{1}/i.test($(
													this).val())) {
												$("#searchType").val("Number");
												document
														.getElementById("VINrow").style.display = 'block';
												document
														.getElementById("Namerow").style.display = 'none';
											} else if ($(this).val().length > 9) {
												$("#searchType").val("VIN");
												document
														.getElementById("VINrow").style.display = 'none';
												document
														.getElementById("Namerow").style.display = 'none';
											} else if (/[A-Z]/i.test($(this)
													.val())) {
												$("#searchType").val("Name");
												document
														.getElementById("VINrow").style.display = 'none';
												document
														.getElementById("Namerow").style.display = 'none';
											}
										});
						var val = $('#searchText1').val();
						if (val.startsWith("T") === true) {
							$("#searchType1").val("Transit");
							document.getElementById("VINrow1").style.display = 'none';
							document.getElementById("Namerow1").style.display = 'none';
						} else if (val.startsWith("P") === true) {
							$("#searchType1").val("Parking");
							document.getElementById("VINrow1").style.display = 'none';
							document.getElementById("Namerow1").style.display = 'none';
						} else if (val.length <= 6 && /^\d+$/.test(val)) {
							$("#searchType1").val("Zip");
							document.getElementById("VINrow1").style.display = 'none';
							document.getElementById("Namerow1").style.display = 'block';
						} else if (/[A-Z]{2}\d{1}/i.test(val)) {
							$("#searchType1").val("Number");
							document.getElementById("VINrow1").style.display = 'block';
							document.getElementById("Namerow1").style.display = 'none';
						} else if (val.length > 9) {
							$("#searchType1").val("VIN");
							document.getElementById("VINrow1").style.display = 'none';
							document.getElementById("Namerow1").style.display = 'none';
						} else if (/[A-Z]/i.test(val)) {
							$("#searchType1").val("Name");
							document.getElementById("VINrow1").style.display = 'none';
							document.getElementById("Namerow1").style.display = 'none';
						}

						$("#searchType1")
								.change(
										function() {
											var val = $('#searchType1').val();
											if (val == "Zip") {
												document
														.getElementById("VINrow1").style.display = 'none';
												document
														.getElementById("Namerow1").style.display = 'block';
											} else if (val == "Number") {
												document
														.getElementById("VINrow1").style.display = 'block';
												document
														.getElementById("Namerow1").style.display = 'none';
											} else {
												document
														.getElementById("VINrow1").style.display = 'none';
												document
														.getElementById("Namerow1").style.display = 'none';
											}
										});
						$('#searchText1')
								.keyup(
										function() {
											var val = $(this).val();
											if (val.length == 1) {
												var isnum = /^\d+$/.test(val
														.charAt(0));
												var res = val.toUpperCase();
												document
														.getElementById("searchText1").value = res;
											}
											if ($(this).val().startsWith("T") === true) {
												$("#searchType1")
														.val("Transit");
												document
														.getElementById("VINrow1").style.display = 'none';
												document
														.getElementById("Namerow1").style.display = 'none';
											} else if ($(this).val()
													.startsWith("P") === true) {
												$("#searchType1")
														.val("Parking");
												document
														.getElementById("VINrow1").style.display = 'none';
												document
														.getElementById("Namerow1").style.display = 'none';
											} else if ($(this).val().length <= 6
													&& /^\d+$/.test($(this)
															.val())) {
												$("#searchType1").val("Zip");
												document
														.getElementById("VINrow1").style.display = 'none';
												document
														.getElementById("Namerow1").style.display = 'block';
											} else if (/[A-Z]{2}\d{1}/i.test($(
													this).val())) {
												$("#searchType1").val("Number");
												document
														.getElementById("VINrow1").style.display = 'block';
												document
														.getElementById("Namerow1").style.display = 'none';
											} else if ($(this).val().length > 9) {
												$("#searchType1").val("VIN");
												document
														.getElementById("VINrow1").style.display = 'none';
												document
														.getElementById("Namerow1").style.display = 'none';
											} else if (/[A-Z]/i.test($(this)
													.val())) {
												$("#searchType1").val("Name");
												document
														.getElementById("VINrow1").style.display = 'none';
												document
														.getElementById("Namerow1").style.display = 'none';
											}
										});
					});

	function checkBoxselect(el) {
		var checked = el.checked;
		var val = document.getElementById("list").value;
		if (checked) {
			if (val.length > 0) {
				chklist = val + "," + el.value;
			} else {
				chklist = el.value;
			}
		} else {
			if (chklist.length > 1) {
				chklist = chklist.replace(el.value, "");
			}
			if (chklist.length == 1) {
				chklist = chklist.replace(el.value, "");
			}
		}
		chklist = chklist.replace(",,", ",");
		document.getElementById("list").value = chklist;
	}
	function clickEvent() {
		ckbox = document.getElementsByClassName("checkboxes");
		count = 0;
		for (var i = 0; i < ckbox.length; i++) {
			element = ckbox[i];
			if (element.checked) {
				count++;
			}
		}
		if (count > 1) {
			document.getElementById('nameError').innerHTML = '';
			window.location.href = "${pageContext.request.contextPath}/citationlistmerge/"
					+ document.getElementById("list").value;
		} else {
			document.getElementById('nameError').innerHTML = 'Select more than one citation to merge the citations.';
		}
	}
	$(window).load(function() {
		$("#spinner").fadeOut();
	})
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
	position: absolute;
	top: 75px;
	left: 380px;
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