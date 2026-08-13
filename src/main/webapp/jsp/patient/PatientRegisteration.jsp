
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Patient Registration - E-Healthcare</title>
<link rel="stylesheet" href="../../css/patient/PatientRegisteration.css">
</head>
<body>
	<%
	String msg = (String) request.getAttribute("message");
	if (msg != null) {
	%>
	<div class="error-message"><%=msg%></div>
	<%
	}
	%>
	<!-- Navbar: same structure as homepage -->
	<header class="site-header">
		<div class="navbar-inner">
			<div class="logo">
				<i class="fa-solid fa-house-medical"></i> <span>E-Healthcare</span>
			</div>

			<nav class="nav-links">
				<a href="homepage.jsp">Home</a> <a href="#">Doctors</a> <a href="#">Services</a>
				<a href="#">About</a>
			</nav>
		</div>
	</header>

	<!-- Registration page main section -->
	<main class="registration-page-wrapper">
		<section class="registration-section">
			<div class="registration-card">
				<div class="registration-header">
					<p class="page-label">Patient Registration</p>
					<h1>Create your account to book appointments and manage your
						healthcare services.</h1>
				</div>

				<form action="patientReg" method="post" class="registration-form"
					novalidate>
					<p class="login-callout">
						Already have an account? <a href="PatientLogin.jsp"
							class="login-link">Login</a>
					</p>
					<div class="form-row">
						<label for="fullName">Full Name </label> <input id="fullName"
							name="pname" type="text" placeholder="Enter your full name"
							required>
					</div>
					<div class="form-row">
						<label>Gender <span class="required">*</span></label>
						<div class="radio-group">
							<label class="radio-label"><input type="radio"
								name="gender" value="male" required> Male</label> <label
								class="radio-label"><input type="radio" name="gender"
								value="female"> Female</label> <label class="radio-label"><input
								type="radio" name="gender" value="other"> Other</label>
						</div>
					</div>

					<div class="form-row">
						<label for="dob">Date of Birth </label> <input id="dob" name="dob"
							type="date" required>
					</div>
					<div class="form-row">
						<label for="mobile">Mobile Number </label> <input id="mobile"
							name="mobile_no" type="tel" placeholder="0123456789"
							pattern="\d{10}" required>
						<p class="field-note">Enter exactly 10 digits without spaces.</p>
					</div>

					<div class="form-row">
						<label for="email">Email Address </label> <input id="email"
							name="email_id" type="email" placeholder="name@example.com"
							required>
					</div>

					<div class="form-row">
						<label for="password">Password </label> <input id="password"
							name="password" type="password"
							placeholder="Set your password(min 8 characters)" minlength="8"
							required>
					</div>

					<div class="form-row">
						<label for="confirmPassword">Confirm Password </label> <input
							id="confirmPassword" name="confirmPassword" type="password"
							placeholder="Repeat your password" minlength="8" required>
					</div>


					<div class="form-row">
						<label for="address">Address </label>
						<textarea id="address" name="address" rows="4"
							placeholder="Enter your residential address" required></textarea>
					</div>

					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Register</button>
						<button type="reset" class="btn btn-secondary">Reset</button>
					</div>
				</form>
			</div>
		</section>
	</main>

	<footer class="site-footer">
		<p>&copy; 2026 E-Healthcare Management System. All rights
			reserved.</p>
	</footer>
	<!--  
    <script>
        // Form Validation
        const registrationForm = document.querySelector('.registration-form');
        const fullName = document.getElementById('fullName');
        const email = document.getElementById('email');
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');
        const mobile = document.getElementById('mobile');

        function validateFullName() {
            if (fullName.value.trim() === '') {
                fullName.classList.add('input-error');
                return false;
            } else {
                fullName.classList.remove('input-error');
                return true;
            }
        }

        function validateEmail() {
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email.value)) {
                email.classList.add('input-error');
                return false;
            } else {
                email.classList.remove('input-error');
                return true;
            }
        }

        function validatePassword() {
            if (password.value.length < 8) {
                password.classList.add('input-error');
                return false;
            } else {
                password.classList.remove('input-error');
                return true;
            }
        }

        function validateConfirmPassword() {
            if (confirmPassword.value !== password.value) {
                confirmPassword.classList.add('input-error');
                return false;
            } else {
                confirmPassword.classList.remove('input-error');
                return true;
            }
        }

        function validateMobile() {
            const mobilePattern = /^\d{10}$/;
            if (!mobilePattern.test(mobile.value)) {
                mobile.classList.add('input-error');
                return false;
            } else {
                mobile.classList.remove('input-error');
                return true;
            }
        }

        // Real-time validation
        fullName.addEventListener('blur', validateFullName);
        email.addEventListener('blur', validateEmail);
        password.addEventListener('blur', validatePassword);
        confirmPassword.addEventListener('blur', validateConfirmPassword);
        mobile.addEventListener('blur', validateMobile);

        // Form submission
        registrationForm.addEventListener('submit', function(e) {
            const isFullNameValid = validateFullName();
            const isEmailValid = validateEmail();
            const isPasswordValid = validatePassword();
            const isConfirmPasswordValid = validateConfirmPassword();
            const isMobileValid = validateMobile();

            if (!(isFullNameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid && isMobileValid)) {
            	 e.preventDefault(); // ❌ stop only if invalid
                 alert('Please fill all details correctly.');
            }
        });

        // Dropdown toggle
        const dropdownToggle = document.querySelector('.dropdown-toggle');
        const dropdownMenu = document.querySelector('.dropdown-menu');

        dropdownToggle.addEventListener('click', function(e) {
            e.preventDefault();
            dropdownMenu.classList.toggle('show');
            dropdownToggle.setAttribute('aria-expanded', dropdownMenu.classList.contains('show'));
        });

        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.login-dropdown')) {
                dropdownMenu.classList.remove('show');
                dropdownToggle.setAttribute('aria-expanded', 'false');
            }
        });
    </script>
 -->
</body>
</html>