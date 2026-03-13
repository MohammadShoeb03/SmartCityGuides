<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // STEP 1: Current session ko puri tarah khatam (destroy) karein
    session.removeAttribute("user"); // User ka data remove karein
    session.invalidate();           // Session ko invalidate karein

    // STEP 2: Browser cache ko clear karne ki instruction (taaki 'Back' dabane par page na khule)
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setHeader("Expires", "0"); // Proxies

    // STEP 3: User ko wapas login page par bhej dein
    response.sendRedirect("login.jsp");
%>