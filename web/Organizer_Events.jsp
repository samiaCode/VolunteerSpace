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
<%@include file="Organizer_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Event Management</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            .header img {
                border-radius: 50%;
                width: 150px;
                height: 150px;
                object-fit: cover;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            th {
                background-color: #f2f2f2;
                text-align: left;
            }

            button {
                padding: 5px 10px;
                cursor: pointer;
            }

            h1 {
                font-size: 3rem;
            }
            .a {
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                font-weight: bold;
                margin: 4px 2px;
                transition-duration: 0.4s;
                cursor: pointer;
            }
            .deleteBtn {
                color: red;
            }
           .viewBtn {
    color: rgb(24, 152, 217); 
}
            .viewBtn:hover {
                background-color: rgb(24, 152, 217);
                color: white;
            }

            .deleteBtn:hover {
                background-color: red;
                color: white;
            }
            body {
    display: flex;
    flex-direction: column; /* Stacks items vertically */
    align-items: center; /* Centers horizontally */
    justify-content: flex-start; /* Aligns items to the top vertically */
    height: 100vh; /* Full viewport height */
    margin: 0; /* Removes default margin */
}
            

        </style>
    </head>
    <body  style="background-image: url('images/wallpaper.jpg');">
        
        <div class="main-content2">
            
                <div class="page-title"><h1>My Events</h1></div>
            
            <table>
                <thead>
                    <tr>
                        <th>Event ID</th>
                        <th>Title</th>
                        <th>Address</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Approval</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                       ArrayList<EventBean> eventList = (ArrayList<EventBean>) request.getAttribute("eventList");
                       if (eventList != null && !eventList.isEmpty()) {
                           for (int i = 0; i < eventList.size(); i++) {
                               EventBean e = (EventBean) eventList.get(i);
                    %>
                    <tr>
                        <td><%=e.getEventId()%></td>
                        <td><%=e.getTitle()%></td>
                        <td><%=e.getEventAdress()%></td>
                        <td><%=e.getStartingDate()%></td>
                        <td><%=e.getEndingDate()%></td>
                        <td><%=e.getStartingTime()%></td>
                        <td><%=e.getEndingTime()%></td>
                        <td><%=e.getEventApproval()%></td>
                        <td><a class="deleteBtn"href="Organizer_DeleteEventServlet?eventId=<%=e.getEventId()%>">Delete &nbsp&nbsp</a><a class="viewBtn"href="Organizer_EventDetailsServlet?eventId=<%=e.getEventId()%>">View</a></td>
                    </tr>
                    <% 
                            }
                        } else { 
                    %>
                    <tr>
                        <td colspan="9" style="text-align: center;">No events available</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
