<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // STEP 1: Security Check - Bina login ke koi entry nahi
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Cache clear karna taaki logout ke baad Back button se page na khule
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartCity Guide | Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/releases/v5.15.4/css/all.min.css">
    <style>
        body { 
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); 
            height: 100vh; 
            display: flex; 
            flex-direction: column;
        }
        .navbar-custom { background: #0b1a33; padding: 12px 25px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .hero-card { 
            background: white; 
            padding: 40px; 
            border-radius: 20px; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.1); 
            width: 100%; 
            max-width: 550px; 
            margin: auto;
            border-top: 5px solid #1a73e8;
        }
        .btn-primary { background: #0b1a33; border: none; padding: 14px; transition: 0.3s; font-size: 1.1rem; }
        .btn-primary:hover { background: #1a73e8; transform: translateY(-2px); box-shadow: 0 5px 15px rgba(26, 115, 232, 0.4); }
        .nav-link-custom { color: #adb5bd; text-decoration: none; font-size: 0.9rem; transition: 0.3s; }
        .nav-link-custom:hover { color: #fff; }
    </style>
</head>
<body>

    <nav class="navbar-custom d-flex justify-content-between align-items-center">
        <span class="text-white fw-bold fs-4">🏙️ SmartCity Guide</span>
        <div class="d-flex align-items-center">
            <span class="text-info me-3 d-none d-sm-inline">Welcome, <b><%= session.getAttribute("user") %></b></span>
            <a href="logout.jsp" class="btn btn-outline-danger btn-sm fw-bold">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </nav>

    <div class="hero-card text-center mt-5">
        <h2 class="fw-bold mb-3 text-dark">Where to next?</h2>
        <p class="text-muted mb-4">Pick a city to see its landmarks, emergency contacts, and maps.</p>
        
        <form action="CityServlet" method="get">
            <div class="mb-4">
                <select name="city" class="form-select form-select-lg shadow-sm" required>
                    <option value="" disabled selected>-- Select a City --</option>
                    <option>Delhi</option><option>Mumbai</option><option>Bangalore</option>
                    <option>Hyderabad</option><option>Pune</option><option>Chennai</option>
                    <option>Kolkata</option><option>Ahmedabad</option><option>Jaipur</option>
                    <option>Lucknow</option><option>Surat</option><option>Patna</option>
                    <option>Indore</option><option>Bhopal</option><option>Chandigarh</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary w-100 fw-bold shadow">
                START EXPLORING <i class="fas fa-arrow-right ms-2"></i>
            </button>
        </form>

        <hr class="my-4">
        <div class="d-flex justify-content-center gap-3">
            <a href="signup.jsp" class="text-decoration-none text-muted small">Add New User?</a>
            <span class="text-muted small">|</span>
            <a href="places.jsp?city=Common" class="text-decoration-none text-muted small">General Categories</a>
        </div>
    </div>

    <footer class="text-center mt-auto pb-4 text-secondary" style="font-size: 0.85rem;">
        &copy; 2026 <b>Shoeb-Choudhary</b> | Smart City Project Final
    </footer>

</body>
</html>