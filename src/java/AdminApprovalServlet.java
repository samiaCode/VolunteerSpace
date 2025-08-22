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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AdminApprovalServlet", urlPatterns = {"/AdminApprovalServlet"})
public class AdminApprovalServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String eventId = request.getParameter("event_id");
        String action = request.getParameter("action");
        String newStatus = action.equalsIgnoreCase("Approve") ? "Approved" : "Rejected";

        String query = "UPDATE events SET event_approval = ? WHERE event_id = ?";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/volunteerspace", "root", "root")) {
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, newStatus);
                stmt.setString(2, eventId);
                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    System.out.println("Event updated successfully.");
                } else {
                    System.out.println("No event found with the given ID.");
                }
            }
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("SQL error: " + e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect("AdminDashboardServlet");
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     */
    @Override
    public String getServletInfo() {
        return "Handles event  by the admin.";
    }
}
