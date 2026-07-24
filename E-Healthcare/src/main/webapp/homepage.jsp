<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Healthcare</title>
<link rel="stylesheet" href="homepage.css" >
 <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>
	<!-- Navbar: Single row with logo (left), nav (center), auth (right) -->
	<header class="site-header">
		<div class="navbar-inner">
			<div class="logo">
				<i class="fa-solid fa-house-medical"></i> <span>E-Healthcare</span>
			</div>

			<nav class="nav-links">
				<a href="#">Home</a> <a href="#">Doctors</a> <a href="#">Services</a>
				<a href="#">About</a>
			</nav>

			<div class="auth-group">
				<div class="login-dropdown">
					<button class="dropdown-toggle" aria-expanded="true">Login</button>
					<div class="dropdown-menu">
						<a href="AdminLogin.jsp" class="dropdown-item">Admin</a> <a
							href="DoctorLogin.jsp" class="dropdown-item">Doctor</a> <a
							href="PatientLogin.jsp" class="dropdown-item">Patient</a>
					</div>
				</div>
				<a class="register-btn" href="PatientRegisteration.jsp">Register</a>
			</div>
		</div>
	</header>

	<!-- Hero Section: Centered, no illustration -->
	<main>
		<section class="hero">
			<div class="hero-content">
				<p class="hero-tag">Trusted care for every patient</p>
				<h1>Your Health, Our Priority</h1>
				<p class="hero-description">Book appointments with trusted
					healthcare professionals in a simple and secure way.</p>
				<div class="hero-buttons">
					<a class="btn btn-primary" href="#">Book Appointment</a> <a
						class="btn btn-secondary" href="patientRegisteration.html">Register
						Now</a>
				</div>
			</div>
		</section>
	</main>

	<!-- Footer -->
	<footer class="site-footer">
		<p>&copy; 2026 E-Healthcare Management System. All rights
			reserved.</p>
	</footer>

	<script>
		// Dropdown toggle functionality
		const dropdownToggle = document.querySelector('.dropdown-toggle');
		const dropdownMenu = document.querySelector('.dropdown-menu');

		dropdownToggle.addEventListener('click', function(e) {
			e.preventDefault();
			dropdownMenu.classList.toggle('show');
			dropdownToggle.setAttribute('aria-expanded', dropdownMenu.classList
					.contains('show'));
		});

		// Close dropdown when clicking outside
		document.addEventListener('click', function(e) {
			if (!e.target.closest('.login-dropdown')) {
				dropdownMenu.classList.remove('show');
				dropdownToggle.setAttribute('aria-expanded', 'false');
			}
		});
	</script>
</body>
</html>