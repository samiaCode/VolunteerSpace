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
import beans.FeedbackBean;
import beans.UserBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import java.sql.Time;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.*;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;

/**
 *
 * @author shamm
 */
@WebServlet(urlPatterns = {"/Volunteer_SubmitFeedbackServlet"})
public class Volunteer_SubmitFeedbackServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        UserBean bean = (UserBean) session.getAttribute("userBean");
        int userId = bean.getUserId();
       
        String content = (String) request.getParameter("feedback");

        //getting system time and date:
        java.util.Date utilDate = new java.util.Date();
        Date sqlDate = new Date(utilDate.getTime());
        Timestamp sqlTimestamp = new Timestamp(utilDate.getTime());

        //connect to Databse
        //1. define the database URL
        Connection con;
        PreparedStatement preparedStatement;
        String databaseURL = "jdbc:mysql://localhost:3306/volunteerspace";
        String userName = "root";
        String password = "root";
        String driverName = "com.mysql.cj.jdbc.Driver";

        try {
            //2. load the driver
            Class.forName(driverName);
            //3. get a connection
            con = DriverManager.getConnection(databaseURL, userName, password);

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        // 5. execute the querey
        try {
            String selectStmt = "INSERT INTO feedback (feedback_time, feedback_date, content, user_id) VALUES (?,?,?,?)";
            preparedStatement = con.prepareStatement(selectStmt);
            preparedStatement.setTimestamp(1, sqlTimestamp); // feedback_time
            preparedStatement.setDate(2, sqlDate);          // feedback_date
            preparedStatement.setString(3, content); // content (example)
            preparedStatement.setInt(4, userId);                  // user_id (example)
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error connecting to DB: " + e.getMessage());
            return;
        }

        // Set attribute for the request
        //request.setAttribute("userEventsList", userEventsList);
        // 7. close the connection
        try {
            preparedStatement.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        EventBean eventBean = (EventBean) request.getAttribute("EventBean");
        request.setAttribute("EventBean", eventBean);
        Boolean showPOP = true;
        request.setAttribute("show", showPOP);
        RequestDispatcher rd = request.getRequestDispatcher("Volunteer_Feedback.jsp");
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
        response.setCharacterEncoding("UTF-8");
        
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
