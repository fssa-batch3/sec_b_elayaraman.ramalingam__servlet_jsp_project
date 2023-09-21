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
        }

        body {
            font-family: Arial, sans-serif;
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#32E0C4">
    <div class="container-fluid my-container-fluid">
        <a class="navbar-brand fw-bold d-lg-none" href="${pageContext.request.contextPath}">Sundara Travels</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex align-items-center" id="navbarNav">
            <div class="p-2 flex-grow-1">
                <a class="navbar-brand fw-bold d-none d-lg-block" href="${pageContext.request.contextPath}">Sundara Travels</a>
              </div>  
              <div class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ticket/find">Check Ticket</a>
                </div>
                <div class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/tickets">Login</a>
                </div>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script></body>
</html>
