<%@ page import="in.fssa.sundaratravels.model.Booking" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bookings</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<% List<Booking> bookings = (List<Booking>)request.getAttribute("bookings"); %>

<header>
    <h1>Booking Management</h1>
    <a href="${pageContext.request.contextPath}/admin/bookings/create">
        <button class="btn btn-info btn-sm">New Booking</button>
    </a>
</header>
<table class="table table-borderless container">
<thead>
<tr>
<th>Booking ID</th>
<th>Bus ID</th>
<th>travel date</th>
<th>Booked seats</th>
<th>is active</th>
</tr>
</thead>
<tbody>
    <% for (Booking booking : bookings) { %>
    <tr>
        <td><%= booking.getId() %></td>
        <td><%= booking.getBusId() %></td>
        <td><%= booking.getTravelDate() %></td>
        <td><%= booking.getBookedSeats() %></td>
        <td><%= booking.isActive() ? "Yes" : "No" %></td>
    </tr>
    <% } %>
</tbody>

</table>

</body>
</html>
