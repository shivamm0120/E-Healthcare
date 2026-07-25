<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctor Dashboard | E-Healthcare</title>

<link rel="stylesheet" href="DoctorDashboard.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>

	<div class="container">

		<!-- Sidebar -->

		<aside class="sidebar">

			<div class="logo">
				<i class="fa-solid fa-house-medical"></i> <span>E-Healthcare</span>
			</div>

			<nav>

				<a href="#" class="active"> <i class="fa-solid fa-gauge-high"></i>
					Dashboard
				</a> <a href="#"> <i class="fa-solid fa-calendar-check"></i> My
					Appointments
				</a> <a href="#"> <i class="fa-solid fa-user-group"></i> My Patients
				</a> <a href="#"> <i class="fa-solid fa-user-doctor"></i> My Profile
				</a> <a href="#"> <i class="fa-solid fa-right-from-bracket"></i>
					Logout
				</a>

			</nav>

		</aside>

		<!-- Main Content -->

		<main class="main-content">

			<header>

				<div>
					<h1>Doctor Dashboard</h1>
					<p>
						Welcome, Dr.
						<!-- Doctor Name -->
					</p>
				</div>

				<div class="doctor-profile">
					<i class="fa-solid fa-user-doctor"></i>
				</div>

			</header>

			<!-- Dashboard Cards -->

			<section class="dashboard-cards">

				<div class="card">
					<div class="icon">
						<i class="fa-solid fa-calendar-day"></i>
					</div>

					<h3>Today's Appointments</h3>

					<h2>
						<!-- Dynamic Count -->
					</h2>
				</div>

				<div class="card">
					<div class="icon">
						<i class="fa-solid fa-calendar-plus"></i>
					</div>

					<h3>Upcoming</h3>

					<h2>
						<!-- Dynamic Count -->
					</h2>
				</div>

				<div class="card">
					<div class="icon">
						<i class="fa-solid fa-circle-check"></i>
					</div>

					<h3>Completed</h3>

					<h2>
						<!-- Dynamic Count -->
					</h2>
				</div>

				<div class="card">
					<div class="icon">
						<i class="fa-solid fa-circle-xmark"></i>
					</div>

					<h3>Cancelled</h3>

					<h2>
						<!-- Dynamic Count -->
					</h2>
				</div>

			</section>

			<!-- Today's Appointments -->

			<section class="table-section">

				<div class="section-header">

					<h2>Today's Appointments</h2>

				</div>

				<table>

					<thead>

						<tr>

							<th>Appointment ID</th>
							<th>Patient Name</th>
							<th>Date</th>
							<th>Time</th>
							<th>Status</th>
							<th>Action</th>

						</tr>

					</thead>

					<tbody>

						<!-- Dynamic Rows -->

					</tbody>

				</table>

			</section>

		</main>

	</div>

</body>
</html>