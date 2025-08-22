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

import beans.UserBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author samsa
 */
@WebServlet(urlPatterns = {"/EventRequestServlet"})
public class EventRequestServlet extends HttpServlet {

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

    if (bean == null) {
        response.sendRedirect("RequestEventPlacement.jsp?status=error&message=User+not+logged+in");
        return;
    }

    int userId = bean.getUserId();
    String title = request.getParameter("Title");
    String eventStatus = "Pending";
    String eventApproval = "Pending";
    String eventAddress = request.getParameter("location");
    int numberOfVolunteers = Integer.parseInt(request.getParameter("NumberOfVolunteers"));
    String startingDate = request.getParameter("starting_date");
    String endingDate = request.getParameter("end_date");
    String startingTime = request.getParameter("startTime");
    String endingTime = request.getParameter("endTime");
    String phonenumber = request.getParameter("phone");
    String volunteersGender = request.getParameter("volunteers_gender");
    String eventPicture = request.getParameter("event_picture");
    String description = request.getParameter("Event_Description");
    int adminId = 1;

    // Validate required parameters
    if (title == null || description == null || eventAddress == null ||
        phonenumber == null || startingTime == null || endingTime == null ||
        startingDate == null || endingDate == null || volunteersGender == null) {
        response.sendRedirect("RequestEventPlacement.jsp?status=error&message=Missing+required+parameters");
        return;
    }

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/volunteerspace", "root", "root");

        // Validate userId existence in users table
        String userCheckSql = "SELECT COUNT(*) FROM users WHERE user_id = ?";
        PreparedStatement userCheckStmt = con.prepareStatement(userCheckSql);
        userCheckStmt.setInt(1, userId);
        ResultSet rs = userCheckStmt.executeQuery();

        if (!rs.next() || rs.getInt(1) == 0) {
            response.sendRedirect("RequestEventPlacement.jsp?status=error&message=Invalid+organizer+ID");
            rs.close();
            userCheckStmt.close();
            con.close();
            return;
        }
        rs.close();
        userCheckStmt.close();

        // Insert query
        String sql = "INSERT INTO events (title, event_address, number_of_volunteers, starting_date, ending_date, starting_time, ending_time, coordinator_contact_number, volunteers_gender, description, event_status, event_picture, event_approval, organizer_id, admin_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, title);
        stmt.setString(2, eventAddress);
        stmt.setInt(3, numberOfVolunteers);
        stmt.setDate(4, Date.valueOf(startingDate));
        stmt.setDate(5, Date.valueOf(endingDate));
        stmt.setString(6, startingTime);
        stmt.setString(7, endingTime);
        stmt.setString(8, phonenumber);
        stmt.setString(9, volunteersGender);
        stmt.setString(10, description);
        stmt.setString(11, eventStatus);
        stmt.setString(12, eventPicture);
        stmt.setString(13, eventApproval);
        stmt.setInt(14, userId);
        stmt.setInt(15, adminId);

        // Execute the query
        stmt.executeUpdate();

        // Clean up
        stmt.close();
        con.close();

        response.sendRedirect("RequestEventPlacement.jsp?status=success&message=Event+created+successfully");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        response.sendRedirect("RequestEventPlacement.jsp?status=error&message=JDBC+driver+not+found");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("RequestEventPlacement.jsp?status=error&message=Database+error:+" + e.getMessage());
    }
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