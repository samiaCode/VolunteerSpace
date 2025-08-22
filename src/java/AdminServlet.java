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
@WebServlet(urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

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
            String selectStmt = "SELECT * FROM events";
            ResultSet rs = stmt.executeQuery(selectStmt);
            System.out.println("Look at this" + rs);

            //6. process the result
            while (rs.next()) {
                System.out.println("Look at this" + rs);
                EventBean bean = new EventBean();
                bean.setEventId(rs.getInt("event_id"));
                bean.setTitle(rs.getString("title"));
                bean.setEventStatus(rs.getString("event_status"));
                bean.setDescription(rs.getString("description"));
                bean.setEventAdress(rs.getString("event_address"));
                bean.setCoordinatorContactNumber(rs.getString("coordinator_contact_number"));
                bean.setStartingTime(rs.getString("starting_time"));
                bean.setEndingTime(rs.getString("ending_time"));
                bean.setStartingDate(rs.getString("starting_date"));
                bean.setEndingDate(rs.getString("ending_date"));
                bean.setEventApproval(rs.getString("event_approval"));
                bean.setNumberOfVolunteers(rs.getInt("number_of_volunteers"));
                bean.setVolunteersGender(rs.getString("volunteers_gender"));
                bean.setOrganizerId(rs.getInt("organizer_id"));
                bean.setAdminId(rs.getInt("admin_id"));
                eventList.add(bean);

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
        RequestDispatcher rd = request.getRequestDispatcher("Admin_Events.jsp");
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
