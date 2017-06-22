

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- <body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white"> -->

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
	<div class="page-content">
		<!-- BEGIN PAGE HEADER-->
		<!-- BEGIN THEME PANEL -->


		<!-- END PAGE BAR -->
		<!-- BEGIN PAGE TITLE-->
		<h3 class="page-title" style="padding-top: 15px;">
			&nbsp; Payment Methods <span
				style="font-size: 16px; margin-left: 220px; white-space: nowrap;"><span
				style="font-size: 18px" class="fa font-blue"><b>Name:</b></span>&nbsp;&nbsp;<b>${lastName}</b>
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 18px"
				class="fa font-blue"><b>CitationId:</b></span> &nbsp;&nbsp;<b>${citationId}
			</b></span>
		</h3>
		<div class="col-md-offset-6 col-md-6">
			<a href="${pageContext.request.contextPath}/consumerdetails"><button
					type="button" class="btn green btn-sm"
					style="width: 70px; float: right; margin-top: -50px;">Back</button></a>
		</div>
		<!-- END PAGE TITLE-->
		<!-- END PAGE HEADER-->

		<c:if test="${not empty errorMessagePayment}">
			<div class="alert alert-info">
				<span>${errorMessagePayment}</span>
			</div>

			<c:choose>
				<c:when test="${empty payedInfo}">
					<tr>
						<td colspan="6" align="center"><b>No Receipt found</b></td>
					</tr>
				</c:when>
				<c:otherwise>
					<div style="margin-left: 300px; width: 50%;">
						<div id="printContentId">
							<table style="font-weight: bold"
								class="table table-bordered table-hover">

								<tbody>
									<tr>
										<td style="background-color: #26A1AB; color: #fff" colspan="2"
											align="center">Payment Acknowledgement</td>
									</tr>

									<tr>
										<td style="width: 50%">Transaction Number</td>
										<td>${payedInfo.transaction.id}</td>
									</tr>
									<tr>
										<td style="width: 50%">Citation Id</td>
										<td>${payedInfo.citation.citationId}</td>
									</tr>
									<tr>
										<td style="width: 50%">Name</td>
										<td>${payedInfo.citation.patron.firstName}&nbsp;${payedInfo.citation.patron.lastName}</td>
									</tr>
									<tr>
										<td style="width: 50%">Payment Amount</td>
										<td>${payedInfo.amount}</td>
									</tr>
									<tr>
										<td style="width: 50%">Payment Type</td>
										<td>${payedInfo.paymentMethod.description}</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<div style="margin-left: 590px;">
						<button class="btn green btn-sm icon-printer"
							onclick="printAcknowledgement('printContentId')">
							<b>Print</b>
						</button>
					</div>

				</c:otherwise>
			</c:choose>
		</c:if>
	</div>
</div>

<script type="text/javascript">

function printAcknowledgement(printContentId) {
     var preContent = "<div style='background-color:#fff'>";
     var postContent = "</div>";
     var bodyContent = document.all.item(printContentId).innerHTML;
     var currBodyCon = document.body.innerHTML;
     document.body.innerHTML = preContent+bodyContent+postContent;
     window.print();
     document.body.innerHTML = currBodyCon;
}

</script>