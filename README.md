# 🏥 E-Healthcare Management System

A Java-based web application developed to streamline healthcare management by providing separate portals for **Patients, Doctors, and Administrators**. The system enables secure user authentication, appointment management, and efficient handling of healthcare records through a role-based interface.

---

## 📖 Overview

The E-Healthcare Management System is designed to simplify interactions between patients, doctors, and administrators. It follows the **MVC (Model-View-Controller)** architecture to ensure better code organization and maintainability.

The application is built using Java EE technologies with Oracle Database as the backend for persistent data storage.

---

## ✨ Features

### 👤 Patient Module
- Patient Registration
- Secure Login & Logout
- Session-based Authentication
- Patient Dashboard
- Book Appointments
- View Appointment Details

### 👨‍⚕️ Doctor Module
- Doctor Login
- Doctor Dashboard
- View Assigned Appointments

### 👨‍💼 Admin Module
- Admin Login
- Manage Doctors
- Manage Patients
- Manage Appointments
- Dashboard with System Statistics

---

## 🛠️ Tech Stack

| Category | Technologies |
|----------|--------------|
| Programming Language | Java |
| Frontend | HTML, CSS, JavaScript |
| Backend | JDBC, Servlets, JSP |
| Database | Oracle Database, SQL, PL/SQL |
| Architecture | MVC (Model-View-Controller) |
| Server | Apache Tomcat |
| IDE | Eclipse IDE |
| Version Control | Git, GitHub |

---

## 🏗️ Architecture

The project follows the **MVC (Model-View-Controller)** architecture.

- **Model** → Java Classes + JDBC + Oracle Database
- **View** → JSP, HTML, CSS, JavaScript
- **Controller** → Java Servlets

This architecture separates the presentation layer, business logic, and database operations, making the application modular and easier to maintain.

---

## 💾 Database

The application uses **Oracle Database** for storing application data.

### Main Tables

- Admin
- Doctor
- Patient
- Appointment

The application performs CRUD operations using **JDBC**, **PreparedStatement**, SQL, and PL/SQL.

---

## 🔐 Security Features

- Session-based Authentication
- Role-based Access Control
- Form Validation
- Protected Pages using Authentication Filter
- Session Invalidation on Logout

---

## 📂 Project Structure

```
E-Healthcare-Management-System
│
├── src
│   ├── controller
│   ├── dao
│   ├── model
│   ├── filters
│   └── utility
│
├── WebContent
│   ├── css
│   ├── images
│   ├── js
│   ├── jsp
│   └── WEB-INF
│
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- Java JDK 8 or later
- Eclipse IDE
- Apache Tomcat
- Oracle Database
- Oracle JDBC Driver

### Installation

1. Clone the repository

```bash
git clone https://github.com/shivamm0120/E-Healthcare-Management-System.git
```

2. Import the project into Eclipse.

3. Configure Apache Tomcat.

4. Create the Oracle database and required tables.

5. Update the database credentials in the database connection class.

6. Run the project on Apache Tomcat.

---

## 📸 Screenshots

### Home Page
![Home Page](screenshots/home.png)

### Patient Login
![Patient Login](screenshots/patient-login.png)

### Patient Dashboard
![Patient Dashboard](screenshots/patient-dashboard.png)

### Doctor Dashboard
![Doctor Dashboard](screenshots/doctor-dashboard.png)

### Admin Dashboard
![Admin Dashboard](screenshots/admin-dashboard.png)

### Appointment Management
![Appointment Management](screenshots/appointment.png)

---

## 📚 Learning Outcomes

Through this project, I gained practical experience in:

- Java Web Development
- MVC Architecture
- JDBC Connectivity
- Oracle Database Integration
- Session Management
- Authentication & Authorization
- CRUD Operations
- Frontend Development using HTML, CSS, and JavaScript
- Git & GitHub Version Control

---


## 👨‍💻 Author

**Shivam Kumar**

B.Tech Computer Science Engineering
