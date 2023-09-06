<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Route</title>
</head>
<body>
<jsp:include page="navbar.jsp" />
<h1>Create New Route</h1>
<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
<p style="color: red;"><%= errorMessage %></p>
<% } %>
<form action="${pageContext.request.contextPath}/admin/routes/create" method="post">
    From Location: <input type="text" name="fromLocation" required><br>
    To Location: <input type="text" name="toLocation" required><br>
    Base Price: <input type="text" name="basePrice" required><br>
    <input type="submit" value="Create Route">
</form>

</body>
</html>
