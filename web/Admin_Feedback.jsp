<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="beans.FeedbackBean"%> 
<%@include file="Admin_header.jsp" %>

<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback</title>
    <style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #d9e8c2; 
    }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header h1 {
            margin: 0;
            font-size: 18px; 
            white-space: nowrap; 
        }


   

        main {
            padding: 20px;
        }

        section {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
           
            background-color: white; 
        }

        table th {
            background-color: #f2f2f2; 
            text-align: left;
        }

        table td {
            background-color: white; 
            padding: 8px;
            border: 1px solid #ddd; 
        }

        form {
            margin-top: 20px;
        }

        form label {
            margin-right: 10px;
        }

        form input {
            padding: 5px;
            margin-right: 10px;
        }

        form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #45a049;
        }
    </style>
    </head>
    <header>
        <h1>Volunteer Space</h1>
            <nav class="navbar">
                <a href="Admin_Main.jsp">HOME</a>
                <a href="Events.jsp">Events</a>
                <a href="${pageContext.request.contextPath}/Users.jsp">Users</a>
                <a href="${pageContext.request.contextPath}/Admin_Feedback.jsp">Feedback</a>
                <a href="Admin_Account.jsp">Account</a>
            </nav>
    </header>
        <main>
            <h2>Users Feedback</h2>
            <table>
                <thead>
                    <tr>
                        <th>Feedback ID</th>
                        <th>User ID</th>
                        <th>Feedback Time</th>
                        <th>Feedback Date</th>
                        <th>Content</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<FeedbackBean> feedbackList = (List<FeedbackBean>) request.getAttribute("feedbackList");
                    
                        if (feedbackList != null && !feedbackList.isEmpty()) {
                            for (FeedbackBean feedback : feedbackList) {
                    %>
                    <tr>
                        <td><%= feedback.getFeedbackID() %></td>
                        <td><%= feedback.getUserId() %></td>
                        <td><%= feedback.getFeedbackTime() %></td>
                        <td><%= feedback.getFeedbackDate() %></td>
                        <td><%= feedback.getContent() %></td>
                    </tr>
                    <% 
                            }
                        } else { 
                    %>
                    <tr>
                        <td colspan="5" style="text-align: center;">No feedback available</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </main>
    </body>
</html>