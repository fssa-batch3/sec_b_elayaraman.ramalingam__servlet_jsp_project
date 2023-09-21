<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Success</title>
</head>
<body>
<jsp:include page="GuestNavbar.jsp" />
    <h1>Booking Successful</h1>
    
    <p>Booking ID: ${ticket.bookingId}</p>
    <p>Ticket ID: ${ticket.ticketId}</p>
    <p>Passenger Name: ${ticket.passengerName}</p>
    <p>Phone Number: ${ticket.phoneNumber}</p>
    <p>Travel Date: ${ticket.travelDate}</p>
    <p>Total Price: ${ticket.totalPrice}</p>
    </body>
</html>