<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="ISO-8859-1">
<title>Sundara Travels | Page Nor found</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body class="h-100 d-flex">
	<div class="d-flex flex-column m-auto h-50 justify-content-center">
	<img src="./assets/images/404.svg" class="h-75" />
	<div class="d-flex justify-content-center " style="width:350px;">
		<button class="btn p-2 btn-primary m-2" onclick='location.href="${pageContext.request.contextPath}"'>Go to Homepage</button>
		<button class="btn p-2 btn-secondary m-2" onclick="location.reload()">Reload this page</button>
	</div>
	</div>
</body>
</html>