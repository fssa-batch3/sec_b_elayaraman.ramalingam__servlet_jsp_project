
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Confirm Bus Deletion</title>
  </head>
  <body>
  <h1>Confirm Deletion</h1>
  <p>Are you sure you want to delete this Bus (ID: ${busId})?</p>
  <form action="${pageContext.request.contextPath}/admin/buses/delete" method="post">
    <input type="hidden" name="busId" value="${busId}">
    <input type="submit" value="Confirm">
    <a href="${pageContext.request.contextPath}/admin/buses">Cancel</a>
  </form>
  </body>
</html>
