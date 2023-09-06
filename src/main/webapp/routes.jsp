<%@ page import="in.fssa.sundaratravels.model.Route" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Route Management</title>
    <style>

    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<% List<Route> list = (List<Route>)request.getAttribute("routes"); %>


<header>
    <h1 class="title">Route Management</h1>
    <button class="btn btn-info btn-sm" onclick="window.location.href='<%= request.getContextPath() %>/admin/routes/create'">Add new Route</button>

</header>

<table class="table table-borderless container">

    <thead>
    <tr>
        <th>Route ID</th>
        <th>From Location</th>
        <th>To Location</th>
        <th>Base Price</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Route route : list) { %>
    <tr>
        <td><%= route.getRouteId() %></td>
        <td><%= route.getFromLocation() %></td>
        <td><%= route.getToLocation() %></td>
        <td><%= route.getBasePrice() %></td>
        <td>
<%--            <a href="<%= request.getContextPath() %>/admin/routes/edit?id=<%= route.getRouteId() %>">--%>
<%--                <button class="btn btn-primary btn-sm" onclick="window.location.href='<%= request.getContextPath() %>/admin/routes/edit?id=<%= route.getRouteId() '">Edit</button>--%>
<%--            </a>--%>
    <button class="btn btn-primary btn-sm" onclick="window.location.href='<%= request.getContextPath() %>/admin/routes/edit?id=<%= route.getRouteId() %>'">Edit</button>
    <button class="btn btn-danger btn-sm" onclick="window.location.href='<%= request.getContextPath() %>/admin/routes/delete?id=<%= route.getRouteId() %>'">Delete</button>

        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
