<%@ page import="in.fssa.sundaratravels.model.Bus" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Bus</title>
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

<h1>Edit Bus</h1>

<form action="${pageContext.request.contextPath}/admin/buses/edit" method="post">
    <input type="hidden" name="busId" value="${editBus.id}">

    <label for="busNo">Bus Number:</label>
    <input type="text" id="busNo" name="busNo" value="${editBus.busNo}" required readonly><br>

    <label for="departureTime">Departure Time:</label>
    <input type="time" id="departureTime" step="2" name="departureTime" value="${editBus.departureTime}" required>

    <label for="arrivalTime">Arrival Time:</label>
    <input type="time" id="arrivalTime" step="2" name="arrivalTime" value="${editBus.arrivalTime}" required>

    <label for="capacity">Capacity:</label>
    <input type="number" min="0" id="capacity" name="capacity" value="${editBus.capacity}" required><br>

    <label for="isAc">AC:</label>
    <input type="checkbox" id="isAc" name="isAc" ${editBus.isAc() ? 'checked' : ''}><br>

    <label for="routeId">Route ID:</label>
    <input type="number" min="0" id="routeId" name="routeId" value="${editBus.routeId}" required><br>

    <label for="scheduleId">Schedule ID:</label>
    <input type="number" min="0" id="scheduleId" name="scheduleId" value="${editBus.scheduleId}" required><br>

    <button type="submit">Update Bus</button>

</form>
<a href="${pageContext.request.contextPath}/admin/buses"><button>Cancel</button></a>
</body>
</html>
