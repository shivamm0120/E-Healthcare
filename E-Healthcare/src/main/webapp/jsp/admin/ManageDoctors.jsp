<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Doctors</title>

    <link rel="stylesheet" href="ManageDoctors.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>

<!-- ================= Sidebar ================= -->

<div class="sidebar">

    <div class="logo">
        <i class="fa-solid fa-hospital"></i>
        <h2>Admin Panel</h2>
    </div>

    <ul>

        <li>
            <a href="AdminDashboard.jsp">
                <i class="fa-solid fa-house"></i>
                Dashboard
            </a>
        </li>

        <li class="active">
            <a href="#">
                <i class="fa-solid fa-user-doctor"></i>
                Manage Doctors
            </a>
        </li>

        <li>
            <a href="#">
                <i class="fa-solid fa-users"></i>
                Patients
            </a>
        </li>

        <li>
            <a href="#">
                <i class="fa-solid fa-calendar-check"></i>
                Appointments
            </a>
        </li>

        <li>
            <a href="#">
                <i class="fa-solid fa-user-shield"></i>
                Profile
            </a>
        </li>

        <li>
            <a href="AdminLogout">
                <i class="fa-solid fa-right-from-bracket"></i>
                Logout
            </a>
        </li>

    </ul>

</div>

<!-- ================= Main Content ================= -->

<div class="main">

    <!-- Top Header -->

    <div class="top-bar">

        <div>
            <h1>Manage Doctors</h1>
            <p>Manage all registered doctors.</p>
        </div>

        <a href="AddDoctor.jsp" class="add-btn">
            <i class="fa-solid fa-plus"></i>
            Add Doctor
        </a>

    </div>


    <!-- Statistics -->

    <div class="cards">

        <div class="card">
            <i class="fa-solid fa-user-doctor"></i>
            <h2>42</h2> <!-- need jsp here -->
            <p>Total Doctors</p>
        </div>

        <div class="card">
            <i class="fa-solid fa-user-check"></i>
            <h2>37</h2>
            <p>Active Doctors</p>
        </div>

        <div class="card">
            <i class="fa-solid fa-user-xmark"></i>
            <h2>5</h2>
            <p>Inactive Doctors</p>
        </div>

    </div>


    <!-- Search & Filters -->

    <div class="toolbar">

        <div class="search-box">

            <input
                    type="text"
                    placeholder="Search by name, email or ID">

            <button>
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>

        </div>

        <div class="filters">

            <select>
                <option>Department</option>
                <option>Cardiology</option>
                <option>Neurology</option>
                <option>Orthopedics</option>
                <option>Dermatology</option>
            </select>

            <select>
                <option>Status</option>
                <option>Active</option>
                <option>Inactive</option>
            </select>

        </div>

    </div>


    <!-- Doctors Table -->

    <div class="table-container">

        <table>

            <thead>

            <tr>

                <th>ID</th>

                <th>Name</th>

                <th>Department</th>

                <th>Experience</th>

                <th>Fee</th>

                <th>Phone</th>

                <th>Status</th>

                <th>Actions</th>

            </tr>

            </thead>

            <tbody>

            <tr>

                <td>D101</td>

                <td>Dr. Rahul Sharma</td>

                <td>Cardiology</td>

                <td>12 Years</td>

                <td>₹700</td>

                <td>9876543210</td>

                <td>
                    <span class="status active">
                        Active
                    </span>
                </td>

                <td>

                    <a href="#" class="view">
                        <i class="fa-solid fa-eye"></i>
                    </a>

                    <a href="#" class="edit">
                        <i class="fa-solid fa-pen"></i>
                    </a>

                    <a href="#" class="delete">
                        <i class="fa-solid fa-trash"></i>
                    </a>

                </td>

            </tr>


            <tr>

                <td>D102</td>

                <td>Dr. Priya Singh</td>

                <td>Neurology</td>

                <td>8 Years</td>

                <td>₹600</td>

                <td>9988776655</td>

                <td>
                    <span class="status inactive">
                        Inactive
                    </span>
                </td>

                <td>

                    <a href="#" class="view">
                        <i class="fa-solid fa-eye"></i>
                    </a>

                    <a href="#" class="edit">
                        <i class="fa-solid fa-pen"></i>
                    </a>

                    <a href="#" class="delete">
                        <i class="fa-solid fa-trash"></i>
                    </a>

                </td>

            </tr>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>