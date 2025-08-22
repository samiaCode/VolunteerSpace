<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@page import = "java.util.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import = "beans.EventBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Admin_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>Admin Dashboard</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
 
            .container {
                width: 80%;
                margin: 30px auto;
                padding: 20px;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #4caf50;
            }
            .event-card {
                border: 1px solid #ddd;
                margin: 10px 0;
                padding: 10px;
                border-radius: 5px;
                background-color: #f9f9f9;
            }
            .event-card h2 {
                margin: 0;
                color: #333;
            }
            .event-card p {
                margin: 5px 0;
                color: #555;
            }
            .event-card .actions button {
                margin: 5px;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .approve {
                background-color: #4caf50;
                color: white;
            }
            .approve:hover {
                background-color: #45a049;
            }
            .reject {
                background-color: #f44336;
                color: white;
            }
            .reject:hover {
                background-color: #e53935;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <h2>Admin Dashboard</h2>
            <div>
                <a href="Admin_Main.jsp">Home</a>
          
            </div>
        </div>
        <div class="container">
            <h1>Pending Event Approvals</h1>
           <% 
     ArrayList<EventBean> pendingEvents = ( ArrayList<EventBean>) request.getAttribute("pendingEvents");
    if (pendingEvents != null) {
        for (EventBean event : pendingEvents) {
%>
            <div class="event-card">
                <h2><%= event.getTitle() %></h2>
                <p><strong>Description:</strong> <%= event.getDescription() %></p>
                <p><strong>Location:</strong> <%= event.getEventAdress() %></p>
                <p><strong>Start Date:</strong> <%= event.getStartingDate() %></p>
                <p><strong>End Date:</strong> <%= event.getEndingDate() %></p>
                <p><strong>Contact:</strong> <%= event.getCoordinatorContactNumber() %></p>
                <div class="actions">
                    <form action="AdminApprovalServlet" method="post" style="display: inline;">
                        <input type="hidden" name="event_id" value="<%= event.getEventId() %>" />
                        <button type="submit" name="action" value="Approve" class="approve">Approve</button>
                    </form>
                    <form action="AdminApprovalServlet" method="post" style="display: inline;">
                        <input type="hidden" name="event_id" value="<%= event.getEventId() %>" />
                        <button type="submit" name="action" value="Reject" class="reject">Reject</button>
                    </form>
                </div>
            </div>
<%
        }
    }
%>

        </div>
    </body>
</html>
