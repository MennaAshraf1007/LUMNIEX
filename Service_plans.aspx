<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Service_plans.aspx.cs" Inherits="WebApplication1.Service_plans" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Service Plans - Luminex</title>
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

        /* Card Layout for Plans */
        .service-plan-box {
            display: flex;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            overflow: hidden;
            margin: 20px auto;
            width: 90%;
            max-width: 800px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .service-plan-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        /* Left Section (Icon and Plan Name) */
        .service-plan-box .left-section {
            flex: 1;
            background: linear-gradient(135deg, #1A2A6C, #008081);
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .service-plan-box .left-section i {
            font-size: 48px;
            color: #FFD700;
            margin-bottom: 15px;
        }
        .service-plan-box .left-section .plan-label {
            font-size: 24px;
            font-weight: bold;
            color: white;
            margin: 0;
        }

        /* Right Section (Details and Button) */
        .service-plan-box .right-section {
            flex: 2;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .service-plan-box .right-section .plan-details {
            font-size: 16px;
            color: #E0E0E0;
            margin: 0 0 10px 0;
            line-height: 1.6;
        }
        .service-plan-box .right-section .plan-details strong {
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
            <h1>Service Plans</h1>
            <p>Explore all the service plans offered by Luminex.</p>
        </div>

        <!-- Container for Dynamic Content -->
        <div class="container">
            <br />
            <br />
            
            <asp:Label ID="Label1" runat="server" Text="Here are all the offered Service plans" ForeColor="WhiteSmoke" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:PlaceHolder ID="myContainer" runat="server"></asp:PlaceHolder>
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

        // Run the check on page load
        checkDarkModePreference();
    </script>
</body>
</html>