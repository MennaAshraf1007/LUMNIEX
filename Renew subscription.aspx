<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Renew_subscription.aspx.cs" Inherits="WebApplication1.Renew_subscription" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Renew Subscription - Luminex</title>
    <style>
        body {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            color: white;
            text-align: center;
            transition: background 0.5s, color 0.5s;
        }

        /* Dark Mode */
        body.dark-mode {
            background: linear-gradient(135deg, #0A0F2C, #004040);
            color: #E0E0E0;
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


        /* Hero Box */
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
        .container {
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

        .button {
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
        .button:hover {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            transform: scale(1.05);
        }

        /* Error and Success Message Styles */
        .error-message {
            color: #FF4444; /* Red for errors */
            font-weight: bold;
        }

        .success-message {
            color: #00C851; /* Green for success */
            font-weight: bold;
        }

        /* Notification Bell */
        .notification-bell {
            position: relative;
            cursor: pointer;
        }
        .notification-bell::after {
            content: '3';
            position: absolute;
            top: -10px;
            right: -10px;
            background: red;
            color: white;
            border-radius: 50%;
            padding: 5px 10px;
            font-size: 12px;
        }

        /* Notifications Dropdown */
        .notifications-dropdown {
            display: none;
            position: absolute;
            top: 40px;
            right: 0;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 300px;
            padding: 10px;
            backdrop-filter: blur(10px);
        }
        .notifications-dropdown.show {
            display: block;
        }
        .notification-item {
            padding: 10px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .notification-item:last-child {
            border-bottom: none;
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

        /* Toast Notification */
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
    </style>
         <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
<!-- Poppins Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
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


        <!-- Hero Box -->
        <div class="hero">
            <h1>Renew Subscription</h1>
            <p>Renew your subscription plan with ease.</p>
        </div>

        <!-- Form Container -->
        <div class="container">
            <asp:Label ID="Label2" runat="server" Text="Amount" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Amount" CssClass="textbox"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Payment Method" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Payment Method" CssClass="textbox"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Plan ID" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server" placeholder="Enter Plan ID" CssClass="textbox"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="renew_subscription" Text="Renew Subscription" CssClass="button" />
            <br />
            <br />
            <asp:Label ID="ResultLabel" runat="server" CssClass="result-message"></asp:Label>
        </div>

        <!-- Toast Notification -->
        <div id="toast" class="toast" runat="server"></div>

        <!-- Dark Mode Toggle Button -->
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

        // Function to toggle notifications dropdown
        function toggleNotifications() {
            const dropdown = document.getElementById('notificationsDropdown');
            dropdown.classList.toggle('show');
        }

        // Close dropdown when clicking outside
        window.onclick = function (event) {
            if (!event.target.matches('.notification-bell')) {
                const dropdown = document.getElementById('notificationsDropdown');
                if (dropdown.classList.contains('show')) {
                    dropdown.classList.remove('show');
                }
            }
        };

        // Run the check on page load
        checkDarkModePreference();
    </script>
</body>
</html>