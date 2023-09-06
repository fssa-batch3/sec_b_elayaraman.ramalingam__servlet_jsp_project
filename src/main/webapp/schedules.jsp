<%@ page import="java.util.List" %>
<%@ page import="in.fssa.sundaratravels.model.BusSchedule" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Schedules</title>
    <style>
        * {
            text-decoration: none;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
        }

        nav {
            background-color: #333;
            color: #fff;
            display: flex;
            align-items: center;
            padding: 10px;
        }

        h1 {
            margin: 20px 0;
        }

        a {
            text-decoration: none;
            color: #333;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ddd;
            text-align: left;
            width: fit-content;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<% List<BusSchedule> list = (List<BusSchedule>)request.getAttribute("schedules"); %>
<header>
    <h1>Schedule List</h1>
    <a href="${pageContext.request.contextPath}/admin/schedules/create">
        <button>Create New Schedule</button>
    </a>
</header>
<table>
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
            <a href="${pageContext.request.contextPath}/admin/schedules/edit?id=<%= schedule.getId() %>"><button>Edit</button></a>
            <a href="${pageContext.request.contextPath}/admin/schedules/delete?id=<%= schedule.getId() %>"><button>Delete</button></a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
