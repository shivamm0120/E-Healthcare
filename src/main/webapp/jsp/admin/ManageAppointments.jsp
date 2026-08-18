<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Appointments" %>
<%
    List<Appointments> appointmentList = (List<Appointments>) request.getAttribute("appointments");
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Appointments - E-Healthcare</title>
    <link rel="stylesheet" href="<%= contextPath %>/css/admin/ManageAppointments.css">
</head>
<body>
    <aside class="sidebar">
        <a class="brand" href="<%= contextPath %>/dashboard" aria-label="E-Healthcare dashboard">
            <span class="brand-mark" aria-hidden="true">+</span>
            <span>E-Healthcare</span>
        </a>
        
        <nav class="nav-links" aria-label="Admin navigation">
            <a href="<%= contextPath %>/FetchDashboard">Dashboard</a>
            <a href="<%= contextPath %>/FetchDoctor">Manage Doctors</a>
            <a href="<%= contextPath %>/FetchPatient">Manage Patients</a>
            <a class="active" href="" aria-current="page">Manage Appointments</a>
        </nav>
        
        <a class="logout-btn" href="<%= contextPath %>/AdminLogout">Log out</a>
    </aside>
    <main class="main-content">
        <header class="page-header">
            <div>
                <p class="eyebrow">Administration</p>
                <h1>Manage Appointments</h1>
                <p class="page-description">Review all appointments and find records quickly.</p>
            </div>
        </header>
        <% String successMsg = (String) request.getAttribute("successMessage"); %>
        <% if (successMsg != null) { %>
            <div class="alert alert-success" role="status"><%= successMsg %></div>
        <% } %>
        <% String errorMsg = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMsg != null) { %>
            <div class="alert alert-error" role="alert"><%= errorMsg %></div>
        <% } %>
        <section class="appointments-card" aria-labelledby="appointmentsTitle">
            <div class="section-header">
                <div>
                    <h2 id="appointmentsTitle">Appointment directory</h2>
                    <p>Use the filters to narrow the appointment records shown below.</p>
                </div>
                <span class="appointment-count"><%= appointmentList == null ? 0 : appointmentList.size() %> appointments</span>
            </div>
            <div class="directory-tools">
                <div class="search-field">
                    <label for="appointmentSearch">Search</label>
                    <input type="search" id="appointmentSearch" placeholder="Search by patient ID or doctor ID">
                </div>
                <div class="filter-field">
                    <label for="statusFilter">Status</label>
                    <select id="statusFilter">
                        <option value="all">All statuses</option>
                        <option value="pending">Pending</option>
                        <option value="confirmed">Confirmed</option>
                        <option value="completed">Completed</option>
                        <option value="cancelled">Cancelled</option>
                    </select>
                </div>
                <div class="filter-field">
                    <label for="dateFilter">Appointment date</label>
                    <input type="date" id="dateFilter">
                </div>
            </div>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Patient ID</th>
                            <th>Doctor ID</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="appointmentTableBody">
                        <% if (appointmentList != null && !appointmentList.isEmpty()) {
                            for (Appointments appointment : appointmentList) {
                                String status = appointment.getStatus() == null ? "pending" : appointment.getStatus();
                                String normalizedStatus = status.trim().toLowerCase();
                                String appointmentDate = appointment.getAppointment_date() == null ? "" : String.valueOf(appointment.getAppointment_date());
                                String appointmentTime = appointment.getAppointment_time() == null ? "" : String.valueOf(appointment.getAppointment_time());
                        %>
                                <tr data-status="<%= normalizedStatus %>"
                                    data-date="<%= appointmentDate %>"
                                    data-search="<%= (String.valueOf(appointment.getPatientid()) + " " + String.valueOf(appointment.getDoctor_id())).toLowerCase() %>">
                                    <td class="id-cell">#<%= appointment.getPatientid() %></td>
                                    <td class="id-cell">#<%= appointment.getDoctor_id() %></td>
                                    <td><%= appointmentDate %></td>
                                    <td><%= appointmentTime %></td>
                                    <td><span class="status-badge status-<%= normalizedStatus %>"><%= status %></span></td>
                                    <td>
                                        <button class="details-button" type="button"
                                            data-patient-id="<%= appointment.getPatientid() %>"
                                            data-doctor-id="<%= appointment.getDoctor_id() %>"
                                            data-date="<%= appointmentDate %>"
                                            data-time="<%= appointmentTime %>"
                                            data-status="<%= status %>">
                                            View details
                                        </button>
                                    </td>
                                </tr>
                        <%  }
                           } else { %>
                            <tr>
                                <td class="empty-state" colspan="6">No appointment records are available.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <p class="no-results" id="noResults" hidden>No appointments match your selected filters.</p>
        </section>
    </main>
    <dialog class="appointment-dialog" id="appointmentDialog" aria-labelledby="appointmentDialogTitle">
        <div class="dialog-header">
            <div>
                <p class="eyebrow">Appointment record</p>
                <h2 id="appointmentDialogTitle">Appointment details</h2>
            </div>
            <button class="close-button" type="button" id="closeAppointmentDialog" aria-label="Close appointment details">×</button>
        </div>
        <dl class="details-grid">
            <div><dt>Patient ID</dt><dd id="detailPatientId"></dd></div>
            <div><dt>Doctor ID</dt><dd id="detailDoctorId"></dd></div>
            <div><dt>Appointment date</dt><dd id="detailDate"></dd></div>
            <div><dt>Appointment time</dt><dd id="detailTime"></dd></div>
            <div><dt>Status</dt><dd id="detailStatus"></dd></div>
        </dl>
    </dialog>
    <script>
        const appointmentSearch = document.getElementById('appointmentSearch');
        const statusFilter = document.getElementById('statusFilter');
        const dateFilter = document.getElementById('dateFilter');
        const appointmentRows = document.querySelectorAll('#appointmentTableBody tr[data-search]');
        const noResults = document.getElementById('noResults');
        const appointmentDialog = document.getElementById('appointmentDialog');
        function filterAppointments() {
            const query = appointmentSearch.value.trim().toLowerCase();
            const status = statusFilter.value;
            const date = dateFilter.value;
            let matches = 0;
            appointmentRows.forEach(function (row) {
                const matchesSearch = row.dataset.search.includes(query);
                const matchesStatus = status === 'all' || row.dataset.status === status;
                const matchesDate = !date || row.dataset.date === date;
                row.hidden = !(matchesSearch && matchesStatus && matchesDate);
                if (!row.hidden) matches++;
            });
            noResults.hidden = matches !== 0 || appointmentRows.length === 0;
        }
        appointmentSearch.addEventListener('input', filterAppointments);
        statusFilter.addEventListener('change', filterAppointments);
        dateFilter.addEventListener('change', filterAppointments);
        document.querySelectorAll('.details-button').forEach(function (button) {
            button.addEventListener('click', function () {
                document.getElementById('detailPatientId').textContent = '#' + button.dataset.patientId;
                document.getElementById('detailDoctorId').textContent = '#' + button.dataset.doctorId;
                document.getElementById('detailDate').textContent = button.dataset.date;
                document.getElementById('detailTime').textContent = button.dataset.time;
                document.getElementById('detailStatus').textContent = button.dataset.status;
                appointmentDialog.showModal();
            });
        });
        document.getElementById('closeAppointmentDialog').addEventListener('click', function () { appointmentDialog.close(); });
    </script>
</body>
</html>