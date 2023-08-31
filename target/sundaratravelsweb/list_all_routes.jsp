<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Route List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .table-container {
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h1>Route List</h1>
        <table>
            <tr>
                <th>Route ID</th>
                <th>From Location</th>
                <th>To Location</th>
                <th>Base Price</th>
                <th>Is Active</th>
            </tr>
            <%
                // Assuming you have a List<Route> routesList containing the route details
                for (Route route : routesList) {
            %>
            <tr>
                <td><%= route.getRouteId() %></td>
                <td><%= route.getFromLocation() %></td>
                <td><%= route.getToLocation() %></td>
                <td><%= route.getBasePrice() %></td>
                <td><%= route.isActive() ? "Yes" : "No" %></td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
