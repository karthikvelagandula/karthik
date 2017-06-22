<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-sidebar-wrapper">
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
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
				<li class="nav-item  "><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/citationview/${citationId}"
					class="nav-link "> <i class="icon-home"></i> <span
						class="title"><spring:message
								code="lbl.sidemenu.tab.citation.details" /></span>
				</a></li>
				<li class="nav-item  "><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/penalty/${citationId}"
					class="nav-link "> <i class="icon-docs"></i> <span
						class="title"><spring:message
								code="lbl.sidemenu.tab.penalty" /></span>
				</a></li>
				<li class="nav-item  "><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/paymentDetails/${citationId}"
					class="nav-link "> <i class="icon-wallet"></i> <span
						class="title"><spring:message
								code="lbl.sidemenu.tab.Payments" /></span>
				</a></li>
				<li class="nav-item  "><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/noticeDetails/${citationId}"
					class="nav-link "> <i class="icon-bell"></i> <span
						class="title"><spring:message
								code="lbl.sidemenu.tab.Notices" /></span>
				</a></li>
				<li class="nav-item "><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/hearingDetails/${citationId}"
					class="nav-link "> <i class="fa fa-gavel"></i> <span
						class="title"><spring:message
								code="lbl.sidemenu.tab.Hearings" /></span>
				</a></li>
				<li class="nav-item "><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/suspendDetails/${citationId}"
					class="nav-link "> <i class="fa fa-pause"></i> <span
						class="title"><spring:message
								code="lbl.sidemenu.tab.Suspends" /></span>
				</a></li>
				<li class="nav-item "><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/correspondDetails/${citationId}"
					class="nav-link "> <i class="icon-envelope-open"></i> <span
						class="title"><spring:message
								code="lbl.sidemenu.tab.Correspondence" /></span>
				</a></li>
				<li class="nav-item "><a href="#" class="nav-link "> <i
						class="fa fa-hand-pointer-o"></i> <span class="title"><spring:message
								code="lbl.sidemenu.tab.hold" /></span>
				</a></li>
				<li class="nav-item "><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/history/${citationId}"
					class="nav-link "> <i class="fa fa-history"></i> <span
						class="title"><spring:message
								code="lbl.sidemenu.tab.history" /></span>
				</a></li>
				<li class="nav-item "><a onclick="enablePageLoadBar()"
					href="${pageContext.request.contextPath}/attachments/${citationId}"
					class="nav-link "> <i class="fa fa-paperclip"></i> <span
						class="title"><spring:message
								code="lbl.sidemenu.tab.attachments" /></span>
				</a></li>
				<%-- <li class="nav-item "><a onclick="enablePageLoadBar()" 
						href="${pageContext.request.contextPath}/fileupload/${citationId}"
						class="nav-link "> <i class="fa fa-sign-out fa-rotate-270"></i> <span
							class="title"><spring:message
									code="lbl.sidemenu.tab.fileupload" /></span>
					</a></li> --%>
				 <li class="nav-item  "><a  
						href="${pageContext.request.contextPath}/initialReview/${citationId}"
						class="nav-link "> <i class="fa fa-search"></i> <span
							class="title"><spring:message
									code="lbl.sidemenu.tab.review" /></span>
					</a></li> 
				<%-- <li class="nav-item  "><a href="#" class="nav-link "> <i
						class="fa fa-search"></i> <span class="title"><spring:message
								code="lbl.sidemenu.tab.review" /></span>
				</a></li> --%>
				<%-- <li class="nav-item "><a href="#" class="nav-link "> <i
							class="icon-feed"></i> <span class="title"><spring:message
									code="lbl.sidemenu.tab.processing" /></span>
					</a></li> --%>
			</ul>
		</div>
	</div>
	<!-- END SIDEBAR -->
</div>