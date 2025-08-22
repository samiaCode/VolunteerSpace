<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page session="true" %>
<%@page import = "beans.UserBean" %>
<%@page import = "beans.FeedbackBean" %>
<%@page import = "beans.EventBean" %>
<%@include file="Admin_header.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Event Details</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
            body {
                  margin: 0;
                padding: 0;
                 font-family: 'Poppins', sans-serif;
                background: #ffffff;
                background-size: cover;
                color: #333;
            }
            .container {
                max-width: 800px;
                margin: 50px auto;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            .event-details, .roles, .conditions {
                margin-bottom: 20px;
            }
            .event-details p, .roles ul, .conditions ul {
                margin: 10px 0;
            }
            .roles ul, .conditions ul {
                list-style: none;
                padding: 0;
            }
            .roles li, .conditions li {
                background: #f4f4f9;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-bottom: 5px;
            }
            .btn {
                display: block;
                text-align: center;
                background-color: rgb(209, 57, 46);
                color: #fff;
                text-decoration: none;
                padding: 10px 15px;
                border-radius: 5px;
                font-weight: bold;
                margin-top: 20px;
            }
            .btn:hover {
                background-color: rgb(130, 52, 47);
            }
        </style>
    </head>
      <body class="VolunteerOpPage">
 <div class="container">
          <% EventBean bean = (EventBean) request.getAttribute("EventBean");
            %>
              <h1>Event Details</h1>

     <div class="event-details">
         <p><strong>Title:</strong> <%=bean.getTitle()%></p>
         <p><strong>Description:</strong> <%=bean.getDescription()%></p
         <p><strong>Address:</strong> <%=bean.getEventAdress()%></p>
         <p><strong>Starting Time:</strong> <%=bean.getStartingTime()%></p>
         <p><strong>Ending Time:</strong> <%=bean.getEndingTime()%></p>
         <p><strong>Starting Date:</strong> <%=bean.getStartingDate()%></p>
         <p><strong>Ending Date:</strong> <%=bean.getEndingDate()%></p>
         <p><strong>Number of Volunteers:</strong> <%=bean.getNumberOfVolunteers()%></p>
         <p><strong>Volunteers' Gender:</strong> <%=bean.getVolunteersGender()%></p>
         <p><strong>Coordinator contact number:</strong> <%=bean.getCoordinatorContactNumber()%></p>
     </div>
     <a href="Admin_DeleteEventServlet?eventId=<%=bean.getEventId()%>" class="btn" >Delete Event</a>

 </div>
</div>  
</body>

</html>