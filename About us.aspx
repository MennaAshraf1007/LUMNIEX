<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About us.aspx.cs" Inherits="WebApplication2.About_us" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - Luminex</title>
    <style>
        /* Global Styles */
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(-45deg, #1A2A6C, #008081);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            color: white;
            font-family: 'Poppins', sans-serif;
            transition: background 0.5s, color 0.5s;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Navbar */
        .navbar {
            width: 100%;
            padding: 20px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .navbar h2 {
            margin: 0;
            padding-left: 20px;
            font-size: 24px;
            color: #FFD700;
            text-transform: uppercase;
        }

        .navbar ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }

        .navbar ul li {
            margin: 0 20px;
            position: relative;
        }

        .navbar ul li a {
            text-decoration: none;
            color: white;
            text-transform: uppercase;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .navbar ul li a i {
            margin-right: 8px;
        }

        .navbar ul li::after {
            content: '';
            height: 3px;
            width: 0;
            background: #FFD700;
            position: absolute;
            left: 0;
            bottom: -5px;
            transition: width 0.5s ease;
        }

        .navbar ul li:hover::after {
            width: 100%;
        }

        .navbar ul li:hover a {
            color: #FFD700;
        }
            /* Dark Mode Styles */
body.dark-mode {
    background: linear-gradient(-45deg, #0A0F2C, #004040);
    color: #E0E0E0;
}

body.dark-mode .navbar {
    background: rgba(0, 0, 0, 0.6);
}

body.dark-mode .container {
    background: rgba(0, 0, 0, 0.3);
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
        /* Main Container */
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 1200px;
            margin: 120px auto 40px;
            text-align: center;
            backdrop-filter: blur(10px);
            animation: fadeIn 1s ease-in-out;
        }

        /* Heading */
        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #FFD700;
            text-transform: uppercase;
            animation: glow 2s infinite alternate;
        }

        /* Flip Cards Container */
        .team-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 80px;
        }

        /* Flip Card */
        .flip-card {
            background: transparent;
            width: 250px;
            height: 300px;
            perspective: 1000px;
        }

        .flip-card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.8s;
            transform-style: preserve-3d;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .flip-card:hover .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front, .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
            border-radius: 15px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }

        .flip-card-front {
            color: white;
        }

        .flip-card-back {
            background: rgba(0, 0, 0, 0.2);
            color: white;
            transform: rotateY(180deg);
        }

        .flip-card-front i {
            font-size: 50px;
            color: #FFD700;
            margin-bottom: 20px;
        }

        .flip-card-front h3 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #FFD700;
        }

        .flip-card-back h3 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #FFD700;
        }

        .flip-card-back p {
            font-size: 16px;
            line-height: 1.5;
            margin-bottom: 10px;
        }

        .flip-card-back a {
            color: #FFD700;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .flip-card-back a:hover {
            color: #1A2A6C;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes glow {
            0% { text-shadow: 0 0 5px #FFD700, 0 0 10px #FFD700, 0 0 20px #FFD700; }
            100% { text-shadow: 0 0 10px #FFD700, 0 0 20px #FFD700, 0 0 40px #FFD700; }
        }
    </style>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h2>LUMINEX</h2>
        <ul>
            <li><a href="new_homepage.aspx"><i class="fas fa-home"></i>Home</a></li>
            <li><a href="Service_plan_draft.aspx"><i class="fas fa-wifi"></i>Service Plan</a></li>
            <li><a href="My_Wallet.aspx"><i class="fas fa-wallet"></i>My Wallet</a></li>
            <li><a href="shop details.aspx"><i class="fas fa-store"></i>Shops</a></li>
            <li><a href="About us.aspx"><i class="fas fa-users"></i>About Us</a></li>
        </ul>
    </div>

    <!-- Main Container -->
    <div class="container">
        <h1>Meet the Team</h1>
        <div class="team-cards">
            <!-- Menna Ashraf -->
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <i class="fas fa-user"></i>
                        <h3>Menna Ashraf</h3>
                        <p>MET</p>
                    </div>
                    <div class="flip-card-back">
                        <h3>Menna Ashraf</h3>
                        <p>Major: MET</p>
                        <a href="https://www.linkedin.com/in/menna-ashraf1007?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" target="_blank">LinkedIn Profile</a>
                    </div>
                </div>
            </div>

            <!-- Alaa Mostafa -->
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <i class="fas fa-user"></i>
                        <h3>Alaa Mostafa</h3>
                        <p>MET</p>
                    </div>
                    <div class="flip-card-back">
                        <h3>Alaa Mostafa</h3>
                        <p>Major: MET</p>
                        <a href="https://www.linkedin.com/in/alaa-m-8439ba155?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" target="_blank">LinkedIn Profile</a>
                    </div>
                </div>
            </div>

            <!-- Sevine Hossam -->
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <i class="fas fa-user"></i>
                        <h3>Sevine Hossam</h3>
                        <p>MET</p>
                    </div>
                    <div class="flip-card-back">
                        <h3>Sevine Hossam</h3>
                        <p>Major: MET</p>
                        <a href="https://www.linkedin.com/in/habiba-al-habibi-8b5308306?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" target="_blank">LinkedIn Profile</a>
                    </div>
                </div>
            </div>

            <!-- Malika Hafez -->
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <i class="fas fa-user"></i>
                        <h3>Malika Hafez</h3>
                        <p>DMET</p>
                    </div>
                    <div class="flip-card-back">
                        <h3>Malika Hafez</h3>
                        <p>Major: DMET</p>
                        <a href="https://www.linkedin.com/in/sevine-khafagy-76112725b?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" target="_blank">LinkedIn Profile</a>
                    </div>
                </div>
            </div>

            <!-- Habiba Mohammed -->
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <i class="fas fa-user"></i>
                        <h3>Habiba Mohammed</h3>
                        <p>MET</p>
                    </div>
                    <div class="flip-card-back">
                        <h3>Habiba Mohammed</h3>
                        <p>Major: MET</p>
                        <a href="https://www.linkedin.com/in/habiba-al-habibi-8b5308306?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" target="_blank">LinkedIn Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Dark Mode Toggle -->
    <div class="dark-mode-toggle" onclick="toggleDarkMode()">🌙</div>

    <script>
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

        // Function to check dark mode preference on page load
        function checkDarkModePreference() {
            const darkMode = localStorage.getItem('darkMode');
            if (darkMode === 'enabled') {
                document.body.classList.add('dark-mode');
            } else {
                document.body.classList.remove('dark-mode');
            }
        }


        checkDarkModePreference();
    </script>
</body>
</html>