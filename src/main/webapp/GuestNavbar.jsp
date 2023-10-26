<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
	<style>
		.m-80{
		margin-top:80px !important;
		}
	</style>
</head>
<body>
	<nav class="z-3 fixed-top w-100 navbar navbar-expand-lg "
		style="height: 80px">
		<div class="container-fluid my-container-fluid">
			<a class="navbar-brand fw-bold d-lg-none"
				href="${pageContext.request.contextPath}">Sundara Travels</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mx-auto">
					<a class="navbar-brand fw-bold d-none d-lg-block"
						href="${pageContext.request.contextPath}">Sundara Travels</a>

							<div class="nav-item">
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/ticket/find">Find
										my Ticket</a></li>
							</div>
													<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/ticket/cancel">Cancel
								my Ticket</a></li>

						<c:choose>
							<c:when test="${sessionScope.userId > 0}">
														<div class="nav-item">
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/user/bookings">My Bookings	</a></li>
							</div>
								<div class="nav-item">
									<a class="nav-link"
										href="${pageContext.request.contextPath}/user/profile">Profile</a>
								</div>

							</c:when>
							<c:otherwise>
								<div class="nav-item">
									<a class="nav-link"
										href="${pageContext.request.contextPath}/user/login">Login</a>
								</div>

							</c:otherwise>
						</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
