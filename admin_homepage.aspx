<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_homepage.aspx.cs" Inherits="WebApplication1.admin_homepage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard - Luminex</title>
    <style>
        /* Global Styles */
        body {
            margin: 0;
            padding: 0;
            background: radial-gradient(circle, #0F2027, #203A43, #2C5364);
            height: 100vh;
            font-family: 'Poppins', sans-serif;
            color: white;
            overflow-x: hidden;
        }

        /* Navbar */
        .navbar {
            width: 100%;
            padding: 20px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: rgba(255, 255, 255, 0.1);
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
            color: #00FFAA;
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
            font-size: 14px;
            transition: color 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px; /* Space between icon and text */
        }

        .navbar ul li::after {
            content: '';
            height: 3px;
            width: 0;
            background: #00FFAA;
            position: absolute;
            left: 0;
            bottom: -5px;
            transition: width 0.5s ease;
        }

        .navbar ul li:hover::after {
            width: 100%;
        }

        .navbar ul li:hover a {
            color: #00FFAA;
        }
            .navbar ul li a[href="sign.aspx"]:hover {
                color: #FF6B6B !important; /* Keep the same color on hover */
                text-shadow: 0 0 10px rgba(255, 107, 107, 0.8); /* Add a glow effect */
            }
        /* Container */
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(15px);
            width: 80%;
            max-width: 1200px;
            margin: 100px auto;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Header */
        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 32px;
            color: #00FFAA;
            text-transform: uppercase;
            margin-bottom: 10px;
            background: linear-gradient(135deg, #00FFAA, #00BFFF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: glow 2s ease-in-out infinite alternate;
        }

        .header p {
            font-size: 16px;
            color: rgba(255, 255, 255, 0.8);
        }

        /* Buttons Grid */
        .button-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        /* Button Styles */
        .button {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #00FFAA, #1A2A6C);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .button:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 255, 170, 0.6);
        }

        .button i {
            font-size: 20px;
        }

        /* Animations */
        @keyframes glow {
            0% { text-shadow: 0 0 5px rgba(0, 255, 170, 0.5); }
            100% { text-shadow: 0 0 20px rgba(0, 255, 170, 0.8); }
        }
    </style>
    <!-- FontAwesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <!-- Poppins Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
              <!-- Navbar -->
<div class="navbar">
    <h2>Luminex Telecom</h2>
    <ul>
        <li><a href="admin_homepage.aspx"><i class="fas fa-home"></i> Homepage</a></li>
        
        <li><a href="views.aspx"><i class="fas fa-eye"></i> Views</a></li>
        <li><a href="lists.aspx"><i class="fas fa-list"></i> Lists</a></li>
        <li><a href="actions.aspx"><i class="fas fa-cogs"></i> Actions</a></li>
         <li>
            <a href="sign.aspx" style="color: #FF6B6B;">
                <i class="fas fa-sign-out-alt"></i> Log out
            </a>
        </li>
    </ul>
</div>

        <!-- Container -->
        <div class="container">
            <!-- Header -->
            <div class="header">
                <h1>Welcome back, Admin!</h1>
                <p>Manage your telecom operations seamlessly.</p>
            </div>

            <!-- Buttons Grid -->
            <div class="button-grid">
                <!-- Use HTML buttons with FontAwesome icons -->
                <button type="button" class="button" onclick="handleButtonClick('view')">
                    <i class="fas fa-eye"></i> Views
                </button>
                <button type="button" class="button" onclick="handleButtonClick('list')">
                    <i class="fas fa-list"></i> Lists
                </button>
                <button type="button" class="button" onclick="handleButtonClick('actions')">
                    <i class="fas fa-cogs"></i> Actions
                </button>
                <button type="button" class="button" onclick="handleButtonClick('e_shops')">
                    <i class="fas fa-store"></i> E-Shops
                </button>
                <button type="button" class="button" onclick="handleButtonClick('wallets')">
                    <i class="fas fa-wallet"></i> Wallets
                </button>
                <button type="button" class="button" onclick="handleButtonClick('payments')">
                    <i class="fas fa-credit-card"></i> Payments
                </button>
                <button type="button" class="button" onclick="handleButtonClick('cashback')">
                    <i class="fas fa-coins"></i> Cashback
                </button>
                <button type="button" class="button" onclick="handleButtonClick('take_action')">
                    <i class="fas fa-bolt"></i> Take Action
                </button>
            </div>
        </div>
    </form>

    <!-- Script to Handle Button Clicks -->
    <script>
        function handleButtonClick(action) {
            switch (action) {
                case 'view':
                    window.location.href = 'views.aspx';
                    break;
                case 'list':
                    window.location.href = 'lists.aspx';
                    break;
                case 'actions':
                    window.location.href = 'actions.aspx';
                    break;
                case 'e_shops':
                    window.location.href = 'E_shops.aspx';
                    break;
                case 'wallets':
                    window.location.href = 'Admin_wallets.aspx';
                    break;
                case 'payments':
                    window.location.href = 'Payandtrans.aspx';
                    break;
                case 'cashback':
                    window.location.href = 'cashback.aspx';
                    break;
                case 'take_action':
                    window.location.href = 'actions2.aspx';
                    break;
                default:
                    alert('Action not implemented yet!');
            }
        }
    </script>
</body>
</html>