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
import java.io.PrintWriter;
import java.io.*;
import java.util.*;
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
@WebServlet(urlPatterns = {"/updateEvents"})
public class UpdateEventServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventId = request.getParameter("event_id");

        if (eventId == null || eventId.isEmpty()) {
            request.setAttribute("error", "No event ID provided!");
            request.getRequestDispatcher("updateEvent.jsp").forward(request, response);
            return;
        }

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/volunteerspace", "root", "root"); PreparedStatement stmt = con.prepareStatement("SELECT * FROM events WHERE event_id = ?")) {

            stmt.setInt(1, Integer.parseInt(eventId));
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Pass event details as request attributes
                request.setAttribute("event_id", rs.getInt("event_id"));
                request.setAttribute("title", rs.getString("title"));
                request.setAttribute("event_address", rs.getString("event_address"));
                request.setAttribute("number_of_volunteers", rs.getInt("number_of_volunteers"));
                request.setAttribute("starting_date", rs.getDate("starting_date").toString());
                request.setAttribute("ending_date", rs.getDate("ending_date").toString());
                request.setAttribute("starting_time", rs.getString("starting_time"));
                request.setAttribute("ending_time", rs.getString("ending_time"));
            } else {
                request.setAttribute("error", "Event not found!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }

        // Forward the request to the JSP
        request.getRequestDispatcher("updateEvent.jsp").forward(request, response);
    }
}
