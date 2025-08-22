<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Main_header.jsp" %>
<!DOCTYPE html>
<html>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

 <title>JSP Page</title>
 <style>
     body {
         margin: 0;
         padding: 0;
         font-family: 'Arial', sans-serif;
         background: url('images/wallpaper.jpg') no-repeat center center fixed;
         background-size: cover;
         color: #333;
         height: 100vh;
         display: flex;
         flex-direction: column;
     }


     .header {
         display: flex;
         justify-content: space-between;
         align-items: center;
         background: #4CAF50;
         padding: 15px 30px;
         color: white;
         position: sticky;
         top: 0;
         z-index: 1000;
     }

     .header h1 {
         margin: 0;
         font-size: 1.8em;
     }

     .header .auth-buttons {
         display: flex;
         gap: 15px;
     }

     .header .auth-buttons a {
         text-decoration: none;
         padding: 10px 20px;
         border-radius: 25px;
         font-size: 1em;
         color: white;
         transition: 0.3s;
     }

     .header .auth-buttons a:hover {
         opacity: 0.8;
     }


     .main-container {
         flex: 1;
         display: flex;
         justify-content: center;
         align-items: center;
     }

     .login-container {
         background-color: rgba(255, 255, 255, 0.8);
         padding: 40px;
         border-radius: 10px;
         box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
         width: 100%;
         max-width: 400px;
     }

     .login-container h2 {
         text-align: center;
         font-size: 2em;
         color: #134a19;
         margin-bottom: 30px;
     }

     .login-container form {
         display: flex;
         flex-direction: column;
     }

     .login-container input {
         height: 45px;
         padding: 0 15px;
         font-size: 1em;
         border: 1px solid #ccc;
         border-radius: 5px;
         width: 100%;
         box-sizing: border-box;
     }

     .login-container input[type="submit"] {
         background-color: #4CAF50;
         color: white;
         border: none;
         cursor: pointer;
         font-size: 1.2em;
         transition: background-color 0.3s;
     }

     .login-container input[type="submit"]:hover {
         background-color: #45a049;
     }


     @media (max-width: 768px) {
         .header h1 {
             font-size: 1.5em;
         }

         .login-container h2 {
             font-size: 1.8em;
         }

         .login-container input {
             font-size: 1em;
         }
     }
 </style>
</head>
<body>



    <div class="main-container">
        <div class="login-container">
            <h2>Login</h2>
            <form action="LoginServlet" method="POST">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required><br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br>
                <input type="submit" value="Login">
            </form>
        </div>
    </div>


</body>
</html>
