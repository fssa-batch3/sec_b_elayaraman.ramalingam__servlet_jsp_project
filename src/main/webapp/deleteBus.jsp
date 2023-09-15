<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Confirm Bus Deletion</title>
  <style>
    body {
      padding: 20px;
      height: 100%;
    }
    .confirmation-container {
      max-width: 400px;
      margin: 0 auto;
      text-align: center;
    }
    .confirmation-message {
      margin-top: 20px;
    }
  </style>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container confirmation-container">
  <h1 class="mt-5">Confirm Deletion</h1>
  <p class="confirmation-message">Are you sure you want to delete this Bus (ID: ${busId})?</p>
  <form action="${pageContext.request.contextPath}/admin/buses/delete" method="post">
    <input type="hidden" name="busId" value="${busId}">
    <button type="submit" class="btn btn-danger">Confirm</button>
    <a href="${pageContext.request.contextPath}/admin/buses" class="btn btn-secondary">Cancel</a>
  </form>
</div>
</body>
</html>
