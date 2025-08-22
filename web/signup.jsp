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
    <head>
        <title>Sign Up - Volunteer Space</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

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
                margin-top: 3rem;
            }

            .signup-container {
                background-color: rgba(255, 255, 255, 0.8);
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }

            .signup-container h2 {
                text-align: center;
                font-size: 2em;
                color: #134a19;
                margin-bottom: 30px;
            }

            .signup-container form {
                display: flex;
                flex-direction: column;
            }

            .signup-container input {
                height: 45px;
                padding: 0 15px;
                font-size: 1em;
                border: 1px solid #ccc;
                border-radius: 5px;
                width: 100%;
                box-sizing: border-box;
            }

            .signup-container input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 1.2em;
                transition: background-color 0.3s;
            }

            .signup-container input[type="submit"]:hover {
                background-color: #45a049;
            }



@media (max-width: 768px) {
    .header h1 {
        font-size: 1.8em; 
    }
    .main-content h2 {
        font-size: 2.2em; 
    }
    .main-content p {
        font-size: 1.2em; 
    }
}
        </style>
        
    </head>
    <body>



        <div class="main-container">
            <div class="signup-container">
                <h2>Sign Up</h2>
                <form action="SignupServlet" method="POST">
                    
          
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required><br>

                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" required><br>
                    
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" title="The password should contain: 1.one number and one uppercase and lowercase letter 2. At least 8 or more characters" required>

                    <label for="phone">Contact Number:</label>
                    <input type="tel" id="phone" name="phone" placeholder="05X-XXX-XXXX" pattern="[0-5]{3}-[0-9]{3}-[0-9]{4}" required><br>

                    <label for="DOB">Date Of Birth:</label>
                    <input type="date" id="DOB" name="DOB"><br>

                    <label for="Address">Address:</label>
                    <input type="text" id="Address" name="Address"><br>

                    <label for="Gender">Gender:</label>
                    <select id="Gender" name="Gender">
                         <option value="">Select gender</option>
                        <option value="Female">Female</option>
                        <option value="Male">Male</option>
                    </select><br>

                    <label for="role">Role:</label>
                    <select id="role" name="role" required>
                        <option value="">Select role</option>
                        <option value="Admin">Admin</option>
                        <option value="Volunteer">Volunteer</option>
                        <option value="Organizer">Organizer</option>
                    </select><br>

                    <label for="organizationname">Organization Name:</label>
                    <input type="text" id="organizationname" name="organizationname" placeholder="Optional"> <br>

                    <input type="submit" value="Sign Up">
                </form>
            </div>
        </div>


    </body>
</html>
