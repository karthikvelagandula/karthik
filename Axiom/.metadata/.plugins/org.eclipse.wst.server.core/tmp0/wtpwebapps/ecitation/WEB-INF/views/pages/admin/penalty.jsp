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
						<span class="caption-subject font-blue sbold uppercase">Penalty
							Details Information</span>
					</div>

				</div>
				<div class="portlet-body">
					<div class="page-bar">
						<table
							class="table  table-bordered table-hover table-checkable order-column"
							id="sample_1">
							<thead>
								<tr style="font-size: 11px;">
									<th><label
										class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
											<input type="checkbox" class="group-checkable"
											data-set="#sample_1.checkboxes" /> <span></span>
									</label></th>
									<th>Violation Number#</th>
									<th>Fine Amount</th>
									<th>Penalty 1<b>&nbsp;/</b><br />Date
									</th>
									<th>Penalty 2<b>&nbsp;/</b><br />Date
									</th>
									<th>Penalty 3<b>&nbsp;/</b><br />Date
									</th>
									<th>Penalty 4<b>&nbsp;/</b><br />Date
									</th>
									<th>Penalty 5<b>&nbsp;/</b><br />Date
									</th>
									<th>Total Paid</th>
									<th>Reduced</th>
									<th>Total Due/Over
									Paid</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty penalty}">
										<tr>
											<td colspan="11" align="center"><b>No results found</b></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr class="odd gradeX">
											<td><label
												class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
													<input type="checkbox" class="checkboxes" value="1" /> <span></span>
											</label></td>
											<td><a style="color: blue"
												href="${pageContext.request.contextPath}/penaltydetailsEdit/${penalty.id}">${penalty.citation.citationId}</a></td>
											<td>${penalty.citation.penaltyAmt}</td>
											<c:choose>
												<c:when test="${not empty penalty.penaltyCode.penalty1}">
													<td>&#36;${penalty.penaltyCode.penalty1}<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty1}</td>
												</c:when>
												<c:otherwise>
													<td>&#36;0.00<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty1}</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty penalty.penaltyCode.penalty2}">
													<td>&#36;${penalty.penaltyCode.penalty2}<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty2}</td>
												</c:when>
												<c:otherwise>
													<td>&#36;0.00<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty2}</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty penalty.penaltyCode.penalty3}">
													<td>&#36;${penalty.penaltyCode.penalty3}<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty3}</td>
												</c:when>
												<c:otherwise>
													<td>&#36;0.00<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty3}</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty penalty.penaltyCode.penalty4}">
													<td>&#36;${penalty.penaltyCode.penalty4}<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty4}</td>
												</c:when>
												<c:otherwise>
													<td>&#36;0.00<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty4}</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty penalty.penaltyCode.penalty5}">
													<td>&#36;${penalty.penaltyCode.penalty5}<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty5}</td>
												</c:when>
												<c:otherwise>
													<td>&#36;0.00<b>&nbsp;/</b><br />${penalty.penaltyCode.formattedpenalty5}</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty penalty.totalPaidAmount}">
													<td>&#36;${penalty.totalPaidAmount}</td>
												</c:when>
												<c:otherwise>
													<td>&#36;0.00</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${not empty penalty.reducedAmount}">
													<td>&#36;${penalty.reducedAmount}</td>
												</c:when>
												<c:otherwise>
													<td>&#36;0.00</td>
												</c:otherwise>
											</c:choose>
											<td>&#36;${penalty.citation.totalDue}</td>
										</tr>

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