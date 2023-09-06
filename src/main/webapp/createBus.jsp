<%@ page import="in.fssa.sundaratravels.model.BusSchedule" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Bus</title>
    <style>
        /* Your CSS styles for the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }

        h1 {
            margin-top: 20px;
            margin-bottom: 10px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="time"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="checkbox"] {
            margin-top: 5px;
        }

        button[type="submit"],
        button {
            background-color: #008bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }

        button[type="submit"]:hover,
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h1>Create New Bus</h1>

<form action="${pageContext.request.contextPath}/admin/buses/create" method="post">
    <label for="busNo">Bus Number:</label>
    <input type="text" id="busNo" name="busNo" required>

    <label for="departureTime">Departure Time:</label>
    <input type="time" id="departureTime" step="2"  name="departureTime" required>

    <label for="arrivalTime">Arrival Time:</label>
    <input type="time" id="arrivalTime" step="2"  name="arrivalTime" required>

    <label for="capacity">Capacity:</label>
    <input type="number" id="capacity" name="capacity" required>

    <label for="isAc">AC:</label>
    <input type="checkbox" id="isAc" name="isAc">

    <label for="routeId">Route ID:</label>
    <input type="number" id="routeId" name="routeId" required>

    <label for="scheduleId">Schedule ID:</label>
    <input type="number" id="scheduleId" name="scheduleId" required>

    <button type="submit">Create Bus</button>
    <button type="button" id="cancelButton">Cancel</button>

</form>
<script>
    document.getElementById("cancelButton").addEventListener("click", function() {
        window.location.href = "${pageContext.request.contextPath}/admin/buses";
    });
</script>

</body>
</html>
