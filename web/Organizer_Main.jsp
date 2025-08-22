<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@page import = "beans.UserBean" %>
<%@page import = "beans.EventBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Organizer_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Organizer Page</title>
       
        <style>
          
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                color: #333;


                background: url('p2.jpg') no-repeat center center fixed;
                background-size: cover;
            }



            .content {
                margin-top: 70px; 
            }

        
            .container {
                max-width: 1000px;
                margin: 50px auto;
                text-align: center;
                padding: 0 20px;
            }
            .services {
                display: flex;
                justify-content: space-around;
                flex-wrap: wrap;
            }
            .service-box {
                background-color: #fcf3cf;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 30%;
                margin: 25px;
                padding: 50px;
                transition: transform 0.7s, box-shadow 0.7s;
            }
            .service-box:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 16px rgba(1, 1, 1, 0.9);
            }
            .service-box h2 {
                color: #eb984e;
                margin-bottom: 15px;
            }
            .service-box p {
                color: #777;
            }
            .service-box a {
                display: block;
                margin: 20px 0 0;
                padding: 10px 10px;
                background-color: #eb984e;
                color: #167655;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .service-box a:hover {
                background-color: #0056b3;
            }
            @media (max-width: 768px) {
                .services {
                    flex-direction: column;
                }
                .service-box {
                    width: 100%;
                }
            }

        
            .welcome-text {
                color: #e87917;
            }
        </style>
    </head>
    <body>
        <% UserBean bean = (UserBean) session.getAttribute("userBean"); %>


        <div class="content">
            <div class="container">

                <h1 class="welcome-text">Welcome, <%= bean.getUserName() %>!</h1>

                <div class="services">
                    <div class="service-box">
                        <h2>Request Event Placement</h2>
                        <p>Request an event placement.</p>
                        <a href="RequestEventPlacement.jsp">Learn More</a>
                    </div>
                    <div class="service-box">
                        <h2>My Events</h2>
                        <p>Track and manage all the events.</p>
                        <a href="Organizer_EventsServlet">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>