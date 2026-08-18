<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
    /* Set these Number attributes from the dashboard servlet. Missing values display as 0. */
    Number activeDoctorsCount = (Number) request.getAttribute("activeDoctorsCount");
    Number patientsCount = (Number) request.getAttribute("patientsCount");
    Number totalAppointmentsCount = (Number) request.getAttribute("totalAppointmentsCount");
    Number pendingAppointmentsCount = (Number) request.getAttribute("pendingAppointmentsCount");
    Number confirmedAppointmentsCount = (Number) request.getAttribute("confirmedAppointmentsCount");
    Number completedAppointmentsCount = (Number) request.getAttribute("completedAppointmentsCount");
    Number cancelledAppointmentsCount = (Number) request.getAttribute("cancelledAppointmentsCount");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - E-Healthcare</title>
    <link rel="stylesheet" href="<%= contextPath %>/css/admin/AdminDashboard.css">
</head>
<body>
    <aside class="sidebar">
        <a class="brand" href="<%= contextPath %>/dashboard" aria-label="E-Healthcare dashboard">
            <span class="brand-mark" aria-hidden="true">+</span>
            <span>E-Healthcare</span>
        </a>

        <nav class="nav-links" aria-label="Admin navigation">
            <a class="active" href="AdminDashboard.jsp" aria-current="page">Dashboard</a>
            <a href="<%= contextPath %>/FetchDoctor">Manage Doctors</a>
            <a href="<%= contextPath %>/FetchPatient">Manage Patients</a>
            <a href="<%= contextPath %>/FetchAppointment">Manage Appointments</a>
        </nav>

        <a class="logout-btn" href="<%= contextPath %>/AdminLogout">Log out</a>
    </aside>

    <main class="main-content">
        <header class="page-header">
            <div>
                <p class="eyebrow">Administration</p>
                <h1>Admin Dashboard</h1>
                <p class="welcome-text">Welcome back, shivam kumar</p>
            </div>
            <div class="user-profile" aria-label="Signed-in administrator">
                <span class="avatar" aria-hidden="true">S</span>
                <span>shivam kumar</span>
            </div>
        </header>

        <section class="metrics-grid" aria-label="System overview">
            <article class="metric-card">
                <div><p>Active doctors</p><strong><%= activeDoctorsCount == null ? 0 : activeDoctorsCount %></strong></div>
                <span class="metric-mark mark-cyan" aria-hidden="true">D</span>
            </article>
            <article class="metric-card">
                <div><p>Total patients</p><strong><%= patientsCount == null ? 0 : patientsCount %></strong></div>
                <span class="metric-mark mark-purple" aria-hidden="true">P</span>
            </article>
            <article class="metric-card">
                <div><p>Total appointments</p><strong><%= totalAppointmentsCount == null ? 0 : totalAppointmentsCount %></strong></div>
                <span class="metric-mark mark-blue" aria-hidden="true">A</span>
            </article>
            <article class="metric-card">
                <div><p>Pending</p><strong><%= pendingAppointmentsCount == null ? 0 : pendingAppointmentsCount %></strong></div>
                <span class="metric-mark mark-yellow" aria-hidden="true">P</span>
            </article>
            <article class="metric-card">
                <div><p>Confirmed</p><strong><%= confirmedAppointmentsCount == null ? 0 : confirmedAppointmentsCount %></strong></div>
                <span class="metric-mark mark-cyan" aria-hidden="true">C</span>
            </article>
            <article class="metric-card">
                <div><p>Completed</p><strong><%= completedAppointmentsCount == null ? 0 : completedAppointmentsCount %></strong></div>
                <span class="metric-mark mark-green" aria-hidden="true">✓</span>
            </article>
            <article class="metric-card">
                <div><p>Cancelled</p><strong><%= cancelledAppointmentsCount == null ? 0 : cancelledAppointmentsCount %></strong></div>
                <span class="metric-mark mark-red" aria-hidden="true">×</span>
            </article>
        </section>

        <section class="overview-note" aria-label="Dashboard information">
            <h2>System overview</h2>
            <p>Use the navigation menu to manage doctor accounts, patient records, and appointment details.</p>
        </section>
    </main>
</body>
</html>
