<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password - E-Healthcare</title>
<link rel="stylesheet" href="../../css/patient/StyleForgotPassword.css">
</head>
<body>
	<%
	String msg = (String) request.getAttribute("message");
	if (msg != null) {
	%>
	<div class="msg"><%=msg%></div>
	<%
	}
	%>

	<header class="site-header">
		<div class="navbar-inner">

			<div class="logo">
				<i class="fa-solid fa-house-medical"></i> <span>E-Healthcare</span>
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

					<p class="page-label">Password Recovery</p>

					<h1>Verify Your Identity</h1>

					<p class="page-description">Enter your registered email address
						and date of birth to verify your identity before resetting your
						password.</p>

				</div>

				<div class="info-box">

					<span>🛡️</span>

					<p>Your information is verified securely before allowing you to
						create a new password.</p>

				</div>

				<form class="registration-form" action="VerifyIdentity"
					method="post">

					<div class="form-row">
						<label for="email"> Registered Email Address <span
							class="required">*</span>
						</label> <input type="email" id="email" name="email_id"
							placeholder="Enter your registered email" required>
					</div>

					<div class="form-row">
						<label for="dob"> Date of Birth <span class="required">*</span>
						</label> <input type="date" id="dob" name="dob" required>
					</div>

					<div class="form-actions">

						<button class="btn btn-primary" type="submit">Verify</button>

						<button type="button" class="btn btn-secondary"
							onclick="location.href='PatientLogin.jsp'">Back to Login
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

</body>
</html>