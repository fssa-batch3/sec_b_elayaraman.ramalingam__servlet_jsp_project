<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<style>
.h{
	height:calc(100vh - 72px) !important;
}
</style>
<body class="h-100 w-100">
	<jsp:include page="GuestNavbar.jsp" />
	<div class="h d-flex flex-column align-items-center justify-content-center ">
	<h1>Login Form</h1>
		<form class="col-md-4 needs-validation" action="<%=request.getContextPath()%>/user/login" novalidate id="form"
		  method="post">
		  		<div class="mb-3">
			<label for="phonenumber" class="form-label">Enter your Phone Number</label> <input type="tel" class="form-control"
				id="phonenumber" name="phonenumber" aria-describedby="phonehelp" required>
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">Enter your Password</label> <input type="password" class="form-control"
				id="password" name="password" aria-describedby="passwordhelp" required>
		</div>	
		<div class="mb-3">
		<button id="createButton" type="submit" class="btn btn-primary">
		Login</button>
		</div>

		</form>
			<button type="submit" class="btn btn-link" onclick="window.location.href='${ pageContext.request.contextPath}/user/register'">
		Register</button>
	</div>

<script>

</script>
</body>
</html>