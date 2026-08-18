<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Patient" %>
<%
    List<Patient> patientList = (List<Patient>) request.getAttribute("patients");
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Patients - E-Healthcare</title>
    <link rel="stylesheet" href="<%= contextPath %>/css/admin/ManagePatients.css">
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
            <a class="active" href="" aria-current="page">Manage Patients</a>
            <a href="<%= contextPath %>/FetchAppointment">Manage Appointments</a>
        </nav>
        <a class="logout-btn" href="<%= contextPath %>/AdminLogout">Log out</a>
    </aside>

    <main class="main-content">
        <header class="page-header">
            <div>
                <p class="eyebrow">Administration</p>
                <h1>Manage Patients</h1>
                <p class="page-description">View and monitor registered patient accounts.</p>
            </div>
        </header>

        <% String successMsg = (String) request.getAttribute("success-msg"); %>
        <% if (successMsg != null) { %>
            <div class="alert alert-success" role="status"><%= successMsg %></div>
        <% } %>
        <% String errorMsg = (String) request.getAttribute("error-msg"); %>
        <% if (errorMsg != null) { %>
            <div class="alert alert-error" role="alert"><%= errorMsg %></div>
        <% } %>

        <section class="patients-card" aria-labelledby="patientsTitle">
            <div class="section-header">
                <div>
                    <h2 id="patientsTitle">Registered patients</h2>
                    <p>Patient accounts are managed by their owners; use details for a complete record.</p>
                </div>
                <span class="patient-count"><%= patientList == null ? 0 : patientList.size() %> patients</span>
            </div>

            <div class="directory-tools">
                <div class="search-field">
                    <label for="patientSearch">Search patients</label>
                    <input type="search" id="patientSearch" placeholder="Search by name, email, or phone">
                </div>
                <div class="filter-field">
                    <label for="genderFilter">Gender</label>
                    <select id="genderFilter">
                        <option value="all">All genders</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Patient ID</th>
                            <th>Patient</th>
                            <th>Gender</th>
                            <th>Date of birth</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="patientTableBody">
                        <% if (patientList != null && !patientList.isEmpty()) {
                            for (Patient patient : patientList) {
                                String patientName = patient.getpName() == null ? "" : patient.getpName();
                                String patientEmail = patient.getEmail_id() == null ? "" : patient.getEmail_id();
                                String patientPhone = patient.getMobile_no() == null ? "" : String.valueOf(patient.getMobile_no());
                                String patientGender = patient.getGender() == null ? "" : patient.getGender();
                        %>
                                <tr data-gender="<%= patientGender.trim().toLowerCase() %>"
                                    data-search="<%= (patientName + " " + patientEmail + " " + patientPhone).toLowerCase() %>">
                                    <td class="id-cell">#<%= patient.getPatientId() %></td>
                                    <td class="patient-name"><%= patientName %></td>
                                    <td><span class="gender-badge"><%= patientGender %></span></td>
                                    <td><%= patient.getDate_of_birth() == null ? "—" : patient.getDate_of_birth() %></td>
                                    <td><%= patientEmail %></td>
                                    <td><%= patientPhone %></td>
                                    <td>
                                        <button class="details-button" type="button"
                                            data-id="<%= patient.getPatientId() %>"
                                            data-name="<%= patientName %>"
                                            data-gender="<%= patientGender %>"
                                            data-dob="<%= patient.getDate_of_birth() == null ? "—" : patient.getDate_of_birth() %>"
                                            data-email="<%= patientEmail %>"
                                            data-phone="<%= patientPhone %>"
                                            data-address="<%= patient.getAddress() == null ? "—" : patient.getAddress() %>">
                                            View details
                                        </button>
                                    </td>
                                </tr>
                        <%  }
                           } else { %>
                            <tr>
                                <td class="empty-state" colspan="7">No patient accounts are registered yet.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <p class="no-results" id="noResults" hidden>No patients match your search or selected filter.</p>
        </section>
    </main>

    <dialog class="patient-dialog" id="patientDialog" aria-labelledby="patientDialogTitle">
        <div class="dialog-header">
            <div>
                <p class="eyebrow">Patient record</p>
                <h2 id="patientDialogTitle">Patient details</h2>
            </div>
            <button class="close-button" type="button" id="closePatientDialog" aria-label="Close patient details">×</button>
        </div>
        <dl class="details-grid">
            <div><dt>Patient ID</dt><dd id="detailId"></dd></div>
            <div><dt>Full name</dt><dd id="detailName"></dd></div>
            <div><dt>Gender</dt><dd id="detailGender"></dd></div>
            <div><dt>Date of birth</dt><dd id="detailDob"></dd></div>
            <div><dt>Email address</dt><dd id="detailEmail"></dd></div>
            <div><dt>Phone number</dt><dd id="detailPhone"></dd></div>
            <div class="address-detail"><dt>Address</dt><dd id="detailAddress"></dd></div>
        </dl>
    </dialog>

    <script>
        const patientSearch = document.getElementById('patientSearch');
        const genderFilter = document.getElementById('genderFilter');
        const patientRows = document.querySelectorAll('#patientTableBody tr[data-search]');
        const noResults = document.getElementById('noResults');
        const patientDialog = document.getElementById('patientDialog');

        function filterPatients() {
            const query = patientSearch.value.trim().toLowerCase();
            const gender = genderFilter.value;
            let matches = 0;
            patientRows.forEach(function (row) {
                const matchesSearch = row.dataset.search.includes(query);
                const matchesGender = gender === 'all' || row.dataset.gender === gender;
                row.hidden = !(matchesSearch && matchesGender);
                if (!row.hidden) matches++;
            });
            noResults.hidden = matches !== 0 || patientRows.length === 0;
        }

        patientSearch.addEventListener('input', filterPatients);
        genderFilter.addEventListener('change', filterPatients);

        document.querySelectorAll('.details-button').forEach(function (button) {
            button.addEventListener('click', function () {
                document.getElementById('detailId').textContent = '#' + button.dataset.id;
                document.getElementById('detailName').textContent = button.dataset.name;
                document.getElementById('detailGender').textContent = button.dataset.gender;
                document.getElementById('detailDob').textContent = button.dataset.dob;
                document.getElementById('detailEmail').textContent = button.dataset.email;
                document.getElementById('detailPhone').textContent = button.dataset.phone;
                document.getElementById('detailAddress').textContent = button.dataset.address;
                patientDialog.showModal();
            });
        });
        document.getElementById('closePatientDialog').addEventListener('click', function () { patientDialog.close(); });
    </script>
</body>
</html>
