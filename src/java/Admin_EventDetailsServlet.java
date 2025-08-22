
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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author samsa
 */
@WebServlet(urlPatterns = {"/Admin_EventDetailsServlet"})
public class Admin_EventDetailsServlet extends HttpServlet {

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
         String eventId= request.getParameter("eventId");
        Connection con;
        Statement stmt;
        String databaseURL = "jdbc:mysql://localhost:3306/volunteerspace";
        String userName = "root";
        String password = "root";
        String driverName = "com.mysql.cj.jdbc.Driver";
        EventBean event = new EventBean();
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
            String query = "SELECT * FROM events WHERE event_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(eventId));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                event.setEventId(rs.getInt("event_id"));
                event.setNumberOfVolunteers(rs.getInt("number_of_volunteers"));
                event.setOrganizerId(rs.getInt("organizer_id"));
                event.setAdminId(rs.getInt("admin_id"));
                event.setTitle(rs.getString("title"));
                event.setEventStatus(rs.getString("event_status"));
                event.setDescription(rs.getString("description"));
                event.setEventAdress(rs.getString("event_address"));
                event.setCoordinatorContactNumber(rs.getString("coordinator_contact_number"));
                event.setVolunteersGender(rs.getString("volunteers_gender"));
                event.setStartingTime(rs.getString("starting_time"));
                event.setEndingTime(rs.getString("ending_time"));
                event.setStartingDate(rs.getString("starting_date"));
                event.setEndingDate(rs.getString("ending_date"));
            }
        } catch (SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        request.setAttribute("eventBean", event);
        // 7. close the connection
        try {
            stmt.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error connecting to DB" + e);
            return;
        }
        Boolean showPOP =(Boolean)request.getAttribute("show");
        request.setAttribute("show", showPOP);
        request.setAttribute("EventBean", event);
        RequestDispatcher rd = request.getRequestDispatcher("Admin_ViewEventDetails.jsp");
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
