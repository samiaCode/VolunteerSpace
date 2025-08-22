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
                color: yellow;
            }


            .header .auth-buttons a:hover {
                opacity: 0.8;
            }

            .main-content {
                text-align: left;
                padding: 20px;
                color: #134a19;
                max-width: 600px;
                width: 100%;
                background-color: rgba(255, 255, 255, 0.8);
                border-radius: 10px;
                margin-top: 20px;
            }


            .main-content h2 {
                font-size: 2.5em;
                color: #134a19;
                margin-bottom: 20px;
            }

            .main-content p {
                font-size: 1.2em;
                line-height: 1.6;
                color: #134a19;
                margin: 0;
                padding: 0;
            }

            .footer {
                background: #333;
                color: #f0f0f0;
                text-align: center;
                padding: 10px 0;
                position: absolute;
                width: 100%;
                bottom: 0;
            }
            .footer p {
                margin: 0;
                font-size: 0.9em;
            }

            @media (max-width: 768px) {
                .header h1 {
                    font-size: 1.5em;
                }
                .main-content h2 {
                    font-size: 2em;
                }
                .main-content p {
                    font-size: 1em;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">
            <h2>Welcome to Volunteer Space</h2>
            <p>
                Discovering volunteering opportunities can be challenging,as people usually need to check multiple sources to know if there are any volunteering opportunities.
                our platform will make this process easier by connecting you to plenty of opportunities to give back and make difference in the community.</p>
            <br>
            <p>Together, we can achieve great things!</p>

        </div>

    </body>
</html>
