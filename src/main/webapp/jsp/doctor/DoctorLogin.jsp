<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Doctor Login | E-Healthcare</title>

<link rel="stylesheet" href="../../css/doctor/DoctorLogin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body>

<div class="login-container">

    <div class="login-card">

        <div class="logo">
            <i class="fa-solid fa-house-medical"></i>
            <span>E-Healthcare</span>
        </div>

        <div class="login-icon">
            <i class="fa-solid fa-user-doctor"></i>
        </div>

        <h2>Doctor Login</h2>

        <p class="subtitle">
            Sign in to access your dashboard.
        </p>

        <form action="<%= request.getContextPath() %>/DoctorLogin" method="post">

            <div class="input-group">

                <label>Email Address</label>

                <input
                    type="email"
                    name="email"
                    placeholder="Enter your email"
                    required>

            </div>

            <div class="input-group">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter your password"
                    required>

            </div>

            <button type="submit" class="login-btn">
                Login
            </button>

        </form>

        <a href="homepage.jsp" class="back-home">
            <i class="fa-solid fa-arrow-left"></i>
            Back to Home
        </a>

    </div>

</div>

</body>
</html>