<%@ page import="in.fssa.sundaratravels.model.BusSchedule" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Bus</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>

</style>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container">
    <h1>Create New Bus</h1>

    <form action="${pageContext.request.contextPath}/admin/buses/create" method="post">
        <div class="mb-3">
            <label for="busNo" class="form-label">Bus Number:</label>
            <input type="text" class="form-control" id="busNo" name="busNo" required>
        </div>

        <div class="mb-3">
            <label for="departureTime" class="form-label">Departure Time:</label>
            <input type="time" class="form-control" id="departureTime" step="2" name="departureTime" required>
        </div>

        <div class="mb-3">
            <label for="arrivalTime" class="form-label">Arrival Time:</label>
            <input type="time" class="form-control" id="arrivalTime" step="2" name="arrivalTime" required>
        </div>

        <div class="mb-3">
            <label for="capacity" class="form-label">Capacity:</label>
            <input type="number" min="0" class="form-control" id="capacity" name="capacity" required>
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="isAc" name="isAc">
            <label class="form-check-label" for="isAc">AC</label>
        </div>

        <div class="mb-3">
            <label for="routeId" class="form-label">Route ID:</label>
            <input type="number" min="0" class="form-control" id="routeId" name="routeId" required>
        </div>

        <div class="mb-3">
            <label for="scheduleId" class="form-label">Schedule ID:</label>
            <input type="number" min="0" class="form-control" id="scheduleId" name="scheduleId" required>
        </div>

        <button type="submit" class="btn btn-primary">Create Bus</button>
        <button type="button" id="cancelButton" class="btn btn-secondary">Cancel</button>

    </form>

    <script>
        document.getElementById("cancelButton").addEventListener("click", function() {
            window.location.href = "${pageContext.request.contextPath}/admin/buses";
        });
    </script>
</div>

<!-- Add Bootstrap JS and Popper.js (required for some Bootstrap features) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@2.9.3/dist/umd/popper.min.js"></script>

</body>
</html>
