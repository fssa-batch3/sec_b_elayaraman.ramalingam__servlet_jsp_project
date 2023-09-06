<%@ page import="in.fssa.sundaratravels.model.Bus" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bus Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        th, td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 8px;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:nth-child(even) td {
            background-color: #f0f0f0;
        }

        a {
            text-decoration: none;
            color: #008bff;
        }

        a:hover {
            text-decoration: underline;
        }

        button {
            background-color: #008bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .new-button {
            text-align: center;
            margin: 20px 0;
        }
    </style>

</head>
<body>
<jsp:include page="navbar.jsp"/>
<% List<Bus> buses = (List<Bus>)request.getAttribute("buses"); %>

<h1>Bus Management</h1>
<a href="${pageContext.request.contextPath}/admin/buses/create">
    <button>New Bus</button>
</a>
<table>
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
                <button>Edit</button>
            </a>
            <a href="<%= request.getContextPath() %>/admin/buses/delete?id=<%= bus.getId() %>">
                <button>Delete</button>
            </a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
