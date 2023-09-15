<%@ page import="in.fssa.sundaratravels.model.Route" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Route</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h1>Edit Route</h1>
<form action="${pageContext.request.contextPath}/admin/routes/update" method="post">
    <input type="hidden" name="routeId" value="${editRoute.routeId}">
    From Location: <input type="text" maxlength="100" name="fromLocation" value="${editRoute.fromLocation}" required ><br>
    To Location: <input type="text" maxlength="100" name="toLocation" value="${editRoute.toLocation}" required ><br>
    Base Price: <input type="text" min="0" name="basePrice" value="${editRoute.basePrice}" required><br>
    <input type="submit" value="Update">
</form>

</body>
</html>
