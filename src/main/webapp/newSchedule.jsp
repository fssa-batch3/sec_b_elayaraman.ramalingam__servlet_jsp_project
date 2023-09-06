<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Schedule</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h1>Create New Schedule</h1>
<form action="${pageContext.request.contextPath}/admin/schedules/create" method="post">
    <label for="monday">Monday:</label>
    <input type="checkbox" name="monday" id="monday" value="true"><br>

    <label for="tuesday">Tuesday:</label>
    <input type="checkbox" name="tuesday" id="tuesday" value="true"><br>

    <label for="wednesday">Wednesday:</label>
    <input type="checkbox" name="wednesday" id="wednesday" value="true"><br>

    <label for="thursday">Thursday:</label>
    <input type="checkbox" name="thursday" id="thursday" value="true"><br>

    <label for="friday">Friday:</label>
    <input type="checkbox" name="friday" id="friday" value="true"><br>

    <label for="saturday">Saturday:</label>
    <input type="checkbox" name="saturday" id="saturday" value="true"><br>

    <label for="sunday">Sunday:</label>
    <input type="checkbox" name="sunday" id="sunday" value="true"><br>

    <input type="submit" value="Create Schedule">
</form>

<% if (request.getAttribute("error") != null) { %>
<p style="color: red;">${request.getAttribute("error")}</p>
<% } %>

</body>
</html>
