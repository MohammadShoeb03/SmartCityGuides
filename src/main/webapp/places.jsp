<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String city = request.getParameter("city"); %>
<!DOCTYPE html>
<html>
<head><title>Places - <%=city%></title></head>
<body style="font-family: Arial; padding: 20px;">
    <h2>Important Categories in <%=city%></h2>
    <ul>
        <li>Hospitals</li>
        <li>Tourist Places</li>
        <li>Police Stations</li>
        <li>Restaurants</li>
    </ul>
    <a href="index.jsp">Back to Home</a>
</body>
</html>