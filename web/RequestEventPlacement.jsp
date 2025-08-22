<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@include file="Organizer_header.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Request Event Placement</title>
        <link rel="stylesheet" href="style/style.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background: url('p2.jpg') no-repeat center center fixed;
                background-size: cover;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                margin-top: 8rem;
                padding: 20px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }
            .container h1 {
                text-align: center;
                color: green;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }
            .form-group input, .form-group textarea, .form-group select {
                width: 100%;
                padding: 10px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .form-group textarea {
                resize: vertical;
            }
            .submit-btn {
                width: 100%;
                padding: 10px;
                background-color: green;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .submit-btn:hover {
                background-color: darkgreen;
            }
            .status-message {
                text-align: center;
                margin-top: 20px;
                font-size: 18px;
            }
          
        </style>
    </head>
    <body>
      
        <div class="container">
            <h1>Request Event Placement</h1>
            <form action="EventRequestServlet" method="post">
                <div class="form-group">
                    <label for="title">Event Title:</label>
                    <input type="text" id="title" name="Title" required>
                </div>
                <div class="form-group">
                    <label for="location">Location:</label>
                    <input type="text" id="location" name="location" required>
                </div>
                <div class="form-group">
                    <label for="numberOfVolunteers">Number of Volunteers:</label>
                    <input type="number" id="numberOfVolunteers" name="NumberOfVolunteers" required>
                </div>
                <div class="form-group">
                    <label for="starting_date">Starting Date:</label>
                    <input type="date" id="starting_date" name="starting_date" required>
                </div>
                <div class="form-group">
                    <label for="end_date">End Date:</label>
                    <input type="date" id="end_date" name="end_date" required>
                </div>
                <div class="form-group">
                    <label for="time">Starting Time:</label>
                    <input type="time" id="time" name="startTime" required>
                </div>
                <div class="form-group">
                    <label for="time">Ending Time:</label>
                    <input type="time" id="time" name="endTime" required>
                </div>
                <div class="form-group">
                    <label for="phone">Contact Number:</label>
                    <input type="tel" id="phone" name="phone" placeholder="05X-XXX-XXXX" pattern="[0-5]{3}-[0-9]{3}-[0-9]{4}" required>
                </div>
                <div class="form-group">
                    <label for="Gender">Gender:</label>
                    <select id="Gender" name="volunteers_gender" required>
                        <option value="">Select Gender</option>
                        <option value="Female">Female</option>
                        <option value="Male">Male</option>
                        <option value="Male">Mix</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="eventDescription">Event Description:</label>
                    <textarea id="eventDescription" name="Event_Description" rows="4" required></textarea>
                </div>
                 <div class="form-group">
                    <label for="eventImage">Event Image:</label>
                    <input type="file" id="eventImage" name="eventImage" accept="image/*" required>
                </div>
                <button type="submit" class="submit-btn">Submit</button>
            </form>
            <div class="status-message">
                <%
                    String status = request.getParameter("status");
                    if (status != null) {
                        if ("success".equals(status)) {
                            out.print("<p style='color:green;'>Event request submitted successfully!</p>");
                        } else {
                            String message = request.getParameter("message");
                            out.print("<p style='color:red;'>Error: " + (message != null ? message : "An error occurred") + "</p>");
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>
