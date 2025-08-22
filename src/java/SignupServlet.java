/*
Group members:
Samia Salem Qasem - 201917135
Shamma Mohammed Almansoori - 202115033
Maryam Mohammed Alderei - 202116892
Reem Salman Almarzooqi - 201880578
 */

import beans.UserBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author M
 */
@WebServlet(urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

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
        UserBean bean = new UserBean();
        try (PrintWriter out = response.getWriter()) {

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phonenumber = request.getParameter("phone");
            String Dateofbirth = request.getParameter("DOB");
            String address = request.getParameter("Address");
            String gender = request.getParameter("Gender");
            String role = request.getParameter("role");
            String organizationname = request.getParameter("organizationname");

            bean.setUserName(name);
            bean.setRole(role);
            bean.setEmail(email);
            bean.setAddress(address);
            bean.setGender(gender);
            bean.setDob(Dateofbirth);
            bean.setContactNumber(phonenumber);
            bean.setOrganizationName(organizationname);
            HttpSession session = request.getSession();
            session.setAttribute("userBean", bean);

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/volunteerspace", "root", "root");
                String query = "INSERT INTO users (user_name, email,user_password,contact_number,date_of_birth,address,gender,role,organization_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = con.prepareStatement(query)) {
                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.setString(3, password);
                    stmt.setString(4, phonenumber);
                    stmt.setString(5, Dateofbirth);
                    stmt.setString(6, address);
                    stmt.setString(7, gender);
                    stmt.setString(8, role);
                    stmt.setString(9, organizationname);

                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                         request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "No rows affected. Registration failed.");
                        request.getRequestDispatcher("Error.jsp").forward(request, response);
                    }
                } catch (SQLException e) {
                    request.setAttribute("message", "Database error: " + e.getMessage());
                    request.getRequestDispatcher("Error.jsp").forward(request, response);
                } finally {
                    con.close();
                }
            } catch (ClassNotFoundException | SQLException e) {
                request.setAttribute("message", "Connection error: " + e.getMessage());
                request.getRequestDispatcher("Error.jsp").forward(request, response);
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
