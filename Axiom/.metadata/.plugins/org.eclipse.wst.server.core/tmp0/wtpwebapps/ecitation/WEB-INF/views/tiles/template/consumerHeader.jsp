
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner ">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="index.jsp"> <img
				src="<c:url value='/static/assets/layouts/layout/img/logo.png' />"
				alt="logo" class="logo-default" />
			</a>
		</div>
	</div>
	<!-- END HEADER INNER -->
	<div class="top-menu">
		<ul class="nav navbar-nav pull-right">
			<!-- BEGIN USER LOGIN DROPDOWN -->
			<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
			<li class="dropdown dropdown-user"><a href="javascript:;"
				class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
				data-close-others="true"> <img alt="" class="img-circle"
					src="<c:url value='/static/assets/layouts/layout/img/avatar.png ' />" />
					<span class="username username-hide-on-mobile"> ${lastName}
				</span> <i class="fa fa-angle-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-default">
					<li><a
						href="${pageContext.request.contextPath}/consumerlogout"> <i
							class="icon-key"></i> Exit
					</a></li>
				</ul></li>
			<!-- END USER LOGIN DROPDOWN -->
		</ul>
	</div>
</div>
<!-- END HEADER -->
<!-- BEGIN HEADER & CONTENT DIVIDER -->
<div class="clearfix"></div>
<!-- END HEADER & CONTENT DIVIDER -->
