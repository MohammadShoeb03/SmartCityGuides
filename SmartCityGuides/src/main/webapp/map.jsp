<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String city = (String)request.getAttribute("city");
    String lat = (String)request.getAttribute("lat");
    String lng = (String)request.getAttribute("lng");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Smart City Map</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css"/>
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
</head>
<body>
    <h2>City Location: <%=city%></h2>
    <div id="fullMap" style="width: 100%; height: 550px;"></div>
    <script>
        var map = L.map('fullMap').setView([<%=lat%>, <%=lng%>], 13);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);
        L.marker([<%=lat%>, <%=lng%>]).addTo(map).bindPopup("<%=city%>").openPopup();
    </script>
</body>
</html>