<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighestVoucherValueView.aspx.cs" Inherits="WebApplication1.HighestVoucherValueView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Highest Voucher Value - Luminex</title>
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

        /* GridView Styling */
        .grid-view {
            width: 90%;
            max-width: 1000px;
            margin: 20px auto;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.1);
        }
        .grid-view th {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            color: white;
            font-weight: bold;
            padding: 15px;
            text-align: center;
        }
        .grid-view td {
            padding: 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            color: #E0E0E0;
            text-align: center;
        }
        .grid-view tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.05);
        }
        .grid-view tr:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: scale(1.02);
            transition: transform 0.3s, background 0.3s;
        }

        /* Error Message Styling */
        .error-message {
            color: #FF6B6B;
            font-size: 16px;
            margin: 20px 0;
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
            <h1>Highest Voucher Value</h1>
            <p>View your highest-value vouchers.</p>
        </div>

        <!-- GridView for Highest Voucher Value -->
        <div class="container">
            <asp:Label ID="Label1" runat="server" Text="Here are your top highest vouchers" ForeColor="WhiteSmoke" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="gvVoucher" runat="server" AutoGenerateColumns="True" CssClass="grid-view"></asp:GridView>
            <br />
            <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
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