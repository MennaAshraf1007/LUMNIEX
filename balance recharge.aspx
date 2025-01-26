<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="balance_recharge.aspx.cs" Inherits="WebApplication1.balance_recharge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Balance Recharge - Luminex</title>
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
        .form-container input[type="text"],
        .form-container input[type="number"] {
            width: 80%;
            padding: 10px;
            border: none;
            border-radius: 25px;
            margin-bottom: 20px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }
        .form-container input[type="text"]::placeholder,
        .form-container input[type="number"]::placeholder {
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

        /* Result Message Styling */
        .result-message {
            font-size: 16px;
            margin: 20px 0;
            color: #4CAF50; /* Green for success */
        }
        .result-message.error {
            color: #FF6B6B; /* Red for errors */
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

        <!-- Hero Section -->
        <div class="hero">
            <h1>Balance Recharge</h1>
            <p>Recharge your balance with ease.</p>
        </div>

        <!-- Form Container -->
        <div class="form-container">
            <asp:Label ID="Label2" runat="server" Text="Amount"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Amount" TextMode="Number"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Payment Method"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Payment Method"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="ResultLabel" runat="server" CssClass="result-message"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Recharge Balance" OnClick="recharge_balance" CssClass="button" />
        </div>

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


        checkDarkModePreference();
    </script>
</body>
</html>