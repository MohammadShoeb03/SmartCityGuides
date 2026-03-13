package servlet;

import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Session mein user ka naam save karna
                HttpSession session = request.getSession();
                session.setAttribute("user", rs.getString("full_name"));
                response.sendRedirect("index.jsp"); // Success par home page
            } else {
                request.setAttribute("error", "Invalid Username or Password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
}