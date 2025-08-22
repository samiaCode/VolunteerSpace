<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Volunteer Event</title>
    </head>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('your_image.jpg'); /* Replace with your uploaded image file name */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #333;
        }
        h1 {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            font-size: 36px;
            color: #333;
            margin: 0;
        }
        .event-image {
            display: block;
            margin: 20px auto;
            max-width: 60%;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);

        }
        .event-box {
            max-width: 60%;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .event-box h3 {
            margin-top: 0;
        }
        .event-box p {
            margin: 5px 0;
        }
        .event-box .btn {
            padding: 8px 15px;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            display: inline-block;
        }
        .event-box .btn-update {
            background-color: #007BFF;
        }
        .event-box .btn-delete {
            background-color: #FF5733;
        }
        .btn-back {
            background-color: #6c757d;
            display: inline-block;
            margin: 20px auto;
            text-align: center;
        }
        .btn:hover {
            opacity: 0.9;
        }
        table {
            width: 80%;
            margin: 50px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
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
        td {
            font-size: 14px;
        }
        .btn {
            padding: 8px 15px;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;

            .btn:hover {
                opacity: 0.9;
            }
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.8);
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .navbar {
            background-color: #4CAF50;
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }
        .navbar a, .navbar span {
            color: white;
            text-decoration: none;
            padding: 14px 20px;
            font-size: 18px;
        }

        .back a {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-left: 10px;
            text-decoration: none;
            border-radius: 5px;


        }
        .back a:hover {
            background-color: #0056b3;
        }




    </style>
</head>
<body>
    <div class="navbar">
        <span>Volunteer Space</span>
        <a href="#">HOME</a>
        <a href="#">OPPORTUNITIES</a>
        <a href="#">MY EVENTS</a>
        <a href="#">CONTACT US</a>
        <a href="#">ACCOUNT</a>
        <div class="back">

            <a href="Event.jsp" class="button">back to Events page</a>
        </div>
    </div>

    <h1>Event</h1>

    <!-- Event Image -->
    <img src="p1.gif" alt="Event Image" class="event-image">
    <div class="event-box">
        <h3> <%= eventBean.getTitle() %> </h3>
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
                <th>Event</th>

            </tr>
        </thead>
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
                    <th>Organization</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="volunteer" items="${volunteers}">
                <tr>
                    <td>${volunteer.userId}</td>
                    <td>${volunteer.userName}</td>
                    <td>${volunteer.email}</td>
                    <td>${volunteer.contactNumber}</td>
                    <td>${volunteer.dob}</td>
                    <td>${volunteer.address}</td>
                    <td>${volunteer.gender}</td>
                    <td>${volunteer.role}</td>
                    <td>${volunteer.organizationName}</td>
                </tr>
            </c:forEach>
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
