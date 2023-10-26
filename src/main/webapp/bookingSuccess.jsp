<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="in.fssa.sundaratravels.model.Ticket" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Success</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
</head>
<style>
html,body{
width:100%;
height:100%;

.ticket{
display:flex;
flex-direction:column;
width:350px;
margin:80px auto;}
}
</style>
<body>
<jsp:include page="GuestNavbar.jsp" />
    <div class="ticket">
    <h1>Booking Successful</h1>
    
    <p>Booking ID: ${ticket.bookingId}</p>
    <p>Ticket ID: ${ticket.ticketId}</p>
    <p>Passenger Name: ${ticket.passengerName}</p>
    <p>Phone Number: ${ticket.phoneNumber}</p>
    <p>Travel Date: ${ticket.travelDate}</p>
    <p>Total Price: ${ticket.totalPrice}</p>
    </div>
    </body>
</html>