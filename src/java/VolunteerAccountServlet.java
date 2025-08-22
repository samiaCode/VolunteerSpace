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
import java.sql.*;
import java.util.*;

/**
 *
 * @author shamm
 */
@WebServlet(urlPatterns = {"/VolunteerAccountServlet"})
public class VolunteerAccountServlet extends HttpServlet {

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
        int userId = bean.getUserId(); // Get user_id from the request parameter
        ArrayList<EventBean> userEventsList = new ArrayList<EventBean>();

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
            String selectStmt = "SELECT e.event_id, e.title, e.starting_time, e.ending_time, "
                    + "e.starting_date, e.ending_date, e.event_address, e.coordinator_contact_number "
                    + "FROM volunteer_events ve "
                    + "INNER JOIN events e "
                    + "ON ve.EventID = e.event_id "
                    + "WHERE ve.VolunteerID = ?";

            preparedStatement = con.prepareStatement(selectStmt);
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            // Process the result
            while (rs.next()) {
                EventBean eventBean = new EventBean();
                eventBean.setEventId(rs.getInt("event_id"));
                eventBean.setTitle(rs.getString("title"));
                eventBean.setEventAdress(rs.getString("event_address"));
                eventBean.setCoordinatorContactNumber(rs.getString("coordinator_contact_number"));
                eventBean.setStartingTime(rs.getString("starting_time"));
                eventBean.setEndingTime(rs.getString("ending_time"));
                eventBean.setStartingDate(rs.getString("starting_date"));
                eventBean.setEndingDate(rs.getString("ending_date"));
                userEventsList.add(eventBean);
            }

        } catch (SQLException e) {
            System.err.println("Error connecting to DB: " + e.getMessage());
            return;
        }

// Set attribute for the request
        request.setAttribute("userEventsList", userEventsList);

        // 7. close the connection
        try {
            preparedStatement.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        RequestDispatcher rd = request.getRequestDispatcher("Volunteer_Account.jsp");
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
