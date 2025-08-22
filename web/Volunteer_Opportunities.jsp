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
<%@include file="Volunteer_header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <d>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Opportunities Page</title>
    </head>
    <body class="VolunteerOpPage">
        <div class="page-title"><h1>Opportunities in UAE</h1></div>
        <div class="search">
            <h2>Search Opportunities</h2>
            <div class="search-container">
                <form action="" class="search-form">
                    <input type="search" class="search-box" id="search-box" placeholder="search here...">
                    <button type="submit">Search</button>
                </form>
            </div>
        </div>
        <div class="box-container">
            <% 
           ArrayList<EventBean> eventList = (ArrayList<EventBean>) request.getAttribute("eventList");
           if (eventList != null && !eventList.isEmpty()) {
               for (int i = 0; i < eventList.size(); i++) {
                   EventBean e = (EventBean) eventList.get(i);
            %>
            <div class="box-event">
                <img src="image/feature-img-1.png" alt="Event image">
                <div name="eventId"style="display: none;" value="<%=e.getEventId()%>"><%=e. getEventId()%></div>
                <h3><%=e.getTitle()%></h3>
                <p><%=e.getEventAdress()%></p>
                <p><%=e.getStartingDate()%></p>
                <p><%=e.getStartingTime()%></p>
                <a href="VolunteerEventDetailsServlet?eventId=<%=e.getEventId()%>" class="btn">read more</a>
            </div>
            <% 
     }
 } else { 
            %>
            <div>No opportunities available at the moment.</div>
            <% } %>

    </body>
</html>
