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
    
    <title>Update Event</title>
    <style>
        /* General Styles */
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

        /* Navbar Styles */
        .navbar {
            width: 100%;
            background-color: rgba(76, 175, 80, 0.9);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
        }

        .navbar a, .navbar .dropbtn {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 18px;
            background: none;
            border: none;
            cursor: pointer;
        }

        .navbar a:hover, .navbar .dropbtn:hover {
            background-color: #ddd;
            color: olivedrab;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            right: 0;
            top: 100%;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }

        .dropdown-content a {
            float: none;
            color: olivedrab;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            font-size: 16px;
        }

        .dropdown-content a:hover {
            background-color: #297180;
            color: white;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Form Container Styles */
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

        label {
            font-size: 14px;
            color: #555555;
            margin-top: 10px;
            display: block;
        }

        input[type="text"], input[type="date"], input[type="time"], input[type="number"], textarea {
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

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
 
    <div class="navbar">
        <div class="back">
            <a href="index.jsp" class="button">Back to Main Page</a>
        </div>
        <a href="#">HOME</a>
        <a href="Opportunities.jsp">OPPORTUNITIES</a>
        <div class="dropdown">
            <button class="dropbtn">Account</button>
            <div class="dropdown-content">
                <a href="profiles.jsp">Profile</a>
                <a href="index.jsp">Sign Out</a>
            </div>
        </div>
    </div>

    <!-- Form Container -->
    <div class="container">
        <h2>Update Event Details</h2>
        <form action="Event" method="POST">
            <div class="form-group">
                <label for="event_id">Event ID:</label>
                <input type="text" id="event_id" name="event_id" placeholder="Enter the event ID" required>
            </div>

            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" placeholder="Enter the event title" required>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4" placeholder="Enter the event description" required></textarea>
            </div>

            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" id="status" name="status" placeholder="Enter the event status" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" placeholder="Enter the event address" required>
            </div>

            <div class="form-group">
                <label for="contact">Contact:</label>
                <input type="tel" id="contact" name="contact" placeholder="Enter contact number" required>
            </div>

            <div class="form-group">
                <label for="start_date">Starting Date:</label>
                <input type="date" id="start_date" name="start_date" required>
            </div>

            <div class="form-group">
                <label for="ending_date">Ending Date:</label>
                <input type="date" id="ending_date" name="ending_date" required>
            </div>

            <div class="form-group">
                <label for="start_time">Start Time:</label>
                <input type="time" id="start_time" name="start_time" required>
            </div>

            <div class="form-group">
                <label for="end_time">End Time:</label>
                <input type="time" id="end_time" name="end_time" required>
            </div>

            <div class="form-group">
                <label for="nov">Number of Volunteers:</label>
                <input type="number" id="nov" name="nov" required>
            </div>

            <button type="submit">Update Event</button>
        </form>
    </div>
</body>
</html>