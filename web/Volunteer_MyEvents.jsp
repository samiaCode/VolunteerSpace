<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="beans.UserBean"%>
<%@page import = "beans.EventBean" %>
<%@page import="java.util.ArrayList"%>
<%@page session="true"%>
<%@include file="Volunteer_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
    </head>
    <body>
               <div class="container">

            <title>Volunteer Participation</title>

            <style>
                table {
                    width: 80%;
                    margin: auto;
                    margin-top: 1rem;
                    border-collapse: collapse;
                }
                table, th, td {
                    border: 1px solid black;
                }
                th, td {
                    padding: 10px;
                    text-align: left;
                }
                .deleteBtn {
                color: red;
            }
             .deleteBtn:hover {
                background-color: red;
                color: white;
            }
            .page-title{
                margin-top:8rem;
            }
            </style>
             <div class="page-title"><h1>My Event Participation</h1></div>
            <table>
                <thead>
                    <tr>
                        <th>Event Title</th>
                        <th>Address</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Starting Time</th>
                        <th>Ending Time</th>
                        <th>Coordinator Number</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <% 
                    ArrayList<EventBean> userEventsList = (ArrayList)request.getAttribute("userEventsList");
                    
                     if (userEventsList != null && !userEventsList.isEmpty()) {
                     for (EventBean event : userEventsList) {
                    %>
                    <tr>
                        <td><%=event.getTitle()%></td>
                        <td><%=event.getEventAdress()%></td>
                        <td><%=event.getStartingDate()%></td>
                        <td><%=event.getEndingDate()%></td>
                        <td><%=event.getStartingTime()%></td>
                        <td><%=event.getEndingTime()%></td>
                        <td><%=event.getCoordinatorContactNumber()%></td>
                        <td><a class="deleteBtn"href="Volunteer_CancelEventServlet?eventId=<%=event.getEventId()%>">Cancel</a></td>
                    </tr>
                    <% 
                                 }
                             } else { 
                    %>
                    <tr>
                        <td colspan="8" style="text-align: center;">You didn't participate in events yet :)</td>
                    </tr>
                    <% } %>
                </tbody>

            </table>
    </body>
</html>
