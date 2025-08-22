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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author M
 */
@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            UserBean bean = new UserBean();

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/volunteerspace", "root", "root");

                String query = "SELECT * FROM users WHERE email = ? AND user_password = ?";
                try (PreparedStatement stmt = con.prepareStatement(query)) {
                    stmt.setString(1, email);
                    stmt.setString(2, password);

                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        bean.setUserId(rs.getInt("user_id"));
                        bean.setUserName(rs.getString("user_name"));
                        String role = rs.getString("role");
                        bean.setRole(role);
                        bean.setEmail(rs.getString("email"));
                        bean.setAddress(rs.getString("address"));
                        bean.setGender(rs.getString("gender"));
                        bean.setDob(rs.getString("date_of_birth"));
                        bean.setContactNumber(rs.getString("contact_number"));
                        bean.setOrganizationName(rs.getString("organization_name"));


                        HttpSession session = request.getSession();
                        session.setAttribute("userBean", bean);
                        
                        if ("Admin".equals(role)) {
                            request.getRequestDispatcher("Admin_Main.jsp").forward(request, response);
                        } else if ("Volunteer".equals(role)) {
                            request.getRequestDispatcher("Volunteer_Main.jsp").forward(request, response);
                        } else if ("Organizer".equals(role)) {
                            request.getRequestDispatcher("Organizer_Main.jsp").forward(request, response);
                        } else {
                            response.sendRedirect("Error.jsp");
                        }
                    } else {
                        out.println("<h2>Invalid email or password!</h2>");
                    }
                } catch (Exception e) {
                    out.println("<h1>Error executing query: " + e.getMessage() + "</h1>");
                } finally {
                    con.close();
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println("<h1>Database connection error: " + e.getMessage() + "</h1>");
            }

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
