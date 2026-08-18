<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="java.util.Set" %>
<%@ page import="models.Doctor" %>
<%
    List<Doctor> doctorList = (List<Doctor>) request.getAttribute("doctors");
    String contextPath = request.getContextPath();

    Set<String> specializations = new LinkedHashSet<String>();
    String[] defaultSpecializations = {
        "Cardiology", "Dentistry", "Dermatology", "ENT",
        "General Medicine", "Gynecology", "Neurology", "Orthopedics",
        "Pediatrics", "Psychiatry", "Radiology", "Surgery"
    };

    for (String specialization : defaultSpecializations) {
        specializations.add(specialization);
    }

    if (doctorList != null) {
        for (Doctor doctor : doctorList) {
            if (doctor.getSpecialization() != null && !doctor.getSpecialization().trim().isEmpty()) {
                specializations.add(doctor.getSpecialization());
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Doctors - E-Healthcare</title>
    <link rel="stylesheet" href="<%= contextPath %>/css/admin/ManageDoctors.css">
</head>
<body>
    <aside class="sidebar">
        <a class="brand" href="<%= contextPath %>/dashboard" aria-label="E-Healthcare dashboard">
            <span class="brand-mark" aria-hidden="true">+</span>
            <span>E-Healthcare</span>
        </a>

        <nav class="sidebar-nav" aria-label="Admin navigation">
            <a href="<%= contextPath %>/FetchDashboard">Dashboard</a>
            <a class="active" href="" aria-current="page">Manage Doctors</a>
            <a href="<%= contextPath %>/FetchPatient">Manage Patients</a>
            <a href="<%= contextPath %>/FetchAppointment">Manage Appointments</a>
        </nav>

        <a class="logout-link" href="<%= contextPath %>/logout">Log out</a>
    </aside>

    <main class="main-content">
        <header class="page-heading">
            <div>
                <p class="eyebrow">Administration</p>
                <h1>Manage Doctors</h1>
                <p>Add, view, or manage practitioner accounts.</p>
            </div>
        </header>

        <% String successMsg = (String) request.getSession().getAttribute("success-msg"); %>
        <% if (successMsg != null) { %>
            <div class="alert alert-success" role="status"><%= successMsg %></div>
        <% } %>

        <% String errorMsg = (String) request.getSession().getAttribute("error-msg"); %>
        <% if (errorMsg != null) { %>
            <div class="alert alert-error" role="alert"><%= errorMsg %></div>
        <% } %>

        <%-- Doctor-only filter section. No appointment information is shown on this page. --%>
        <section class="content-card doctor-filter-card" aria-labelledby="doctor-filter-heading">
            <div class="card-heading">
                <div>
                    <h2 id="doctor-filter-heading">Find practitioners</h2>
                    <p>Search a doctor by ID or browse a particular specialization group.</p>
                </div>
                <span class="doctor-count"><%= doctorList == null ? 0 : doctorList.size() %> doctors</span>
            </div>

            <div class="doctor-filters">
                <div class="filter-field">
                    <label for="doctorIdSearch">Doctor ID</label>
                    <input type="search" id="doctorIdSearch" placeholder="e.g. 101">
                </div>

                <div class="filter-field filter-specialization">
                    <label for="specializationFilter">Medical specialization</label>
                    <select id="specializationFilter">
                        <option value="all">All specializations</option>
                        <% for (String specialization : specializations) { %>
                            <option value="<%= specialization.toLowerCase() %>"><%= specialization %></option>
                        <% } %>
                    </select>
                </div>

                <button class="button button-secondary" type="button" id="clearDoctorFilters">Clear filters</button>
            </div>
        </section>

        <section class="content-card doctors-card" aria-labelledby="registered-doctors-heading">
            <div class="card-heading">
                <div>
                    <h2 id="registered-doctors-heading">Registered practitioners</h2>
                    <p>Current doctors registered in the healthcare directory.</p>
                </div>
                <button class="button button-primary" type="button" id="openDoctorDialog">Add doctor</button>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Specialization</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="doctorTableBody">
                        <% if (doctorList != null && !doctorList.isEmpty()) {
                            for (Doctor doctor : doctorList) {
                                String specialization = doctor.getSpecialization() == null ? "" : doctor.getSpecialization();
                                String accountStatus = doctor.getStatus() == null ? "ACTIVE" : doctor.getStatus();
                        %>
                                <tr data-doctor-id="<%= doctor.getDoctor_id() %>"
                                    data-specialization="<%= specialization.trim().toLowerCase() %>">
                                    <td class="id-cell">#<%= doctor.getDoctor_id() %></td>
                                    <td class="doctor-name"><%= doctor.getFull_name() %></td>
                                    <td><span class="specialization-badge"><%= specialization %></span></td>
                                    <td><%= doctor.getEmail() %></td>
                                    <td><%= doctor.getPhone() %></td>
                                    <td>
                                        <form action="Modify" method="post" class="status-form" title="Click to change account status">
                                            <input type="hidden" name="action" value="TOGGLE_STATUS">
                                            <input type="hidden" name="id" value="<%= doctor.getDoctor_id() %>">
                                            <input type="hidden" name="currentStatus" value="<%= accountStatus %>">
                                            <button class="status-toggle <%= "ACTIVE".equalsIgnoreCase(accountStatus) ? "is-active" : "is-inactive" %>" type="submit">
                                                <%= accountStatus %>
                                            </button>
                                        </form>
                                    </td>
                                    <td class="actions-cell">
                                        <form action="Modify" method="post" onsubmit="return confirm('Are you sure you want to remove this doctor account?');">
                                            <input type="hidden" name="action" value="DELETE">
                                            <input type="hidden" name="id" value="<%= doctor.getDoctor_id() %>">
                                            <button class="text-action text-action-danger" type="submit">Remove</button>
                                        </form>
                                    </td>
                                </tr>
                        <%  }
                           } else { %>
                            <tr>
                                <td class="empty-state" colspan="7">No doctor entries are registered yet.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <p class="no-results" id="noResults" hidden>No doctors match the selected filters.</p>
        </section>
    </main>

    <dialog class="doctor-dialog" id="doctorDialog" aria-labelledby="doctorDialogTitle">
        <div class="dialog-heading">
            <div>
                <p class="eyebrow">New practitioner</p>
                <h2 id="doctorDialogTitle">Add doctor</h2>
            </div>
            <button class="icon-button" type="button" id="closeDoctorDialog" aria-label="Close add doctor form">&times;</button>
        </div>

        <form action="<%=request.getContextPath() %>/AddDoctor" method="post" class="doctor-form">
            <input type="hidden" name="action" value="ADD">
            <div class="form-group">
                <label for="docName">Full name</label>
                <input type="text" id="docName" name="dName" required placeholder="e.g. Dr. Ramesh Kumar">
            </div>
            <div class="form-group">
                <label for="docSpec">Medical specialization</label>
                <input type="text" id="docSpec" name="specialization" required placeholder="e.g. Cardiology">
            </div>
            <div class="form-group">
                <label for="docEmail">Email address</label>
                <input type="email" id="docEmail" name="email" required placeholder="name@healthcare.com">
            </div>
            <div class="form-group">
                <label for="docPhone">Contact phone number</label>
                <input type="tel" id="docPhone" name="phone" required placeholder="e.g. +91 98765 43210">
            </div>
            <div class="dialog-actions">
                <button class="button button-secondary" type="button" id="cancelDoctorDialog">Cancel</button>
                <button class="button button-primary" type="submit">Register doctor</button>
            </div>
        </form>
    </dialog>

    <script>
        const doctorIdSearch = document.getElementById('doctorIdSearch');
        const specializationFilter = document.getElementById('specializationFilter');
        const doctorRows = document.querySelectorAll('#doctorTableBody tr[data-doctor-id]');
        const noResults = document.getElementById('noResults');

        function filterDoctors() {
            const doctorId = doctorIdSearch.value.trim().toLowerCase();
            const specialization = specializationFilter.value;
            let visibleCount = 0;

            doctorRows.forEach(function (row) {
                const matchesId = !doctorId || row.dataset.doctorId.toLowerCase().includes(doctorId);
                const matchesSpecialization = specialization === 'all' || row.dataset.specialization === specialization;
                const showRow = matchesId && matchesSpecialization;

                row.hidden = !showRow;
                if (showRow) {
                    visibleCount++;
                }
            });

            noResults.hidden = visibleCount !== 0 || doctorRows.length === 0;
        }

        doctorIdSearch.addEventListener('input', filterDoctors);
        specializationFilter.addEventListener('change', filterDoctors);
        document.getElementById('clearDoctorFilters').addEventListener('click', function () {
            doctorIdSearch.value = '';
            specializationFilter.value = 'all';
            filterDoctors();
        });

        const doctorDialog = document.getElementById('doctorDialog');
        document.getElementById('openDoctorDialog').addEventListener('click', function () { doctorDialog.showModal(); });
        document.getElementById('closeDoctorDialog').addEventListener('click', function () { doctorDialog.close(); });
        document.getElementById('cancelDoctorDialog').addEventListener('click', function () { doctorDialog.close(); });
    </script>
</body>
</html>
