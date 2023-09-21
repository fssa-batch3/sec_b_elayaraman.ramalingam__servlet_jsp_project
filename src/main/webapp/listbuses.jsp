<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="in.fssa.sundaratravels.dto.BusDetailsDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bus List</title>
</head>
<body>
	<jsp:include page="GuestNavbar.jsp" />

	<%
	List<BusDetailsDTO> busList = (List<BusDetailsDTO>) request.getAttribute("busList");
	%>
	<h1>Bus List</h1>
	<table border="1" class="table table-hover container">
		<thead>
			<tr>
				<th>Bus ID</th>
				<th>Bus Number</th>
				<th>Departure Time</th>
				<th>Origin</th>
				<th>Destination</th>
				<th>Ticket Price</th>
				<th>Available Seats</th>
				<th>Service</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty busList}">
					<c:forEach var="busDetails" items="${busList}">
						<tr>
							<td>${busDetails.busid}</td>
							<td>${busDetails.busNo}</td>
							<td>${busDetails.fromLocation}</td>
							<td>${busDetails.toLocation}</td>
							<td>${busDetails.departureTime}</td>
							<td>${busDetails.basePrice}</td>
							<td>${(busDetails.availableSeats > 0 ? busDetails.availableSeats : 'no Seats available')}</td>
							<c:if test="${busDetails.availableSeats > 0}">
								<td><a
									href="${pageContext.request.contextPath}/booknow?busid=${busDetails.busid}&busNo=${busDetails.busNo}&basePrice=${busDetails.basePrice}&availableSeats=${busDetails.availableSeats}&travelDate=${busDetails.travelDate}">Book
										Now</a></td>
							</c:if>
						</tr>
					</c:forEach>

				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8">No buses available</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>

	</table>
</body>
</html>
