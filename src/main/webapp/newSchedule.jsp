<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Schedule</title>
    <!-- Add Bootstrap CSS Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container">
    <h1>Create New Schedule</h1>

    <form action="${pageContext.request.contextPath}/admin/schedules/create" method="post">
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="monday" id="monday" value="true">
            <label class="form-check-label" for="monday">Monday</label>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="tuesday" id="tuesday" value="true">
            <label class="form-check-label" for="tuesday">Tuesday</label>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="wednesday" id="wednesday" value="true">
            <label class="form-check-label" for="wednesday">Wednesday</label>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="thursday" id="thursday" value="true">
            <label class="form-check-label" for="thursday">Thursday</label>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="friday" id="friday" value="true">
            <label class="form-check-label" for="friday">Friday</label>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="saturday" id="saturday" value="true">
            <label class="form-check-label" for="saturday">Saturday</label>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="sunday" id="sunday" value="true">
            <label class="form-check-label" for="sunday">Sunday</label>
        </div>

        <button type="submit" class="btn btn-primary">Create Schedule</button>
        <button type="button" id="cancelButton" class="btn btn-secondary">Cancel</button>

    </form>

    <% if (request.getAttribute("error") != null) { %>
    <p style="color: red;">${request.getAttribute("error")}</p>
    <% } %>
</div>
<script>
    document.getElementById("cancelButton").addEventListener("click", function() {
        window.location.href = "${pageContext.request.contextPath}/admin/schedules";
    });
</script>
<!-- Add Bootstrap JS and Popper.js (required for some Bootstrap features) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@2.9.3/dist/umd/popper.min.js"></script>

</body>
</html>
