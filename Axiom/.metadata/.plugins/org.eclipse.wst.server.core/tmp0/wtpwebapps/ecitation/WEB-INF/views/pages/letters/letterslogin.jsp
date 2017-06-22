
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- BEGIN : LOGIN PAGE 5-1 -->
<div class="user-login-5" style="background-color: #364150">
	<div class="row bs-reset">
		<div class="logo">
			<img
				src="<c:url value='/static/assets/layouts/layout/img/logo.png' />"
				alt="" class="logo-default" />
		</div>
		<div class="content">
			<!-- BEGIN LOGIN FORM -->
			<h3>
				<b>Metro Admin Login </b>
			</h3>
			<form:form id="lettersLogin" action="letterslogin" class="login-form"
				method="post" modelAttribute="lettersBean">
				<div class="row">
					<div class="input-icon">
						<i class="fa fa-user"></i>
						<form:input
							class="form-control form-control-solid placeholder-no-fix form-group"
							type="text" autocomplete="off" placeholder="EmpNo"
							name="username" autofocus="username" path="username"
							required="true" />
					</div>
					<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
					<div class="input-icon">
						<i class="fa fa-lock"></i>
						<form:input
							class="form-control form-control-solid placeholder-no-fix form-group"
							type="password" autocomplete="off" placeholder="Password"
							name="password" path="password" required="true"
							onkeypress="submitFormByEnter(event,this)" />
					</div>
				</div>
				<div class="form-actions"
					style="margin-left: 65px; margin-top: 15px;">
					<button type="submit" class="btn green uppercase">Sign In</button>
				</div>
				<br />
				<br />
				<c:if test="${not empty resultMessage}">
					<div class="alert alert-danger">
						<span>${resultMessage}</span>
					</div>
				</c:if>
				<div class="alert alert-danger display-hide">
					<button class="close" data-close="alert"></button>
					<span>Enter any username and password. </span>
				</div>

			</form:form>


		</div>
		<div class="copyright">2017 &copy; Axiom xCell Inc.</div>
	</div>
</div>

<script type="text/javascript">

function submitFormByEnter(e, text){
    var code = (e.keyCode ? e.keyCode : e.which);
    if(code == 13) { //Enter keycode
     document.getElementById("lettersLogin").submit();
    }
}
</script>
