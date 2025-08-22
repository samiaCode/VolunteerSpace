<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.UserBean"%>
<%@page import = "beans.EventBean" %>
<%@page import="java.util.ArrayList"%>
<%@page session="true"%>
<%@include file="Volunteer_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .feedback-container {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .feedback-container h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .feedback-container label {
            display: block;
            margin-bottom: 10px;
            color: #555;
            font-weight: bold;
        }

        .feedback-container textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .feedback-container button {
            display: block;
            width: 100%;
            background: #007BFF;
            color: #ffffff;
            border: none;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .feedback-container button:hover {
            background: #0056b3;
        }

        .feedback-container .message {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
            color: #28a745;
        }
    </style>
</head>
<body>

    <div class="feedback-container">
        <h1>Feedback Form</h1>
        <form id="feedbackForm"
              action="Volunteer_SubmitFeedbackServlet">
            <label for="feedback">Your Feedback</label>
            <textarea id="feedback" name="feedback" placeholder="Write your feedback here..." required></textarea>
            <a href="Volunteer_SubmitFeedbackServlet"><button type="submit">Submit</button></a>
        </form>
        <div class="message" id="message"></div>
    </div>
  <% 
        Boolean showPop = (Boolean) request.getAttribute("show");
        if (showPop != null && showPop) { 
        %>
        <script type="text/javascript">
            swal("Success!", "Thank you for your feedback!", "success");
        </script>
        <% } %>

</body>
</html>
