<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Ticket</title>
</head>
<body>
    <h1>Create Ticket</h1>
    <form action="${pageContext.request.contextPath}/ticket" method="post">
        <label for="busId">Bus ID:</label>
        <input type="text" id="busId" name="busId" required><br><br>
        
        <label for="travelDate">Travel Date:</label>
        <input type="date" id="travelDate" name="travelDate" required><br><br>
        
        <label for="bookedSeats">Booked Seats:</label>
        <input type="number" id="bookedSeats" name="bookedSeats" required><br><br>
        
        <label for="passengerName">Passenger Name:</label>
        <input type="text" id="passengerName" name="passengerName" required><br><br>
        
        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>
        
        <input type="submit" value="Create Ticket">
    </form>
</body>
</html>
