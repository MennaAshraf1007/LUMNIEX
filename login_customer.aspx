<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_customer.aspx.cs" Inherits="WebApplication1.login_customer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In - Luminex</title>
    <style>
        /* Global Styles */
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #1A2A6C, #008081);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
            color: white;
            overflow: hidden;
        }

        /* Container */
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(15px);
            width: 400px;
            text-align: center;
            animation: float 6s ease-in-out infinite;
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            z-index: 2;
        }

        /* Heading */
        h1 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #FFD700;
            text-transform: uppercase;
            font-weight: 700;
            letter-spacing: 2px;
            background: linear-gradient(135deg, #00FFAA, #00BFFF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: glow 2s ease-in-out infinite alternate;
        }

        /* Labels */
        label {
            display: block;
            margin: 10px 0 5px;
            font-size: 14px;
            color: #FFD700;
            text-align: left;
        }

        /* Input Fields */
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            font-size: 14px;
            outline: none;
            transition: border 0.3s ease;
        }

        input[type="text"]:focus {
            border: 1px solid #FFD700;
        }

        /* Password Input Wrapper */
        .password-wrapper {
            position: relative;
            margin-bottom: 15px;
            width: 100%;
        }

        .password-wrapper input {
            width: 100%;
            padding: 10px 10px 10px 10px; /* Add padding on the right for the eye icon */
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            font-size: 14px;
            outline: none;
            transition: border 0.3s ease;
        }

        .password-wrapper input:focus {
            border: 1px solid #FFD700;
        }

        /* Eye Icon */
        .password-wrapper .toggle-password {
            position: absolute;
            right: 15px; /* Adjust position */
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #FFD700;
            font-size: 18px; /* Adjust size */
            background: none;
            border: none;
            padding: 0;
            margin: 0;
        }

        .password-wrapper .toggle-password:hover {
            color: #ffffff; /* Change color on hover */
        }

        /* Button */
        .button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #008081, #1A2A6C);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.3s ease, background 0.3s ease;
        }

        .button:hover {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            transform: scale(1.05);
        }

        /* Error Message */
        .error-message {
            color: #FF4444;
            font-size: 14px;
            margin-top: 10px;
            display: block;
        }

        /* Forgot Password Link */
        .forgot-password {
            display: block;
            margin-top: 10px;
            color: #FFD700;
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        /* Remember Me Checkbox */
        .remember-me {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }

        .remember-me input {
            width: auto;
            margin-right: 10px;
        }

        /* Social Media Buttons */
        .social-login {
            margin-top: 20px;
        }

        .social-login button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 25px;
            font-size: 14px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            transition: background 0.3s ease;
        }

        .social-login button:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .social-login button img {
            width: 20px;
            margin-right: 10px;
        }

        /* Loading Spinner */
        .loading-spinner {
            display: none;
            margin-top: 20px;
        }

        .loading-spinner img {
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Animations */
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        @keyframes glow {
            0% { text-shadow: 0 0 5px rgba(0, 255, 170, 0.5); }
            100% { text-shadow: 0 0 20px rgba(0, 255, 170, 0.8); }
        }

        /* Dark Mode Toggle */
        .dark-mode-toggle {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.1);
            padding: 10px;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        /* Switch to Admin Button */
        .switch-button {
            width: 100%;
            padding: 12px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: 1px solid #FFD700;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
            margin-top: 10px;
        }

        .switch-button:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: scale(1.05);
        }
    </style>
    <!-- FontAwesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <!-- Poppins Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form2" runat="server">
        <!-- Container -->
        <div class="container">
            <h1>Welcome to Luminex</h1>
            <asp:Label ID="Label1" runat="server" Text="Please enter your mobile number and password"></asp:Label>
            <br />
            <br />

            <!-- Mobile Number -->
            <asp:Label ID="mobile_label" runat="server" Text="Mobile Number"></asp:Label>
            <asp:TextBox ID="mobile_text" runat="server" placeholder="Enter Mobile Number"></asp:TextBox>

            <!-- Password -->
            <asp:Label ID="password_label" runat="server" Text="Password"></asp:Label>
            <div class="password-wrapper">
                <input type="password" id="PasswordInput" name="PasswordInput" placeholder="Enter Password" />
                <button type="button" class="toggle-password" onclick="togglePasswordVisibility()">
                    <i class="fas fa-eye"></i> <!-- FontAwesome eye icon -->
                </button>
            </div>

            <!-- Remember Me -->
            <div class="remember-me">
                <input type="checkbox" id="rememberMe" name="rememberMe" />
                <label for="rememberMe">Remember Me</label>
            </div>

            <!-- Login Button -->
            <asp:Button ID="login" runat="server" Text="Log In" OnClick="login_Click" CssClass="button" />

            <!-- Forgot Password -->
            <a href="ForgotPassword.aspx" class="forgot-password">Forgot Password?</a>

            <!-- Error Message -->
            <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>

            <!-- Social Media Login -->
            <div class="social-login">
                <button type="button" onclick="loginWithGoogle()">
                    <img src="images/google-icon.png" alt="Google" /> Sign in with Google
                </button>
                <button type="button" onclick="loginWithFacebook()">
                    <img src="images/facebook-icon.png" alt="Facebook" /> Sign in with Facebook
                </button>
            </div>

            <br />
            <!-- Switch to Admin Button -->
            <asp:Button ID="Button2" runat="server" Text="Switch to Admin ?" OnClick="switchToAdmin" CssClass="switch-button" />

            <!-- Loading Spinner -->
            <div class="loading-spinner" id="loadingSpinner">
                <img src="images/loading-spinner.gif" alt="Loading" />
            </div>
        </div>

        
    </form>

    <script>
        // Function to toggle password visibility
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById("PasswordInput");
            const eyeIcon = document.querySelector(".toggle-password i");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash"); // Change to "eye-slash" icon
            } else {
                passwordInput.type = "password";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye"); // Change back to "eye" icon
            }
        }

        // Function to toggle dark mode
        function toggleDarkMode() {
            const body = document.body;
            body.classList.toggle('dark-mode');

            // Save user preference in localStorage
            if (body.classList.contains('dark-mode')) {
                localStorage.setItem('darkMode', 'enabled');
            } else {
                localStorage.setItem('darkMode', 'disabled');
            }
        }

        // Check user preference on page load
        function checkDarkModePreference() {
            const darkMode = localStorage.getItem('darkMode');
            if (darkMode === 'enabled') {
                document.body.classList.add('dark-mode');
            }
        }

        // Show loading spinner
        function showLoadingSpinner() {
            document.getElementById("loadingSpinner").style.display = "block";
        }

        // Run the check on page load
        checkDarkModePreference();
    </script>
</body>
</html>