<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@page import = "java.util.*" %>
<%@page session="true" %>
<%@page import = "beans.UserBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@include file="Organizer_header.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
<style>
            /* General Styling */
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
                color: #333;
            }
 
           
 
            /* Profile Container Styling */
            .container {
                max-width: 600px;
                margin: 50px auto;
                margin-top: 8rem;
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
 
            .form-group {
                margin-bottom: 15px;
            }
 
            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }
 
            .form-group input, .form-group .value {
                font-size: 16px;
                color: #555;
                background-color: #f4f4f4;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                width: 100%;
            }
 
            .form-actions {
                text-align: center;
                margin-top: 20px;
            }
 
            .form-actions button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 18px;
                font-weight: bold;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s;
            }
 
            .form-actions button:hover {
                background-color: #3e8e41;
            }
</style>
</head>
<body>
<% UserBean bean = (UserBean) session.getAttribute("userBean"); %>
 
 
        <div class="container">

            <!-- Form to Update User Information -->
<form action="UpdateProfileServlet" method="post">
<div class="form-group">
<label for="name">Name:</label>
<input type="text" name="name" id="name" value="<%=bean.getUserName()%>">
</div>
 
                <div class="form-group">
<label for="Email">Email:</label>
<input type="email" name="email" id="Email" value="<%=bean.getEmail()%>">
</div>
 
                <div class="form-group">
<label for="Contact_Number">Contact Number:</label>
<input type="text" name="contactNumber" id="Contact_Number" value="<%=bean.getContactNumber()%>">
</div>
 
                <div class="form-group">
<label for="DateOfBirth">Date Of Birth:</label>
<input type="date" name="dob" id="DateOfBirth" value="<%=bean.getDob()%>">
</div>
 
                <div class="form-group">
<label for="Address">Address:</label>
<input type="text" name="address" id="Address" value="<%=bean.getAddress()%>">
</div>
 
                <div class="form-group">
<label for="OrganizationName">Organization Name:</label>
<input type="text" name="organizationName" id="OrganizationName" value="<%=bean.getOrganizationName()%>">
</div>
 
                <div class="form-actions">
<button type="submit">Update Profile</button>
</div>
</form>
 <a href="${pageContext.request.contextPath}/SignOutServlet" class="SignOutBtn"
             style="width: 100%; padding: 10px 20px; background-color: rgb(207, 58, 58); color: white; border: none; border-radius: 5px; cursor: pointer;">
                    Sign Out
            </a>
</div>

</body>
</html>