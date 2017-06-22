<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- BEGIN CONTAINER -->
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
	<!-- BEGIN CONTENT BODY -->
	<div class="page-content">
		<!-- BEGIN PAGE HEADER-->
		<div>
			<div class="portlet light portlet-fit bordered">
				<div style="text-align: center;">
					<span style="font-size: 16px;"><span style="font-size: 17px"><b>Name:</b></span>&nbsp;${lastName}
						&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 17px"><b>Violation
								Number:</b></span>&nbsp;${citationId} </span>
				</div>
				<div class="portlet-title">
					<div class="caption">
						<span class="caption-subject font-blue sbold uppercase">Notice
							Details Information</span>

					</div>
					<a href="<c:url value='../notices/${citationId}' />"
						class="btn green btn-sm"
						style="position: static; top: -2px; bottom: 40px; float: right;">Add</a>
				</div>
				<div class="portlet-body">
					<div class="page-bar">
						<table
							class="table  table-bordered table-hover table-checkable order-column"
							id="sample_1">
							<thead>
								<tr>
									<th><label
										class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
											<input type="checkbox" class="group-checkable"
											data-set="#sample_1.checkboxes" /> <span></span>
									</label></th>
									<th>Violation Number#</th>
									<th>Notice Type</th>
									<th>Sent Date</th>
									<th>Processed Date</th>

								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty noticeDetailsList}">
										<tr>
											<td colspan="11" align="center"><b>No results found</b></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${noticeDetailsList}" var="notice">
											<tr class="odd gradeX">
												<td><label
													class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
														<input type="checkbox" class="checkboxes" value="1" /> <span></span>
												</label></td>
												<td><a style="color: blue"
													href="<c:url value='../editnotices/${notice.id}' />"><c:out
															value="${notice.citation.citationId}" /></a></td>
												<td><c:out value="${notice.noticeType.fullNm}" /></td>
												<td><c:out value="${notice.formattedSentDate}" /></td>
												<td><c:out value="${notice.formattedProcessedDate}" /></td>
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
</div>
<!-- END THEME LAYOUT SCRIPTS -->