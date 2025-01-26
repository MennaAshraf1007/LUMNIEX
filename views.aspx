<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="views.aspx.cs" Inherits="WebApplication1.views" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Views - Luminex</title>
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
        /* Container */
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(15px);
            width: 95%;
            max-width: 1500px;
            margin: 120px auto 40px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Header */
        .header h1 {
            font-size: 42px;
            text-transform: uppercase;
            margin-bottom: 10px;
            background: linear-gradient(135deg, #00FFAA, #00BFFF, #FF00FF);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            
        }

        @keyframes glow {
            0% { text-shadow: 0 0 5px rgba(0, 255, 170, 0.5); }
            100% { text-shadow: 0 0 20px rgba(0, 255, 170, 0.8); }
        }

        .header p {
            font-size: 18px;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 20px;
        }

        /* Dropdown */
        .dropdown {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            outline: none;
            transition: border 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
        }

        .dropdown:hover {
            border: 1px solid #00FFAA;
        }

        .dropdown:focus {
            border: 1px solid #00FFAA;
            box-shadow: 0 0 10px rgba(0, 255, 170, 0.5);
        }

        /* GridView */
        .grid-view {
            width:inherit;
            border-collapse: collapse;
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow-x: auto; /* Horizontal scroll for large tables */
        }

        .grid-view th {
            background: linear-gradient(135deg, #00FFAA, #1A2A6C);
            color: white;
            font-weight: 600;
            padding: 12px;
            text-align: center;
        }

        .grid-view td {
            padding: 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
            white-space: nowrap; /* Prevent text wrapping */
        }

        .grid-view tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.05);
        }

        .grid-view tr:hover {
            background: rgba(255, 255, 255, 0.1);
            cursor: pointer;
        }

        /* Message Label */
        .message {
            font-size: 16px;
            color: #00FFAA;
            margin-bottom: 20px;
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
    </ul>
</div>

        <!-- Container -->
        <div class="container">
            <!-- Header -->
            <div class="header">
                <h1>Explore Data</h1>
                <p>Choose a view to explore detailed information about customers, stores, tickets, and more.</p>
            </div>

            <!-- Dropdown -->
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="selectView" AutoPostBack="true" CssClass="dropdown">
                <asp:ListItem Value="0" Text="Choose a view"></asp:ListItem>
                <asp:ListItem Value="Customer Profiles + Active Accounts" Text="Customer Profiles + Active Accounts"></asp:ListItem>
                <asp:ListItem Value="Physical Stores + Vouchers" Text="Physical Stores + Vouchers"></asp:ListItem>
                <asp:ListItem Value="Resolved Tickets" Text="Resolved Tickets"></asp:ListItem>
                <asp:ListItem Value="Accounts + Subscribed Plans" Text="Accounts + Subscribed Plans"></asp:ListItem>
            </asp:DropDownList>
            <br />

            <!-- Message Label -->
            <asp:Label ID="Message" runat="server" CssClass="message"></asp:Label>
            <br />

            <!-- GridView -->
            <asp:GridView ID="GridView1" runat="server" CssClass="grid-view"></asp:GridView>
        </div>
    </form>
</body>
</html>