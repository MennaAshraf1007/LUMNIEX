<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="E_shops.aspx.cs" Inherits="DBM3.E_shops" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Shops - Luminex</title>
    <style>
        /* Global Styles */
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(-45deg, #0F2027, #203A43, #2C5364, #00FFAA);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            height: 100vh;
            font-family: 'Poppins', sans-serif;
            color: white;
            overflow-x: hidden;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
        }

        ::-webkit-scrollbar-thumb {
            background: #00FFAA;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #1A2A6C;
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

        /* Container */
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(15px);
            width: 80%;
            max-width: 1200px;
            margin: 120px auto 40px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Shop Grid */
        .shop-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        /* Shop Card */
        .shop-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .shop-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        .shop-card h3 {
            font-size: 20px;
            color: #00FFAA;
            margin-bottom: 10px;
        }

        .shop-card p {
            font-size: 14px;
            color: rgba(255, 255, 255, 0.8);
            margin: 5px 0;
        }

        .shop-card p strong {
            color: #00FFAA;
        }

        /* Go Back Button */
        .go-back-button {
            background: linear-gradient(135deg, #00FFAA, #1A2A6C);
            color: white;
            border: none;
            border-radius: 25px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .go-back-button:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 255, 170, 0.6);
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
                <li><a href="admin_homepage.aspx">Homepage</a></li>
                
                <li><a href="views.aspx">Views</a></li>
                <li><a href="lists.aspx">Lists</a></li>
                <li><a href="actions.aspx">Actions</a></li>
            </ul>
        </div>

        <!-- Container -->
        <div class="container">
            <!-- Title -->
            <h1>E-Shops Details</h1>
            <br />

            <!-- Shop Grid -->
            <div id="shopGrid" runat="server" class="shop-grid">
                <!-- Shop cards will be dynamically added here -->
            </div>

            <!-- Go Back Button -->
            <asp:Button ID="GoBackButton" runat="server" Text="Go Back" CssClass="go-back-button" OnClick="goback" />
        </div>
    </form>
</body>
</html>