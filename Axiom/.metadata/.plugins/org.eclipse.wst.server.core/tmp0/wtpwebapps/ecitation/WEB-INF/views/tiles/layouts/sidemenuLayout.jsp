<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- BEGIN CONTAINER -->
<div class="page-container" id="blockui_citationdetails_data">
	<section id="sidemenu">
		<tiles:insertAttribute name="sidemenu" />
	</section>
	<section id="content">
		<tiles:insertAttribute name="content" />
	</section>
</div>
<!-- END CONTAINER -->
