<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->

<%@ page import="java.util.ArrayList" %>
<%@page import = "java.util.*" %>
<%@page session="true" %>
<%@page import = "beans.UserBean" %>
<%@page import = "beans.FeedbackBean" %>
<%@page import = "beans.EventBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.ResultSet" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="Volunteer_header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Page</title>
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            height: 100vh;
            background-color: #f4f4f9;
            align-items: flex-start;
        }

        .button-container {
            margin-top: 8rem;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .button-container a {
            width: 50rem;
            margin-top: 1rem;
            padding: 10px 20px;
            margin: 0.5rem 0;
            font-size: 16px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            background-color: rgb(109, 201, 232);
            color: white;
            font-weight: bold;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        .button-container a.SignOutBtn{
            width: 50rem;
            margin-top: 1rem;
            padding: 10px 20px;
            margin: 0.5rem 0;
            font-size: 16px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            background-color: rgb(207, 58, 58);
            color: white;
            font-weight: bold;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .button-container a:hover {
            background-color: rgb(84, 160, 186);
        }
        .button-container a.SignOutBtn:hover {
            background-color: rgb(120, 25, 25);
        }
        
    </style>
</head>
<body class="VolunteerOpPage">
    <div class="page-title"><h1>Account</h1></div>
    <div class="button-container">
        <a  href="${pageContext.request.contextPath}/Volunteer_AccountSetting.jsp">My Account</a>
        <a href="${pageContext.request.contextPath}/Volunteer_AccountServlet">Events Participated</a>
        <a href="${pageContext.request.contextPath}/Volunteer_Feedback.jsp">Feedback</a>
        <a href="${pageContext.request.contextPath}/SignOutServlet" class="SignOutBtn">Sign Out</a>
    </div>
</body>
</html>
