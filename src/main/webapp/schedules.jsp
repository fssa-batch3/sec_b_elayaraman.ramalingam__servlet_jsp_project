<%@ page import="java.util.List" %>
<%@ page import="in.fssa.sundaratravels.model.BusSchedule" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Schedule List</title>
    <style>
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<% List<BusSchedule> list = (List<BusSchedule>)request.getAttribute("schedules"); %>
<header>
    <h1>Schedule List</h1>
    <a href="${pageContext.request.contextPath}/admin/schedules/create">
        <button class="btn btn-info btn-sm">Create New Schedule</button>
    </a>
</header>
<table class="table table-borderless container">
    <thead>
    <tr>
        <th>Schedule ID</th>
        <th>Monday</th>
        <th>Tuesday</th>
        <th>Wednesday</th>
        <th>Thursday</th>
        <th>Friday</th>
        <th>Saturday</th>
        <th>Sunday</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (BusSchedule schedule : list) { %>
    <tr>
        <td><%= schedule.getId() %></td>
        <td><%= schedule.isMonday() %></td>
        <td><%= schedule.isTuesday() %></td>
        <td><%= schedule.isWednesday() %></td>
        <td><%= schedule.isThursday() %></td>
        <td><%= schedule.isFriday() %></td>
        <td><%= schedule.isSaturday() %></td>
        <td><%= schedule.isSunday() %></td>
        <td class="wrapper">
            <a href="${pageContext.request.contextPath}/admin/schedules/edit?id=<%= schedule.getId() %>"><button class="btn btn-primary btn-sm">Edit</button></a>
            <a href="${pageContext.request.contextPath}/admin/schedules/delete?id=<%= schedule.getId() %>" ><button class="btn btn-danger btn-sm">Delete</button></a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
