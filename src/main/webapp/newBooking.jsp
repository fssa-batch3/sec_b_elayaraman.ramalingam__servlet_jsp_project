<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.google.gson.Gson"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bus Booking</title>
</head>
<body>
	<h1>Bus Booking</h1>
	<form action="${pageContext.request.contextPath}/buses/list" method="post">
		<label for="fromLocation">From Location:</label> <select
			id="fromLocation" name="fromLocation" required
			onchange="updateToLocationDropdown()">
			<option value="" disabled selected>Select From Location</option>
			<c:forEach items="${routes}" var="route">
				<option value="${route.fromLocation}">${route.fromLocation}</option>
			</c:forEach>
		</select><br> <label for="toLocation">To Location:</label> <select
			id="toLocation" name="toLocation" required onchange="selectRouteId()">
			<option value="" disabled selected>Select To Location</option>
		</select><br> <input name="routeId" type="hidden" id="selectedRouteId" /> <label for="travelDate">Travel
			Date:</label> <input type="date" id="travelDate" name="travelDate" required><br>
		<input type="submit" value="Search Buses">
	</form>

<script>
const routes = JSON.parse('<%=new Gson().toJson(request.getAttribute("routes"))%>');
    function updateToLocationDropdown() {
        const fromLocationDropdown = document.getElementById("fromLocation");
        const toLocationDropdown = document.getElementById("toLocation");
        const selectedFromLocation = fromLocationDropdown.value;

        toLocationDropdown.innerHTML = "";

        const defaultOption = document.createElement("option");
        defaultOption.value = "";
        defaultOption.text = "Select To Location";
        defaultOption.disabled = true;
        defaultOption.selected = true;
        toLocationDropdown.appendChild(defaultOption);

        document.getElementById("selectedRouteId").value = "";

        for (const route of routes) {
            if (route.fromLocation === selectedFromLocation) {
                const option = document.createElement("option");
                option.value = route.toLocation;
                option.text = route.toLocation;
                toLocationDropdown.appendChild(option);
            }
        }
    }

    function selectRouteId() {
        const selectedToLocation = document.getElementById("toLocation").value;
        
        for (const route of routes) {
            if (route.fromLocation === document.getElementById("fromLocation").value && route.toLocation === selectedToLocation) {
                document.getElementById("selectedRouteId").value = route.routeId;
                break;
            }
        }
    }
</script>

</body>
</html>
