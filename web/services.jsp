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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <title>organizer page</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 50px auto;
            text-align: center;
            padding: 0 20px; /* Add some padding for smaller screens */
        }
        .services {
            display: flex;
            justify-content: space-around;
            flex-wrap: nowrap; /* Ensure items do not wrap */
        }
        .service-box {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 30%;
            margin: 15px;
            padding: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
            flex: 1 1 auto; /* Allow flexibility in sizing */
        }
        .service-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .service-box h2 {
            color: #333;
            margin-bottom: 15px;
        }
        .service-box p {
            color: #777;
        }
        .service-box a {
            display: block;
            margin: 20px 0 0;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .service-box a:hover {
            background-color: #0056b3;
        }
        @media (max-width: 768px) {
            .services {
                flex-direction: column; /* Stack vertically on smaller screens */
            }
            .service-box {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Our Services</h1>
        <div class="services">
            <div class="service-box">
                <h2>Request Event Placement</h2>
                <p>Request an event placement.</p>
                <a href="RequestEventPlacement.jsp">Learn More</a>
            </div>
            <div class="service-box">
                <h2>My Events</h2>
                <p>Track and manage all the events .</p>
                <a href="Event.jsp">Learn More</a>
            </div>
            <div class="service-box">
                <h2>Opportunities</h2>
                <p>Discover new opportunities to volunteer and participate in events .</p>
                <a href="#">Learn More</a>
            </div>
        </div>
    </div>
</body>
</html>
