<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Route</title>
    <!-- Add Bootstrap CSS Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container">
    <h1>Create New Route</h1>

    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
    <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <form action="${pageContext.request.contextPath}/admin/routes/create" method="post">
        <div class="mb-3">
            <label for="fromLocation" class="form-label">From Location:</label>
            <input type="text" maxlength="100" class="form-control" id="fromLocation" name="fromLocation" required>
        </div>

        <div class="mb-3">
            <label for="toLocation" class="form-label">To Location:</label>
            <input type="text" maxlength="100" class="form-control" id="toLocation" name="toLocation" required>
        </div>

        <div class="mb-3">
            <label for="basePrice" class="form-label">Base Price:</label>
            <input type="text" min="0"  max="9999" class="form-control" id="basePrice" name="basePrice" required>
        </div>

        <button type="submit" class="btn btn-primary">Create Route</button>
        <button type="button" id="cancelButton" class="btn btn-secondary">Cancel</button>

    </form>
</div>
<script>
    document.getElementById("cancelButton").addEventListener("click", function() {
        window.location.href = "${pageContext.request.contextPath}/admin/routes";
    });
</script>
<!-- Add Bootstrap JS and Popper.js (required for some Bootstrap features) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@2.9.3/dist/umd/popper.min.js"></script>

</body>
</html>
