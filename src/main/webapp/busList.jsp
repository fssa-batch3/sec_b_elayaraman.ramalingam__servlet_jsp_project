<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="in.fssa.sundaratravels.dto.BusDetailsDTO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bus List</title>
</head>
<body>
<jsp:include page="GuestNavbar.jsp" />

<% List<BusDetailsDTO> busList = (List<BusDetailsDTO>)request.getAttribute("busList"); %>
    <h1>Bus List</h1>
    <table border="1" class="table table-hover container">
        <thead>
            <tr>
                <th>Bus ID</th>
                <th>Bus Number</th>
                <th>Base Price</th>
                <th>Available Seats</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach var="busDetails" items="${busList}">
			    <tr>
			        <td>${busDetails.busid}</td>
			        <td>${busDetails.busNo}</td>
			        <td>${busDetails.basePrice}</td>
			        <td>${busDetails.availableSeats}</td>
			        <td>
			            <a href="<%= request.getContextPath() %>/booknow?busid=${busDetails.busid}&busNo=${busDetails.busNo}&basePrice=${busDetails.basePrice}&availableSeats=${busDetails.availableSeats}&travelDate=${busDetails.travelDate}">Book Now</a>
			        </td>
			    </tr>
			</c:forEach>
        </tbody>
    </table>
    <script>
    console.log(JSON.parse(busListJSON));


    </script>
</body>
</html>
