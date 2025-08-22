<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Event</title>
    
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
            }
            .navbar {
                width: 100%;
                background-color: rgba(76, 175, 80, 0.9);
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 10px 20px;
            }
            .navbar a {
                color: white;
                text-decoration: none;
                padding: 10px 20px;
                font-size: 18px;
            }
            .container {
                background: #ffffff;
                padding: 20px 40px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 400px;
                margin-top: 20px;
            }
            h2 {
                text-align: center;
                color: #333333;
                margin-bottom: 20px;
            }
            input, textarea {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                border: 1px solid #dddddd;
                border-radius: 4px;
                font-size: 14px;
            }
            button {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: white;
                font-size: 16px;
                cursor: pointer;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <a href="index.jsp">Back to Main Page</a>
        </div>
        <div class="container">
            <h2>Update Event Details</h2>
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <p style="color: red;"><%= error %></p>
            <%
                } else {
            %>
            <form action="SaveUpdatedEventServlet" method="post">
                <input type="hidden" name="event_id" value="<%= request.getAttribute("event_id") %>">

                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="<%= request.getAttribute("title") %>" required>

                <label for="location">Location:</label>
                <input type="text" id="location" name="location" value="<%= request.getAttribute("event_address") %>" required>

                <label for="numberOfVolunteers">Number of Volunteers:</label>
                <input type="number" id="numberOfVolunteers" name="numberOfVolunteers" value="<%= request.getAttribute("number_of_volunteers") %>" required>

                <label for="starting_date">Starting Date:</label>
                <input type="date" id="starting_date" name="starting_date" value="<%= request.getAttribute("starting_date") %>" required>

                <label for="end_date">End Date:</label>
                <input type="date" id="end_date" name="end_date" value="<%= request.getAttribute("ending_date") %>" required>

                <label for="startTime">Starting Time:</label>
                <input type="time" id="startTime" name="startTime" value="<%= request.getAttribute("starting_time") %>" required>

                <label for="endTime">Ending Time:</label>
                <input type="time" id="endTime" name="endTime" value="<%= request.getAttribute("ending_time") %>" required>

                <button type="submit">Update Event</button>
            </form>
            <%
                }
            %>
        </div>
    </body>
</html>
