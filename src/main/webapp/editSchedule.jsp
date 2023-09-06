<%@ page import="in.fssa.sundaratravels.model.BusSchedule" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Schedule</title>
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
            background-color: #008bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        form {
            margin: 20px auto;
            width: 80%;
        }

        label {
            display: block;
        }

        input[type="checkbox"] {
            margin-left: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h1>Edit Schedule</h1>

<form action="<%= request.getContextPath() %>/admin/schedules/edit" method="post">
    <input type="hidden" name="id" value="${editSchedule.id}">
    <div class="wrapper">
        <label for="monday">Monday:</label>
        <input type="checkbox" name="monday" id="monday" ${editSchedule.monday ? 'checked' : ''}><br>
    </div>
    <div class="wrapper">
        <label for="tuesday">Tuesday:</label>
        <input type="checkbox" id="tuesday" name="tuesday" ${editSchedule.tuesday ? 'checked' : ''}><br>

    </div>
    <div class="wrapper">
        <label for="wednesday">Wednesday:</label>
        <input type="checkbox" id="wednesday" name="wednesday" ${editSchedule.wednesday ? 'checked' : ''}><br>
    </div>
    <div class="wrapper">
        <label for="thursday">Thursday:</label>
        <input type="checkbox" id="thursday" name="thursday" ${editSchedule.thursday ? 'checked' : ''}><br>
    </div>
    <div class="wrapper">
        <label for="friday">Friday:</label>
        <input type="checkbox" id="friday" name="friday" ${editSchedule.friday ? 'checked' : ''}><br>
    </div>
    <div class="wrapper">
        <label for="saturday">Saturday:</label>
        <input type="checkbox" id="saturday" name="saturday" ${editSchedule.saturday ? 'checked' : ''}><br>
    </div>
    <div class="wrapper">
        <label for="sunday">Sunday:</label>
        <input type="checkbox" id="sunday" name="sunday" ${editSchedule.sunday ? 'checked' : ''}><br>
    </div>

    <button type="submit">Update</button>

</form>
<a href="<%= request.getContextPath() %>/admin/schedules"><button>Cancel</button></a>
</body>
</html>
