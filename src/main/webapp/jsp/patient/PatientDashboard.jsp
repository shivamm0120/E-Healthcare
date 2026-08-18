<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Patient Dashboard - E-Healthcare</title>
<link rel="stylesheet" href="../../css/patient/PatientDashboard.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
	<header class="site-header">
		<div class="navbar-inner">
			<div class="logo">
				<i class="fa-solid fa-house-medical"></i> <span>E-Healthcare</span>
			</div>
			<div class="header-actions">
				<div class="welcome-text">
					<p>
						Welcome,
						<%
					HttpSession hs = request.getSession(false);
					%>
						<%=hs.getAttribute("pname") + "!"%>
						<span class="placeholder-text"></span>
					</p>
				</div>
				<a href="<%= request.getContextPath() %>/PatientLogout" class="btn btn-secondary logout-btn">Logout</a>
			</div>
		</div>
	</header>

	<main class="dashboard-layout">
		<aside class="sidebar" aria-label="Patient navigation">
			<div class="sidebar-panel">
				<p class="sidebar-title">Navigation</p>
				<nav class="sidebar-nav">
					<a href="#" class="sidebar-item active"> <span
						class="sidebar-icon"><i class="fas fa-home"></i></span> Home
					</a> <a href="#book" class="sidebar-item book-link"> <span
						class="sidebar-icon"><i class="fas fa-calendar-plus"></i></span>
						Book Appointment
					</a> <a href="#my-appointments" class="sidebar-item"> <span
						class="sidebar-icon"><i class="fas fa-notes-medical"></i></span>
						My Appointments
					</a> <a href="#doctors" class="sidebar-item"> <span
						class="sidebar-icon"><i class="fas fa-user-md"></i></span> Doctors
					</a> <a href="#prescriptions" class="sidebar-item"> <span
						class="sidebar-icon"><i
							class="fas fa-prescription-bottle-alt"></i></span> Prescriptions
					</a> <a href="#profile" class="sidebar-item"> <span
						class="sidebar-icon"><i class="fas fa-user-circle"></i></span>
						Profile
					</a> <a href="PatientLogout" class="sidebar-item sidebar-logout"> <span
						class="sidebar-icon"><i class="fas fa-sign-out-alt"></i></span>
						Logout
					</a>
				</nav>
			</div>
		</aside>

		<section class="dashboard-main">
			<section class="dashboard-hero">
				<div>
					<p class="eyebrow">Welcome Back</p>
					<h1>Your Health, Our Priority</h1>
					<p class="hero-text">Manage your appointments, prescriptions
						and healthcare information in one place.</p>
				</div>
			</section>

			<div class="section-grid">
				<article class="appointment-card">
					<div class="card-heading">
						<p class="eyebrow">Upcoming Appointments</p>
						<h2>Appointment timeline</h2>
					</div>
					<div class="dynamic-content">
						<!-- Upcoming appointments will render here dynamically from the database -->
					</div>
				</article>
			</div>

			<section id="prescriptions"
				class="section-block prescriptions-section">
				<div class="section-heading">
					<div>
						<p class="eyebrow">Recent Prescriptions</p>
						<h2>Prescription overview</h2>
					</div>
				</div>
				<div class="dynamic-content">
					<!-- Recent prescription records will render here dynamically from the database -->
				</div>
			</section>

			<footer class="page-footer">
				<p>© 2026 E-Healthcare. All Rights Reserved.</p>
			</footer>
		</section>
	</main>
</body>
</html>
