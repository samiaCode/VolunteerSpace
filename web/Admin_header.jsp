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
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
    </head>
    <body>
         <header class="header">
            <h1>Volunteer Space</h1>
            <nav class="navbar">
                <a href="${pageContext.request.contextPath}/Admin_Main.jsp">HOME</a>
                <a href="${pageContext.request.contextPath}/AdminServlet">Events</a>
                <a href="${pageContext.request.contextPath}/Admin_UsersServlet">Users</a>
                <a href="${pageContext.request.contextPath}/Admin_FeedbackServlet">Feedback</a>
                <a href="${pageContext.request.contextPath}/AdminDashboardServlet">Requests</a>
                <a href="Admin_Account.jsp">Account</a>
            </nav>
        </header>
    </body>
</html>
