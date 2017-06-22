<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- BEGIN CONTAINER -->
<div class="page-container">
	<div class="page-sidebar-wrapper">
		<!-- BEGIN SIDEBAR -->
		<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
		<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
			<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
			<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
			<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<ul class="page-sidebar-menu  page-header-fixed "
				data-keep-expanded="false" data-auto-scroll="true"
				data-slide-speed="200" style="padding-top: 0px">
				<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
				<li class="sidebar-toggler-wrapper hide">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler">
						<span></span>
					</div> <!-- END SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="nav-item  "><a
					href="${pageContext.request.contextPath}/login" class="nav-link ">
						<i class="icon-home"></i> <span class="title">Dashboard</span>
				</a></li>
				<li class="nav-item  "><a
					href="${pageContext.request.contextPath}/citationlist"
					class="nav-link "> <i class="icon-settings"></i> <span
						class="title">Citation Details</span>
				</a></li>
				<li class="nav-item  "><a
					href="${pageContext.request.contextPath}/reports/"
					class="nav-link "> <i class="icon-bar-chart"></i> <span
						class="title">Reports</span>
				</a></li>
				<li class="nav-item  "><a href="index.jsp" class="nav-link ">
						<i class="icon-wallet"></i> <span class="title">Calendar</span>
				</a></li>

				<li class="nav-item "><a
					href="${pageContext.request.contextPath}/exclusion/"
					class="nav-link "> <i class="icon-layers"></i> <span
						class="title">Exclusion List</span>
				</a></li>
			</ul>

		</div>
		<!-- END SIDEBAR -->
	</div>
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<!-- BEGIN CONTENT BODY -->
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->
			<!-- BEGIN PAGE BAR -->
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li><a href="index.jsp">Home</a> <i class="fa fa-circle"></i>
					</li>
					<li><span>Exclusion List</span></li>
				</ul>

			</div>
			<h3 class="page-title">Exclusion Client List</h3>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light portlet-fit bordered">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-settings font-red"></i> <span
									class="caption-subject font-red sbold uppercase">Exclusion
									Clients Info</span>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="row">
									<div class="col-md-6">
										<div class="btn-group">
											<button id="sample_editable_1_new" class="btn green">
												Add New <i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
									<div class="col-md-6">
										<div class="btn-group pull-right">
											<button class="btn green btn-outline dropdown-toggle"
												data-toggle="dropdown">
												Reports <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right">
												<li><a href="javascript:;"> Print </a></li>
												<li><a href="javascript:;"> Save as PDF </a></li>
												<li><a href="javascript:;"> Export to Excel </a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form action="exclusion.action" method="GET">
								<table class="table  table-hover table-bordered"
									id="sample_editable_1">
									<thead>
										<tr>
											<th>Id</th>
											<th>Full Name</th>
											<th>Start Date</th>
											<th>End Date</th>
											<th>Violations Count</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${exclusion}" var="exclusin">
											<tr>


												<td><c:out value="${exclusin.exclusionId}" /></td>
												<td><c:out value="${exclusin.fullName}" /></td>
												<td><c:out value="${exclusin.startDate}" /></td>
												<td><c:out value="${exclusin.endDate}" /></td>
												<td><c:out value="${exclusin.violationsCount}" /></td>
												<td><a class="edit" href="javascript:;"> Edit</a></td>
												<td><a class="delete" href="javascript:;"> Delete</a></td>
											</tr>

										</c:forEach>

									</tbody>
								</table>
							</form>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>
			<!-- END PAGE BAR -->
			<!-- BEGIN PAGE TITLE-->
		</div>
		<!-- END CONTENT BODY -->
	</div>
	<!-- END CONTENT -->

</div>
<!-- END CONTAINER -->
</body>

</html>



