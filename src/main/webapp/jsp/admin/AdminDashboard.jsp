<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="models.Admin" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | E-Healthcare</title>

    <link rel="stylesheet" href="../../css/admin/AdminDashboard.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>

<body>

<div class="container">

    <!-- Sidebar -->

    <aside class="sidebar">

        <div class="logo">
            <i class="fa-solid fa-house-medical"></i>
            <h2>E-Healthcare</h2>
        </div>

        <nav>

            <a href="#" class="active">
                <i class="fa-solid fa-chart-line"></i>
                Dashboard
            </a>

            <a href="#">
                <i class="fa-solid fa-user-doctor"></i>
                Manage Doctors
            </a>

            <a href="#">
                <i class="fa-solid fa-users"></i>
                Manage Patients
            </a>

            <a href="#">
                <i class="fa-solid fa-calendar-check"></i>
                Manage Appointments
            </a>

            <a href="AdminLogout">
                <i class="fa-solid fa-right-from-bracket"></i>
                Logout
            </a>

        </nav>

    </aside>

    <!-- Main Content -->

    <main class="main-content">

        <!-- Header -->

        <header>

            <div>

                <h1>Admin Dashboard</h1>
               	<div class="header-actions">
				<div class="welcome-text">
					<p>
						Welcome,
						<%
					HttpSession hs = request.getSession(false);
					%><b>
						<% Admin admin=(Admin)hs.getAttribute("admin");%>
						<%=admin.getFullName() %></b>
						<span class="placeholder-text"></span>
					</p>
				</div>

            </div>

            <div class="admin-profile">

                <i class="fa-solid fa-user-shield"></i>

            </div>

        </header>

        <!-- Statistics -->

        <section class="dashboard-cards">

            <div class="card">

                <div class="icon">
                    <i class="fa-solid fa-user-doctor"></i>
                </div>

                <h3>Total Doctors</h3>

                <h2>
                    <!-- Dynamic Value -->
                </h2>

            </div>

            <div class="card">

                <div class="icon">
                    <i class="fa-solid fa-users"></i>
                </div>

                <h3>Total Patients</h3>

                <h2>
                    <!-- Dynamic Value -->
                </h2>

            </div>

            <div class="card">

                <div class="icon">
                    <i class="fa-solid fa-calendar-days"></i>
                </div>

                <h3>Total Appointments</h3>

                <h2>
                    <!-- Dynamic Value -->
                </h2>

            </div>

            <div class="card">

                <div class="icon">
                    <i class="fa-solid fa-clock"></i>
                </div>

                <h3>Pending</h3>

                <h2>
                    <!-- Dynamic Value -->
                </h2>

            </div>

            <div class="card">

                <div class="icon">
                    <i class="fa-solid fa-circle-check"></i>
                </div>

                <h3>Completed</h3>

                <h2>
                    <!-- Dynamic Value -->
                </h2>

            </div>

            <div class="card">

                <div class="icon">
                    <i class="fa-solid fa-circle-xmark"></i>
                </div>

                <h3>Cancelled</h3>

                <h2>
                    <!-- Dynamic Value -->
                </h2>

            </div>

        </section>

        <!-- Recent Appointments -->

        <section class="table-section">

            <div class="section-header">

                <h2>Recent Appointments</h2>

            </div>

            <table>

                <thead>

                <tr>

                    <th>Appointment ID</th>

                    <th>Patient</th>

                    <th>Doctor</th>

                    <th>Date</th>

                    <th>Time</th>

                    <th>Status</th>

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