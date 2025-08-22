/*
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
 */

import beans.EventBean;
import jakarta.enterprise.event.Event;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet for handling the admin dashboard functionality.
 */
@WebServlet(urlPatterns = {"/AdminDashboardServlet"})
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = "SELECT * FROM events WHERE event_approval = 'Pending'";
        ArrayList<EventBean> pendingEvents = new ArrayList<>();

        try {
// Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

// Connect to the database and execute the query
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/volunteerspace", "root", "root"); 
PreparedStatement stmt = conn.prepareStatement(query); 
ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {

                    EventBean event = new EventBean();
                    event.setEventId(rs.getInt("event_id"));
                    event.setTitle(rs.getString("title"));
                    event.setDescription(rs.getString("description"));
                    event. setEventAdress(rs.getString("event_address"));
                    event.setStartingDate(rs.getString("starting_date"));
                    event.setEndingDate(rs.getString("ending_date"));
                    event.setCoordinatorContactNumber(rs.getString("coordinator_contact_number"));
                    event.setEventPicture(rs.getString("event_picture"));
                    pendingEvents.add(event);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while retrieving pending events: " + e.getMessage());
        }

// Pass the list of pending events to the JSP
        request.setAttribute("pendingEvents", pendingEvents);
        request.getRequestDispatcher("Admin_PendingEventApprovals.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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


