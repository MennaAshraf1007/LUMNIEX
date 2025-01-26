<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="actions2.aspx.cs" Inherits="WebApplication1.actions2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Actions 2 - Luminex</title>
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
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(15px);
            width: 80%;
            max-width: 800px;
            margin: 100px auto;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Buttons */
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
            margin-bottom: 20px;
        }

        .button:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 255, 170, 0.6);
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
            </ul>
        </div>

        <!-- Container -->
        <div class="container">
            <!-- Header -->
            <div class="header">
                <h1>What Would You Like to Do?</h1>
            </div>

            <!-- Buttons -->
            <asp:Button ID="b1" runat="server" OnClick="Gocheckwallet" Text="Check if a number is connected to a Wallet" CssClass="button" />
            <asp:Button ID="b2" runat="server" OnClick="gotransactions" Text="View the accepted transactions of number" CssClass="button" />
            <asp:Button ID="b3" runat="server" OnClick="gocashbackwallet" Text="View amount of cashback that a wallet gets from a certain Plan" CssClass="button" />
            <asp:Button ID="b4" runat="server" OnClick="goavgtransactions" Text="Average amount of transaction of a Wallet" CssClass="button" />
            <asp:Button ID="b5" runat="server" OnClick="goupdatepts" Text="Update the number of points for a mobile number" CssClass="button" />
        </div>
    </form>
</body>
</html>