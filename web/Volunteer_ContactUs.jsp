<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Volunteer_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
                color: #333;
            }


            .page-title-contact {
                text-align: center;
                margin: 20px 0;
                margin-top: 6rem;
            }

            .page-title-contact h1 {
                font-size: 24px;
                color: #4CAF50;
            }

            main {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: white;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }

            .contact-details {
                text-align: left;
            }

            .contact-details h2 {
                color: #333;
                margin-bottom: 15px;
            }

            .contact-details p {
                margin: 10px 0;
                font-size: 16px;
            }

            .contact-details a {
                color: #4CAF50;
                text-decoration: none;
            }

            .contact-details a:hover {
                text-decoration: underline;
            }

            @media (max-width: 768px) {
                .navbar a {
                    display: block;
                    margin: 5px 0;
                }

                main {
                    padding: 15px;
                }
            }
        </style>
    </head>
    <body>
        

        <div class="page-title-contact">
            <h1>Contact Us</h1>
        </div>

        <main>
            <section class="contact-details">
                <h2>Our Details:</h2>
                <p><strong>Email:</strong> <a href="mailto:VolunteerSpace@.com">VolunteerSpace@.com</a></p>
                <p><strong>Phone:</strong> <a href="tel:+971501234567">+971 50 123 4567 </a></p>
                <p><strong>Address:</strong> UAE University, Al Ain, UAE</p>
            </section>
        </main>
    </body>
</html>