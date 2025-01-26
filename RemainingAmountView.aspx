<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemainingAmountView.aspx.cs" Inherits="WebApplication1.RemainingAmountView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Remaining Amount - Luminex</title>
    <style>
        /* Global Styles */
        body {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            color: white;
            text-align: center;
        }

        /* Navbar */
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
    margin-right: 8px; /* Add spacing between icon and text */
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

        /* Hero Section */
        .hero {
            padding: 100px 20px;
            background: rgba(0, 0, 0, 0.4);
            border-radius: 15px;
            margin-bottom: 30px;
        }
        .hero h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }
        .hero p {
            font-size: 18px;
            color: #FFD700;
        }

        /* Form Container */
        .form-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            width: 90%;
            max-width: 500px;
            margin: 20px auto;
            text-align: center;
        }
        .form-container label {
            font-size: 16px;
            color: white;
            margin-bottom: 10px;
            display: block;
        }
        .form-container input[type="text"] {
            width: 80%;
            padding: 10px;
            border: none;
            border-radius: 25px;
            margin-bottom: 20px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }
        .form-container input[type="text"]::placeholder {
            color: #E0E0E0;
        }
        .form-container .button {
            width: 50%;
            padding: 12px;
            background: linear-gradient(135deg, #008081, #1A2A6C);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        .form-container .button:hover {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            transform: scale(1.05);
        }

        /* Toast Notification Styling */
        .toast {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 15px 30px;
            border-radius: 25px;
            font-size: 14px;
            z-index: 1000;
            display: none;
            animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
        }
        .toast.error {
            background: rgba(255, 59, 48, 0.8); /* Red for errors */
        }
        .toast.success {
            background: rgba(52, 199, 89, 0.8); /* Green for success */
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }

        .error-message {
            color: #FF4444; /* Red for errors */
            font-weight: bold;
        }

        .success-message {
            color: #00C851; /* Green for success */
            font-weight: bold;
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
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <div class="navbar">
    <h2>LUMINEX</h2>
    <ul>
        <li><a href="Service_plan_draft.aspx"><i class="fas fa-wifi"></i>Service Plan</a></li>
        <li><a href="My_Wallet.aspx"><i class="fas fa-wallet"></i>My Wallet</a></li>
        <li><a href="new_homepage.aspx"><i class="fas fa-home"></i>Home</a></li>
        <li><a href="shop details.aspx"><i class="fas fa-store"></i>Shops</a></li>
        <li class="notification-bell" onclick="toggleNotifications()"><i class="fas fa-bell"></i></li>
    </ul>
    
</div>


        <!-- Hero Section -->
        <div class="hero">
            <h1>Remaining Amount</h1>
            <p>Check the remaining amount for your service plan.</p>
        </div>

        <!-- Form Container -->
        <div class="form-container">
            <asp:Label ID="Label1" runat="server" Text="Please enter plan name" ForeColor="WhiteSmoke"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="plan" runat="server" placeholder="Enter Plan Name"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="ViewAmount" Text="View Amount" CssClass="button" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="result-message"></asp:Label>
        </div>

        <!-- Toast Notification -->
        <div id="toast" class="toast" runat="server"></div>

        <!-- Dark Mode Toggle -->
        <div class="dark-mode-toggle" onclick="toggleDarkMode()">🌙</div>
    </form>

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

        // Run the check on page load
        checkDarkModePreference();

        // Function to show toast notification
        function showToast(message, isError) {
            const toast = document.getElementById('toast');
            toast.innerText = message;
            toast.className = isError ? 'toast error' : 'toast success';
            toast.style.display = 'block';

            // Hide the toast after 3 seconds
            setTimeout(() => {
                toast.style.display = 'none';
            }, 3000);
        }

        // Run the check on page load
        checkDarkModePreference();
    </script>
</body>
</html>