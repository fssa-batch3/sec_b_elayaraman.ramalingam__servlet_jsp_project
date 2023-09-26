<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<h1>Registration Form</h1>
		<form class="col-md-4 needs-validation" action="<%=request.getContextPath()%>/user/register" novalidate id="form"
		  method="post">
		<div class="mb-3">
			<label for="username" class="form-label">Enter your name</label> <input type="text" class="form-control"
				id="username" name="username" aria-describedby="namehelp" required>
			<div id="namehelp" class="form-text">5 - 40 character allowed</div>
		</div>
		<div class="mb-3">
			<label for="phonenumber" class="form-label">Enter your Phone Number</label> <input type="tel" class="form-control"
				id="phonenumber" name="phonenumber" aria-describedby="phonehelp" required>
		</div>
		<div class="mb-3">
			<label for="dob" class="form-label">Enter your Date of Birth</label> <input type="date" class="form-control"
				id="dob" name="dob" aria-describedby="dobhelp" required>
			<div id="dobhelp" class="form-text">Must be 18 years old</div>
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">Enter your Password</label> <input type="password" class="form-control"
				id="password" name="password" aria-describedby="passwordhelp" required>
			<div id="passwordhelp" class="form-text">minimum 6 characters long with a special character</div>
		</div> 
		<div class="mb-3">
		<button id="createButton" type="submit" class="btn btn-primary">
		Create Account</button>
		</div>
	</form>
				<button type="submit" class="btn btn-link" onclick="window.location.href='${ pageContext.request.contextPath}/user/login'">
		Login</button>
	</div>

<script>

</script>
</body>
</html>