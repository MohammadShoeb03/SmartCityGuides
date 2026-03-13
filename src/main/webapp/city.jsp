<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String city = (String)request.getAttribute("city");
    String desc = (String)request.getAttribute("description");
    String lat = (String)request.getAttribute("lat");
    String lng = (String)request.getAttribute("lng");
    List<Map<String, String>> touristList = (List<Map<String, String>>)request.getAttribute("touristList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%=city%> - SmartCity Guide</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css"/>
    <style>
        body { background-color: #f8f9fa; color: #333; }
        .header-bar { background: #0b1a33; color: white; padding: 15px 0; box-shadow: 0 2px 10px rgba(0,0,0,0.2); }
        .info-card { background: white; border-radius: 12px; padding: 15px; margin-bottom: 15px; border-left: 5px solid #0b1a33; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .section-label { font-weight: 700; color: #6c757d; text-transform: uppercase; font-size: 0.8rem; margin: 20px 0 10px; }
        #map { width: 100%; height: 450px; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .border-emergency { border-left-color: #dc3545; }
        .border-tourist { border-left-color: #0d6efd; }
    </style>
</head>
<body>
    <div class="header-bar">
        <div class="container d-flex justify-content-between align-items-center">
            <span class="fw-bold">🏙️ SmartCity Guide</span>
            <a href="index.jsp" class="btn btn-sm btn-outline-light">Change City</a>
        </div>
    </div>

    <div class="container mt-4 mb-5">
        <div class="row">
            <div class="col-lg-5">
                <h1 class="fw-bold"><%=city%></h1>
                <p class="text-secondary mb-4"><%=desc%></p>

                <div class="section-label">🚨 Emergency Services</div>
                <div class="info-card border-emergency"><%=city%> Police: 100</div>
                <div class="info-card border-emergency">Ambulance: 102</div>

                <div class="section-label">🏰 Tourist Attractions</div>
                <% if(touristList != null && !touristList.isEmpty()) { 
                    for(Map<String, String> p : touristList) { %>
                        <div class="info-card border-tourist"><%=p.get("name")%></div>
                <% } } else { %>
                    <div class="info-card border-tourist text-muted">No places added yet.</div>
                <% } %>

                <div class="section-label">🏫 Local Institutes</div>
                <div class="info-card" style="border-left-color: #ffc107;">Government Public School & Library</div>
            </div>

            <div class="col-lg-7">
                <div class="section-label">🗺️ Interactive Map</div>
                <div id="map"></div>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script>
        var lat = parseFloat("<%=lat%>");
        var lng = parseFloat("<%=lng%>");
        if (isNaN(lat) || isNaN(lng)) { lat = 20.5937; lng = 78.9629; }

        var map = L.map('map').setView([lat, lng], 12);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);
        L.marker([lat, lng]).addTo(map).bindPopup("Welcome to <%=city%>!");
    </script>
</body>
</html>