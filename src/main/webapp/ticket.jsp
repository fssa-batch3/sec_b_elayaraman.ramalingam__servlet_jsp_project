<%@ page import="in.fssa.sundaratravels.model.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tickets</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<% List<Ticket> tickets = (List<Ticket>)request.getAttribute("tickets"); %>
<header>
    <h1>Ticket Management</h1>
    <a href="${pageContext.request.contextPath}/booking/new">
        <button class="btn btn-info btn-sm">New Ticket</button>
    </a>
</header>

<table class="table table-borderless container">
<thead>
<tr>
<th>Ticket ID</th>
<th>Booking ID</th>
<th>travel date</th>
<th>Booked seats</th>
<th>is active</th>
<th>Passenger Name</th>
<th>Phone Number</th>
</tr>
</thead>
<tbody>
    <% for (Ticket ticket : tickets) { %>
    <tr>
        <td><%= ticket.getTicketId() %></td>
        <td><%= ticket.getBookingId() %></td>
        <td><%= ticket.getTravelDate() %></td>
        <td><%= ticket.getBookedSeats() %></td>
        <td><%= ticket.isActive() ? "Yes" : "No" %></td>
        <td><%= ticket.getPassengerName() %></td>
        <td><%= ticket.getPhoneNumber() %></td>
    </tr>
    <% } %>
</tbody>

</table>

</body>
</html>