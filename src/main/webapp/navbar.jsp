<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        * {
            text-decoration: none;
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif !important;
        }

        nav {
            background-color: #333;
            color: #fff;
            display: flex;
            align-items: center;
            padding: 20px;
        }

        h2 {
            margin-right: 20px;
        }

        ul {
            list-style-type: none;
            display: flex;
        }

        li {
            margin-right: 20px;
        }

        a {
            color: #fff;
        }

        li a:hover {
            text-decoration: underline;
        }

        button{
            border-radius: 6px;
        }
        header {
            display: flex;
            margin: auto;
            align-items: center;
            justify-content: space-around;
            width: 80%;
        }
        .title{
            display: flex;
        }
        .wrapper{
            display: flex;
        }

    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
		.m-80{
		margin-top:80px !important;
		}
	</style>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#32E0C4">
    <div class="container-fluid my-container-fluid">
        <a class="navbar-brand fw-bold d-lg-none" href="${pageContext.request.contextPath}/admin">Sundara Travels</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <a class="navbar-brand fw-bold d-none d-lg-block" href="${pageContext.request.contextPath}/admin">Home</a>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/routes">Routes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/schedules">Schedules</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/buses">Buses</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/bookings">Bookings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/tickets">Tickets</a>
                </li>
            </ul>
        </div>
          <h1 class="text-3xl font-bold underline">
  </h1>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
