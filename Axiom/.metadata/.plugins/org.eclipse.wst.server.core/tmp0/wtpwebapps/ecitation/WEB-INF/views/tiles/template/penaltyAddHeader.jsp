
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner ">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<img
				src="<c:url value='/static/assets/layouts/layout/img/logo.png' />"
				alt="logo" class="logo-default" />
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<div class="top-menu">
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->

				<li class="active"><a
					href="${pageContext.request.contextPath}/citationlist"
					class="nav-link "> <span class="title"><spring:message
								code="lbl.topmenu.tab.citation.search" /></span>
				</a></li>
				<li class="nav-item  "><a
					href="${pageContext.request.contextPath}/citationentry"
					class="nav-link "> <span class="title"><spring:message
								code="lbl.topmenu.tab.citation.entry" /></span>
				</a></li>
				<li class="nav-item  "><a
					href="${pageContext.request.contextPath}/reports" class="nav-link ">
						<span class="title"><spring:message
								code="lbl.topmenu.tab.reports" /></span> <span class="selected"></span>
				</a></li>
				<%-- <li class="nav-item  ">
                                    <a href="javascript:void(0)" class="nav-link ">
									<span class="title"><spring:message code="lbl.topmenu.tab.calendar"/></span>
									<span class="selected"></span>
                                    </a>
                                </li> --%>
				<li class="nav-item  "><a
					href="${pageContext.request.contextPath}/uploadrecords"
					class="nav-link "> <span class="title"><spring:message
								code="lbl.topmenu.tab.files" /></span>
				</a> <%--<a href="javascript:void(0)" class="nav-link ">
								<span class="title"><spring:message code="lbl.topmenu.tab.files"/></span>
                             </a>--%></li>
				<li class="dropdown dropdown-user"><a href="javascript:;"
					class="dropdown-toggle" data-toggle="dropdown"
					data-hover="dropdown" data-close-others="true"> <img alt=""
						class="img-circle"
						src="<c:url value='/static/assets/layouts/layout/img/avatar.png ' />" />
						<span class="username username-hide-on-mobile">
							${user.firstName} ${user.lastName} </span> <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-menu-default">
						<li><a href="${pageContext.request.contextPath}/logout">
								<i class="icon-key"></i> Log Out
						</a></li>
					</ul></li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
		</div>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<!-- BEGIN HEADER & CONTENT DIVIDER -->
<div class="clearfix"></div>
<!-- END HEADER & CONTENT DIVIDER -->
