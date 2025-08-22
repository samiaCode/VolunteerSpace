/*
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
 */

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import beans.EventBean;
import beans.UserBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author samsa
 */
@WebServlet(urlPatterns = {"/Admin_UsersServlet"})
public class Admin_UsersServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        //connect to Databse
        //1. define the database URL
        Connection con;
        Statement stmt;
        String databaseURL = "jdbc:mysql://localhost:3306/volunteerspace";
        String userName = "root";
        String password = "root";
        String driverName = "com.mysql.cj.jdbc.Driver";
        ArrayList<UserBean> userList = new ArrayList<UserBean>();

        try {
            //2. load the driver
            Class.forName(driverName);
            //3. get a connection
            con = DriverManager.getConnection(databaseURL, userName, password);
            // 4. create a statement
            stmt = con.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        // 5. execute the querey
        try {
            String selectStmt = "SELECT * FROM users";
            ResultSet rs = stmt.executeQuery(selectStmt);
            System.out.println("Look at this" + rs);

            //6. process the result
            while (rs.next()) {
                UserBean bean = new UserBean();
                bean.setUserId(rs.getInt("user_id"));
                bean.setUserName(rs.getString("user_name"));
                bean.setEmail(rs.getString("email"));
                bean.setContactNumber(rs.getString("contact_number"));
                bean.setAddress(rs.getString("address"));
                bean.setRole(rs.getString("role"));
                bean.setGender(rs.getString("gender"));
                bean.setDob(rs.getString("date_of_birth"));
                bean.setOrganizationName(rs.getString("organization_name"));
                userList.add(bean);

            }

        } catch (SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        request.setAttribute("userList", userList);

        // 7. close the connection
        try {
            stmt.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        RequestDispatcher rd = request.getRequestDispatcher("Admin_Users.jsp");
        rd.forward(request, response);
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
