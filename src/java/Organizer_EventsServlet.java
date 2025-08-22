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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;

/**
 *
 * @author samsa
 */
@WebServlet(urlPatterns = {"/Organizer_EventsServlet"})
public class Organizer_EventsServlet extends HttpServlet {

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
        ArrayList<EventBean> eventList = new ArrayList<EventBean>();
        PreparedStatement pstmt;
        HttpSession session = request.getSession();
        UserBean bean = (UserBean) session.getAttribute("userBean");
        int userId = bean.getUserId(); // Get user_id from the request parameter

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
            String selectStmt = "SELECT * FROM events WHERE organizer_id=?";
            pstmt = con.prepareStatement(selectStmt);
             pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            //6. process the result
            while (rs.next()) {
                EventBean eventBean = new EventBean();
                eventBean.setEventId(rs.getInt("event_id"));
                eventBean.setTitle(rs.getString("title"));
                eventBean.setEventStatus(rs.getString("event_status"));
                eventBean.setDescription(rs.getString("description"));
                eventBean.setEventAdress(rs.getString("event_address"));
                eventBean.setCoordinatorContactNumber(rs.getString("coordinator_contact_number"));
                eventBean.setStartingTime(rs.getString("starting_time"));
                eventBean.setEndingTime(rs.getString("ending_time"));
                eventBean.setStartingDate(rs.getString("starting_date"));
                eventBean.setEndingDate(rs.getString("ending_date"));
                eventBean.setEventApproval(rs.getString("event_approval"));
                eventBean.setNumberOfVolunteers(rs.getInt("number_of_volunteers"));
                eventBean.setVolunteersGender(rs.getString("volunteers_gender"));
                eventBean.setOrganizerId(rs.getInt("organizer_id"));
                eventBean.setAdminId(rs.getInt("admin_id"));
                eventList.add(eventBean);

            }

        } catch (SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        request.setAttribute("eventList", eventList);

        // 7. close the connection
        try {
            stmt.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        RequestDispatcher rd = request.getRequestDispatcher("Organizer_Events.jsp");
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
