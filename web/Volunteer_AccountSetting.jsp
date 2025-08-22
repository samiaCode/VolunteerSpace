<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.UserBean"%>
<%@page session="true"%>
<%@include file="Volunteer_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
                color: #333;
            }

     
         
            form{
                margin-top: 40px;
                 margin-left: 354px;
                 margin-right: 354px;
            }


            .back a {
                text-decoration: none;
                background-color: #3e8e41;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .back a:hover {
                background-color: #2f6f31;
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                background-color: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            }

            .container h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            .accountInfoCon{
                margin-top: 8rem;
            }
            .form-group {
                margin-bottom: 15px;
                display: flex; 
                flex-direction: column; 
                align-items: left; 
                width: 100%;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-group .value {
                font-size: 16px;
                color: #555;
                background-color: #f4f4f4;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

   
            .profile-image {
                display: block;
                margin: 0 auto 20px;
                border-radius: 50%;
            }

        </style>
    </head>
    <body>


        <form action="UpdateAccount" method="post">

            <div class="accountInfoCon">
            <div class="form-group">
                <label for="ID">Name:</label>
                <input type="text" id="ID" name="userName" class="value" 
                       value="<%= ((UserBean) session.getAttribute("userBean")).getUserName() %>">
            </div>

            <div class="form-group">
                <label for="Email">Email:</label>
                <input type="email" id="Email" name="email" class="value" 
                       value="<%= ((UserBean) session.getAttribute("userBean")).getEmail() %>">
            </div>

            <div class="form-group">
                <label for="Contact_Number">Contact Number:</label>
                <input type="text" id="Contact_Number" name="contactNumber" class="value" 
                       value="<%= ((UserBean) session.getAttribute("userBean")).getContactNumber() %>">
            </div>

            <div class="form-group">
                <label for="DateOfBirth">Date Of Birth:</label>
                <input type="date" id="DateOfBirth" name="dob" class="value" 
                       value="<%= ((UserBean) session.getAttribute("userBean")).getDob() %>">
            </div>

            <div class="form-group">
                <label for="Address">Address:</label>
                <input type="text" id="Address" name="address" class="value" 
                       value="<%= ((UserBean) session.getAttribute("userBean")).getAddress() %>">
            </div><br><br>

            <div class="form-group">
                
                <button type="submit" style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer;">
                    Update Profile
                </button>
            </div>
            </div>
        </form>
    </body>
</html>