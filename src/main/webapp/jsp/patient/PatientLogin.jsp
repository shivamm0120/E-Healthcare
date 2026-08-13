<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - E-Healthcare</title>
<link rel="stylesheet" href="../../css/patient/StylePatientLogin.css">
 <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>

<!-- when patient enters wrong email or password -->
	<%
	if ("true".equals(request.getParameter("error"))) {
	%>
	<div class="error"><%="please enter valid email/password!"%></div>
	<%
	}
	%>
	
<!-- when patient does logout  -->
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
	<header class="site-header">
		<div class="navbar-inner">
			<div class="logo">
				<i class="fa-solid fa-house-medical"></i>
				<h2>E-Healthcare</h2>
			</div>
			<nav class="nav-links">
				<a href="homepage.jsp">Home</a> <a href="#">Doctors</a> <a href="#">Services</a>
				<a href="#">About</a>
			</nav>
		</div>
	</header>

	<main class="registration-page-wrapper">
		<section class="registration-section">
			<div class="registration-card">
				<div class="registration-header">
					<p class="page-label">Patient Login</p>
					<h1>Login to manage your appointments</h1>
				</div>

				<form class="registration-form" action="PatientLogin" method="post"
					novalidate>
					<div class="form-row">
						<label for="email_id">enter email id <span
							class="required">*</span></label> <input id="username" name="email_id"
							type="text" placeholder="Enter your email id " required>
					</div>

					<div class="form-row">
						<label for="password">Password <span class="required">*</span></label>
						<input id="password" name="password" type="password"
							placeholder="Enter your password" required>
					</div>

					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Login</button>
						<button type="button" class="btn btn-secondary">
							<a href="ForgotPassword.jsp">Forgot Password? </a>
						</button>
					</div>
				</form>
			</div>
		</section>
	</main>

	<footer class="site-footer">
		<p>&copy; 2026 E-Healthcare Management System. All rights
			reserved.</p>
	</footer>
	<script>
		// Form Validation
		const username = document.getElementById('username');
		const password = document.getElementById('password');
	</Script>
</body>
</html>
