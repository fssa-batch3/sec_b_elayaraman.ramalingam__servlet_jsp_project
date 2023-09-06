<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Route Deletion</title>
</head>
<body>
<h1>Confirm Deletion</h1>
<p>Are you sure you want to delete this Route (ID: ${routeId})?</p>
<form action="${pageContext.request.contextPath}/admin/routes/delete" method="post">
    <input type="hidden" name="routeId" value="${routeId}">
    <input type="submit" value="Confirm">
    <a href="${pageContext.request.contextPath}/admin/routes">Cancel</a>
</form>
</body>
</html>
