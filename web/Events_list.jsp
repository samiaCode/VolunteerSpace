<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@ page import="beans.UserBean" %>
<%@ page import="beans.EventBean" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Event List</title>
    <style>
        /* CSS Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            margin: 20px auto;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <% 
        EventBean eventBean = (EventBean) session.getAttribute("EventBean");
        if (eventBean != null) {
    %>
        <div class="container">
            <h1>Event List</h1>
            <a href="Event.jsp" class="button">Back to Events page</a>
            <h1>Event Details</h1>

            <!-- Event Image -->
            <img src="p1.gif" alt="Event Image" class="event-image">
            <div class="event-box">
                <h3>Event Name:</h3> <%= eventBean.getTitle() %>
                <p><strong>Description:</strong> <%= eventBean.getDescription() %></p>
                <p><strong>Date Start:</strong> <%= eventBean.getStartingDate() %></p>
                <p><strong>Date End:</strong> <%= eventBean.getEndingDate() %></p>
                <p><strong>Time Start:</strong> <%= eventBean.getStartingTime() %></p>
                <p><strong>Time End:</strong> <%= eventBean.getEndingTime() %></p>
                <p><strong>Location:</strong> <%= eventBean.getEventAdress() %></p>
                <p><strong>Number of Volunteers:</strong> <%= eventBean.getNumberOfVolunteers() %></p>
                <p><strong>Registration Conditions:</strong> <%= eventBean.getEventAdress() %></p>
                <button class="btn btn-update" onclick="updateEvent()">Update Event</button>
                <button class="btn btn-delete" onclick="deleteEvent()">Delete Event</button>
            </div>

            <h1>Volunteers Information</h1>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact Number</th>
                        <th>Date of Birth</th>
                        <th>Address</th>
                        <th>Gender</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                      
                        ResultSet volunteerRs = (ResultSet) session.getAttribute("volunteerRs");
                        if (volunteerRs != null) {
                            while (volunteerRs.next()) {
                    %>
                    <tr>
                        <td><%= volunteerRs.getInt("id") %></td>
                        <td><%= volunteerRs.getString("name") %></td>
                        <td><%= volunteerRs.getString("email") %></td>
                        <td><%= volunteerRs.getString("contact_number") %></td>
                        <td><%= volunteerRs.getDate("date_of_birth") %></td>
                        <td><%= volunteerRs.getString("address") %></td>
                        <td><%= volunteerRs.getString("gender") %></td>
                        <td><%= volunteerRs.getString("role") %></td>
                    </tr>
                    <% 
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    <% 
        } else {
            out.println("<p>Error: Event data not found.</p>");
        }
    %>

    <footer>
        <p>© 2024 Volunteer Event Management</p>
    </footer>

    <script>
        function updateEvent() {
            alert('Update event functionality to be implemented');
            // Redirect or show update functionality
            window.location.href = 'updateEvent.jsp';
        }

        function deleteEvent() {
            if (confirm('Are you sure you want to delete this event?')) {
                alert('Event deleted');
                // Redirect or perform delete functionality
                window.location.href = 'deleteEvent.jsp';
            }
        }
    </script>
</body>
</html>
