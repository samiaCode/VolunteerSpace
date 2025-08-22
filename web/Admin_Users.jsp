<!--
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
-->
<%@page import="java.util.*"%>
<%@page import="beans.UserBean"%>
<%@include file="Admin_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
            text-align: left;
        }

        button {
            padding: 5px 10px;
            cursor: pointer;
        }

        h2 {
            margin-top: 30px;
        }
        .deleteBtn {
                color: red;
            }
            .deleteBtn:hover {
                background-color: red;
                color: white;
            }
        body {
    display: flex;
    flex-direction: column; /* Stacks items vertically */
    align-items: center; /* Centers horizontally */
    justify-content: flex-start; /* Aligns items to the top vertically */
    height: 100vh; /* Full viewport height */
    margin: 0; /* Removes default margin */
}
    </style>
</head>
<body class="AdminMain" style="background-image: url('images/wallpaper.jpg');">
    <div class="main-content2">
        <form method="post" action="${pageContext.request.contextPath}/Admin_DeleteUserServlet">
            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId" required>
            <button type="submit">Delete User</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% 
                ArrayList<UserBean> userList = (ArrayList<UserBean>) request.getAttribute("userList");
                if (userList != null && !userList.isEmpty()) {
                    for (UserBean user : userList) {
            %>
                    <tr>
                        <td><%=user.getUserId()%></td>
                        <td><%=user.getUserName()%></td>
                        <td><%=user.getEmail()%></td>
                        <td><%=user.getRole()%></td>
                         <td><a class="deleteBtn"href="Admin_DeleteUserServlet?userId=<%=user.getUserId()%>">Delete</a></td>
                    </tr>
            <% 
                    }
                } else { 
            %>
                <tr>
                    <td colspan="4" style="text-align: center;">No users available</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>


