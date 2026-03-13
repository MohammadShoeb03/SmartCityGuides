<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up - SmartCity Guide</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background: #f0f2f5; display: flex; align-items: center; height: 100vh;">
    <div class="card shadow p-4 mx-auto" style="width: 400px; border-radius: 15px;">
        <h3 class="text-center fw-bold">Create Account</h3>
        <form action="SignupServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="fname" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="uname" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="pass" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 fw-bold">REGISTER</button>
            <div class="text-center mt-3"><a href="login.jsp">Already have an account? Login</a></div>
        </form>
    </div>
</body>
</html>