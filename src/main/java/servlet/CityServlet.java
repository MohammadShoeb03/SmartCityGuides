package servlet;

import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/CityServlet")
public class CityServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cityName = request.getParameter("city");
        List<Map<String, String>> touristList = new ArrayList<>();
        String desc = "", lat = "0", lng = "0";

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps1 = con.prepareStatement("SELECT * FROM city WHERE city_name=?");
            ps1.setString(1, cityName);
            ResultSet rs1 = ps1.executeQuery();
            
            int cityId = 0;
            if(rs1.next()) {
                cityId = rs1.getInt("city_id");
                desc = rs1.getString("description");
                lat = rs1.getString("latitude");
                lng = rs1.getString("longitude");
            }

            PreparedStatement ps2 = con.prepareStatement("SELECT place_name FROM tourist_places WHERE city_id=?");
            ps2.setInt(1, cityId);
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()) {
                Map<String, String> m = new HashMap<>();
                m.put("name", rs2.getString("place_name"));
                touristList.add(m);
            }
        } catch(Exception e) { e.printStackTrace(); }

        request.setAttribute("city", cityName);
        request.setAttribute("description", desc);
        request.setAttribute("touristList", touristList);
        request.setAttribute("lat", lat);
        request.setAttribute("lng", lng);
        request.getRequestDispatcher("city.jsp").forward(request, response);
    }
}