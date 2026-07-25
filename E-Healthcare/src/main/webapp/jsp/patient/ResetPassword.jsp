<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Reset Password - E-Healthcare</title>

<link rel="stylesheet" href="StyleResetPassword.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

	<%
	String patientName = (String) request.getSession(false).getAttribute("pname");

	if (patientName == null) {
		patientName = "Patient";
	}

	String msg = (String) request.getAttribute("error-msg");

	if (msg != null) {
	%>

	<div class="msg">
		<%=msg%>
	</div>

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

					<h1>Create a New Password</h1>

					<p class="page-description">

						Welcome, <strong><%=patientName%></strong> <br> <br>
						Your identity has been verified successfully. Now you can reset
						your password.


					</p>

				</div>

				<div class="info-box">

					<span>🔐</span>

					<p>Use at least 8 characters with a combination of letters,
						numbers and special characters for better security.</p>

				</div>

				<form class="registration-form" action="ResetPassword" method="post">

					<div class="form-row">

						<label for="password"> New Password <span class="required">*</span>

						</label> <input type="password" id="password" name="password"
							placeholder="Enter new password" required>

					</div>

					<div class="form-row">

						<label for="confirmPassword"> Confirm Password <span
							class="required">*</span>

						</label> <input type="password" id="confirmPassword"
							name="confirmPassword" placeholder="Confirm your password"
							required>

					</div>

					<div class="form-actions">

						<button type="submit" class="btn btn-primary">Update
							Password</button>

						<button type="button" class="btn btn-secondary"
							onclick="location.href='PatientLogin.jsp'">Cancel</button>

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