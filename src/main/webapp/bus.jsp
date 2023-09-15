<%@ page import="in.fssa.sundaratravels.model.Bus" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bus Management</title>
    <style>
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<% List<Bus> buses = (List<Bus>)request.getAttribute("buses"); %>

<header>
    <h1>Bus Management</h1>
    <a href="${pageContext.request.contextPath}/admin/buses/create">
        <button class="btn btn-info btn-sm">New Bus</button>
    </a>
</header>

<table class="table table-borderless container">
    <thead>
    <tr>
        <th>Bus ID</th>
        <th>Bus No</th>
        <th>Departure Time</th>
        <th>Arrival Time</th>
        <th>Capacity</th>
        <th>AC</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Bus bus : buses) { %>
    <tr>
        <td><%= bus.getId() %></td>
        <td><%= bus.getBusNo() %></td>
        <td><%= bus.getDepartureTime() %></td>
        <td><%= bus.getArrivalTime() %></td>
        <td><%= bus.getCapacity() %></td>
        <td><%= bus.isAc() ? "Yes" : "No" %></td>
        <td>
            <a href="<%= request.getContextPath() %>/admin/buses/edit?id=<%= bus.getId() %>">
                <button class="btn btn-primary btn-sm">Edit</button>
            </a>
            <a href="<%= request.getContextPath() %>/admin/buses/delete?id=<%= bus.getId() %>">
                <button class="btn btn-danger btn-sm">Delete</button>
            </a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>