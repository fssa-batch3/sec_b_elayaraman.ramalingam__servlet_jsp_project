<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Route Deletion</title>
</head>
<body>
<h1>Confirm Deletion</h1>
<p>Are you sure you want to delete this schedule (ID: ${scheduleId})?</p>
<form action="${pageContext.request.contextPath}/admin/schedules/delete" method="post">
    <input type="hidden" name="scheduleId" value="${scheduleId}">
    <input type="submit" value="Confirm">
    <a href="${pageContext.request.contextPath}/admin/schedules">Cancel</a>
</form>
</body>
</html>
