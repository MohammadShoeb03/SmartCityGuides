<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - SmartCity Guide</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            background: linear-gradient(to right, #0b1a33, #1a73e8); 
            height: 100vh; 
            display: flex; 
            align-items: center; 
            justify-content: center;
            margin: 0;
        }
        .login-card { 
            background: white; 
            padding: 40px; 
            border-radius: 15px; 
            box-shadow: 0 10px 25px rgba(0,0,0,0.3); 
            width: 100%; 
            max-width: 400px; 
        }
        .btn-login { 
            background: #0b1a33; 
            color: white; 
            border: none; 
            padding: 12px; 
            width: 100%; 
            font-weight: bold; 
            transition: 0.3s;
        }
        .btn-login:hover { background: #1a73e8; }
        .register-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            font-size: 0.9rem;
            color: #666;
            text-decoration: none;
        }
        .register-link a {
            color: #1a73e8;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <h3 class="text-center mb-4 fw-bold">User Login</h3>
        
        <% if(request.getAttribute("error") != null) { %>
            <div class="alert alert-danger p-2 text-center" style="font-size: 0.8rem;">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label class="form-label text-secondary small fw-bold">Username</label>
                <input type="text" name="username" class="form-control shadow-sm" placeholder="Enter username" required>
            </div>
            <div class="mb-3">
                <label class="form-label text-secondary small fw-bold">Password</label>
                <input type="password" name="password" class="form-control shadow-sm" placeholder="••••••••" required>
            </div>
            <button type="submit" class="btn-login rounded-pill mt-3 shadow">LOGIN</button>
        </form>

        <div class="register-link">
            Don't have an account? <a href="signup.jsp">Register Here</a>
        </div>
    </div>
</body>
</html>