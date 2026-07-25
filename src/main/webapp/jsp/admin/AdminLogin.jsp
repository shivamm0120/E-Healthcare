<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Login | E-Healthcare</title>

    <link rel="stylesheet" href="DoctorLogin.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body>


<div class="login-container">

    <div class="login-card">
    
<!-- when admin enters wrong email or password -->
	<%
	if ("true".equals(request.getParameter("error"))) {
	%>
	<div class="error"><%="please enter valid email/password!"%></div>
	<%
	}
	%>
	
<!-- when admin does logout  -->
	<%
	if ("true".equals(request.getParameter("logout"))) {
	%>
	<div class="success"><%="you are successfully logged out !"%></div>
	<%
	}
	%>


	<%
	//for success msgs 
	String passwordChanged = (String) request.getAttribute("success");
	if (passwordChanged != null) {
	%>
	<div class="success"><%=passwordChanged%></div>
	<%
	}
	%>

        <div class="logo">
            <i class="fa-solid fa-house-medical"></i>
            <span>E-Healthcare</span>
        </div>

        <div class="login-icon">
            <i class="fa-solid fa-user-shield"></i>
        </div>

        <h2>Administrator Login</h2>

        <p class="subtitle">
            Sign in to manage the E-Healthcare system.
        </p>

        <form action="AdminLogin" method="post">

            <div class="input-group">

                <label>Email Address</label>

                <input type="email" name="email" placeholder="Enter admin email" required>

            </div>

            <div class="input-group">

                <label>Password</label>

                <input type="password"  name="password" placeholder="Enter password"  required>

            </div>

            <button type="submit" class="login-btn">
                Login
            </button>

        </form>

        <a href="homepage.jsp" class="back-home"> <i class="fa-solid fa-arrow-left"></i>
            Back to Home
        </a>

    </div>

</div>

</body>
</html>