package servlet;
import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String uname = request.getParameter("uname");
        String pass = request.getParameter("pass");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO users (username, password, full_name) VALUES (?,?,?)");
            ps.setString(1, uname);
            ps.setString(2, pass);
            ps.setString(3, fname);
            ps.executeUpdate();
            response.sendRedirect("login.jsp?msg=Account Created Successfully");
        } catch (Exception e) { e.printStackTrace(); }
    }
}