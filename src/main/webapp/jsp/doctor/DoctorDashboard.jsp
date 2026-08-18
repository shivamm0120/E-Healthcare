<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/doctor/DoctorDashboard.css">
</head>

<body>

    <!-- ================= SIDEBAR ================= -->

    <div class="sidebar">

        <div class="logo">
            <span class="logo-icon">✚</span>
            <span>E-Healthcare</span>
        </div>

        <nav>

            <a href="<%= request.getContextPath() %>/jsp/doctor/DoctorDashboard.jsp"
               class="active">
                <span>⌂</span>
                Dashboard
            </a>

            <a href="<%= request.getContextPath() %>/jsp/doctor/DoctorPatients.jsp">
                <span>♟</span>
                My Patients
            </a>

            <a href="<%= request.getContextPath() %>/jsp/doctor/DoctorProfile.jsp">
                <span>♙</span>
                My Profile
            </a>

            <a href="<%= request.getContextPath() %>/DoctorLogout">
                <span>↪</span>
                Logout
            </a>

        </nav>

    </div>


    <!-- ================= MAIN CONTENT ================= -->

    <div class="main-content">

        <!-- Hero Section -->

        <section class="hero">

            <div class="hero-content">

                <p class="welcome">WELCOME BACK</p>

                <h1>
                    Good Morning, Doctor
                </h1>

                <p class="hero-text">
                    Manage your appointments and provide
                    the best care to your patients.
                </p>

            </div>

        </section>


        <!-- ================= APPOINTMENT CARDS ================= -->

        <section class="appointment-summary">

            <a href="<%= request.getContextPath() %>/DoctorDashboard?filter=today"
               class="summary-card">

                <div class="card-icon">📅</div>

                <div>
                    <p>Today's Appointments</p>
                    <h2>5</h2>
                </div>

            </a>


            <a href="<%= request.getContextPath() %>/DoctorDashboard?filter=upcoming"
               class="summary-card">

                <div class="card-icon">🕐</div>

                <div>
                    <p>Upcoming</p>
                    <h2>8</h2>
                </div>

            </a>


            <a href="<%= request.getContextPath() %>/DoctorDashboard?filter=completed"
               class="summary-card">

                <div class="card-icon">✓</div>

                <div>
                    <p>Completed</p>
                    <h2>21</h2>
                </div>

            </a>


            <a href="<%= request.getContextPath() %>/DoctorDashboard?filter=cancelled"
               class="summary-card">

                <div class="card-icon">✕</div>

                <div>
                    <p>Cancelled</p>
                    <h2>2</h2>
                </div>

            </a>

        </section>


        <!-- ================= APPOINTMENTS ================= -->

        <section class="appointments-section">

            <div class="section-header">

                <div>
                    <h2>Today's Appointments</h2>

                    <p>
                        Your scheduled appointments for today
                    </p>
                </div>

                <a href="<%= request.getContextPath() %>/DoctorDashboard?filter=today"
                   class="view-all">
                    View All
                </a>

            </div>


            <div class="table-container">

                <table>

                    <thead>

                        <tr>
                            <th>Patient</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Reason</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>

                    </thead>


                    <tbody>

                        <!-- Temporary sample data -->

                        <tr>

                            <td>
                                <div class="patient">
                                    <div class="patient-avatar">RK</div>
                                    <span>Rahul Kumar</span>
                                </div>
                            </td>

                            <td>15 Aug 2026</td>

                            <td>10:00 AM</td>

                            <td>Regular Checkup</td>

                            <td>
                                <span class="status confirmed">
                                    Confirmed
                                </span>
                            </td>

                            <td>
                                <button class="action-btn">
                                    View
                                </button>
                            </td>

                        </tr>


                        <tr>

                            <td>
                                <div class="patient">
                                    <div class="patient-avatar">AS</div>
                                    <span>Amit Sharma</span>
                                </div>
                            </td>

                            <td>15 Aug 2026</td>

                            <td>11:30 AM</td>

                            <td>Fever</td>

                            <td>
                                <span class="status pending">
                                    Pending
                                </span>
                            </td>

                            <td>
                                <button class="action-btn">
                                    View
                                </button>
                            </td>

                        </tr>


                        <tr>

                            <td>
                                <div class="patient">
                                    <div class="patient-avatar">NS</div>
                                    <span>Neha Singh</span>
                                </div>
                            </td>

                            <td>15 Aug 2026</td>

                            <td>02:00 PM</td>

                            <td>Headache</td>

                            <td>
                                <span class="status confirmed">
                                    Confirmed
                                </span>
                            </td>

                            <td>
                                <button class="action-btn">
                                    View
                                </button>
                            </td>

                        </tr>

                    </tbody>

                </table>

            </div>

        </section>

    </div>

</body>
</html>