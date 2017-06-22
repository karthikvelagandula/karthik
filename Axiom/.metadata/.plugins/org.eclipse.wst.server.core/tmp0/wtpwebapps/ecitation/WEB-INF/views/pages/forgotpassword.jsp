
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
			<h3>
				<b>Metro Admin Login</b>
			</h3>
			<!-- BEGIN FORGOT PASSWORD FORM -->
			<form:form action="${pageContext.request.contextPath}/forgotpassword"
				method="post" modelAttribute="forgotPasswordBean">
				<h3 class="font-green">
					<b>Forgot Password ?</b>
				</h3>
				<%-- <p> Enter your e-mail address below to reset your password. </p>
                            <div class="form-group">
                                <input class="form-control placeholder-no-fix form-group" type="text" autocomplete="off" placeholder="Email" name="email" /> </div>
                            <div class="form-actions">
                                <button onclick="window.location='${pageContext.request.contextPath}/login';" type="button" id="back-btn" class="btn green">Back</button>
                                <button type="submit" class="btn btn-success uppercase pull-right">Submit</button>
                            </div> --%>
				<div class="form-group">
					<form:input class="form-control placeholder-no-fix form-group"
						type="text" autocomplete="off" placeholder="First Name"
						name="firstName" path="firstName" />
					<form:input class="form-control placeholder-no-fix form-group"
						type="text" autocomplete="off" placeholder="Last Name"
						name="lastName" path="lastName" />
					<form:input class="form-control placeholder-no-fix form-group"
						type="text" autocomplete="off" placeholder="User Name"
						name="userName" path="userName" />
					<form:input class="form-control placeholder-no-fix form-group"
						type="password" autocomplete="off" placeholder="Password"
						name="password" path="password" />
					<form:input class="form-control placeholder-no-fix form-group"
						type="password" autocomplete="off" placeholder="Confirm Password"
						name="confirmPassword" path="confirmPassword" />
					<div class="form-actions">
						<button
							onclick="window.location='${pageContext.request.contextPath}/login';"
							type="button" id="back-btn" class="btn green">Back</button>
						<button type="submit" class="btn btn-success uppercase pull-right">Submit</button>
					</div>
				</div>

				<br />
				<br />
				<c:if test="${not empty resultMessage}">
					<div class="alert alert-danger">
						<span>${resultMessage}</span> Invalid Credentials
					</div>
				</c:if>
				<div class="alert alert-danger display-hide">
					<button class="close" data-close="alert"></button>
					<span>Enter any username and password. </span>
				</div>
			</form:form>
			<!-- END FORGOT PASSWORD FORM -->
		</div>
		<div class="copyright">2017 &copy; Axiom xCell Inc.</div>
	</div>
</div>
