<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login - Luminex</title>
    <style>
        /* Global Styles */
        body {
            margin: 0;
            padding: 0;
            background: radial-gradient(circle, #0F2027, #203A43, #2C5364);
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
            color: #00FFAA;
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
            margin: 15px 0 5px;
            font-size: 14px;
            color: #00FFAA;
            text-align: left;
            font-weight: 500;
        }

        /* Input Fields */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            font-size: 14px;
            outline: none;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border: 1px solid #00FFAA;
            box-shadow: 0 0 15px rgba(0, 255, 170, 0.5);
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

        /* Password Input Wrapper */
        .password-wrapper {
            position: relative;
            margin-bottom: 20px;
        }

        .password-wrapper input {
            width: 100%;
            padding-right: 10px; /* Space for the eye icon */
        }

        /* Eye Icon */
        .password-wrapper .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #00FFAA;
            font-size: 18px;
            background: none;
            border: none;
            padding: 0;
            margin: 0;
            transition: color 0.3s ease;
        }

        .password-wrapper .toggle-password:hover {
            color: #00BFFF;
        }

        /* Button */
        .button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #00FFAA, #00BFFF);
            color: #0F2027;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .button:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 255, 170, 0.6);
        }

        /* Error Message */
        .error-message {
            color: #FF4444;
            font-size: 14px;
            margin-top: 10px;
            display: block;
        }

        /* Dark/Light Mode Toggle */
        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 25px;
            padding: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .theme-toggle:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        /* Password Strength Meter */
        .password-strength {
            width: 100%;
            height: 5px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .password-strength-bar {
            height: 100%;
            width: 0;
            background: #00FFAA;
            transition: width 0.3s ease;
        }

        /* Custom Checkbox */
        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .remember-me input {
            display: none;
        }

        .remember-me label {
            position: relative;
            padding-left: 30px;
            cursor: pointer;
            color: #00FFAA;
        }

        .remember-me label::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            border: 2px solid #00FFAA;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.1);
            transition: background 0.3s ease;
        }

        .remember-me input:checked + label::before {
            background: #00FFAA;
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
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Particle Background -->
    <div id="particles-js"></div>

    <div class="container">
        <form id="form1" runat="server">
            <!-- Dark/Light Mode Toggle -->
            <div class="theme-toggle" onclick="toggleTheme()">
                <i class="fas fa-moon"></i>
            </div>

            <h1>Admin Portal</h1>
            <asp:Label ID="Label1" runat="server" Text="Welcome back, Admin. Please sign in to continue."></asp:Label>
            <br />
            <br />

            <!-- ID Input -->
            <asp:Label ID="id_label" runat="server" Text="Admin ID"></asp:Label>
            <asp:TextBox ID="userID" runat="server" placeholder="Enter Admin ID"></asp:TextBox>

            <!-- Password Input -->
            <asp:Label ID="password_label" runat="server" Text="Password"></asp:Label>
            <div class="password-wrapper">
                <br />
                <input type="password" id="PasswordInput" name="PasswordInput" placeholder="Enter Password" oninput="updatePasswordStrength()" />
                <button type="button" class="toggle-password" onclick="togglePasswordVisibility()">
                    <i class="fas fa-eye"></i>
                </button>
            </div>
            <!-- Forgot Password -->
            <a href="admin_homepage.aspx" class="forgot-password">Forgot Password?</a>
            <br />
            <!-- Password Strength Meter -->
            <div class="password-strength">
                <div class="password-strength-bar" id="passwordStrengthBar"></div>
            </div>

            <!-- Remember Me Checkbox -->
            <div class="remember-me">
                <input type="checkbox" id="rememberMe" name="rememberMe" />
                <label for="rememberMe">Remember Me</label>
            </div>

            <!-- Sign In Button -->
            <asp:Button ID="signIn" runat="server" OnClick="login" Text="Sign In" CssClass="button" />
            <br />
           
            <br />
             <!-- Switch to Admin Button -->
 <asp:Button ID="Button2" runat="server" Text="Switch to Customer ?" OnClick="switchToAdmin" CssClass="button" />
            <br />

            <!-- Loading Spinner -->
            <div class="loading-spinner" id="loadingSpinner">
                <img src="images/loading-spinner.gif" alt="Loading" />
            </div>

            <!-- Error Message -->
            <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
        </form>
    </div>

    <!-- Particle.js Script -->
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
        // Particle Background
        particlesJS.load('particles-js', 'particles.json', function () {
            console.log('Particles loaded!');
        });

        // Toggle Password Visibility
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById("PasswordInput");
            const eyeIcon = document.querySelector(".toggle-password i");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash");
            } else {
                passwordInput.type = "password";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye");
            }
        }

        // Update Password Strength
        function updatePasswordStrength() {
            const password = document.getElementById("PasswordInput").value;
            const strengthBar = document.getElementById("passwordStrengthBar");
            const strength = Math.min(password.length * 10, 100); // Simple strength calculation
            strengthBar.style.width = strength + "%";
        }

        // Toggle Theme
        function toggleTheme() {
            const body = document.body;
            body.classList.toggle("light-mode");

            const themeToggleIcon = document.querySelector(".theme-toggle i");
            if (body.classList.contains("light-mode")) {
                themeToggleIcon.classList.remove("fa-moon");
                themeToggleIcon.classList.add("fa-sun");
            } else {
                themeToggleIcon.classList.remove("fa-sun");
                themeToggleIcon.classList.add("fa-moon");
            }
        }

        // Show Loading Spinner
        function showLoadingSpinner() {
            document.getElementById("loadingSpinner").style.display = "block";
        }
    </script>
</body>
</html>