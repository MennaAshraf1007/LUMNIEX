<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lists.aspx.cs" Inherits="WebApplication1.lists" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lists - Luminex</title>
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
            width: 90%;
            max-width: 600px;
            margin: 100px auto;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Labels */
        label {
            font-size: 16px;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 10px;
            display: block;
            text-align: left;
        }

        /* Dropdown */
        .dropdown {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .dropdown:hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: #00FFAA;
        }

        .dropdown:focus {
            outline: none;
            border-color: #00FFAA;
            box-shadow: 0 0 10px rgba(0, 255, 170, 0.5);
        }

        /* Textboxes */
        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        input[type="text"]:hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: #00FFAA;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #00FFAA;
            box-shadow: 0 0 10px rgba(0, 255, 170, 0.5);
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
        }

        .button:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 255, 170, 0.6);
        }

        /* GridView */
        .grid-view {
            width: 100%;
            margin: 20px auto;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .grid-view th {
            background-color: rgba(0, 255, 170, 0.2);
            color: white;
            padding: 10px;
            font-size: 14px;
            text-transform: uppercase;
        }

        .grid-view td {
            padding: 10px;
            color: rgba(255, 255, 255, 0.8);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .grid-view tr:hover {
            background-color: rgba(0, 255, 170, 0.1);
        }
          .header h1 {
      font-size: 32px;
      color: #00FFAA;
      text-transform: uppercase;
      margin-bottom: 10px;
      background: linear-gradient(135deg, #00FFAA, #00BFFF);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
     
  }

  .header p {
      font-size: 16px;
      color: rgba(255, 255, 255, 0.8);
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
                <h1>Lists</h1>
                <p>Choose what you would like to see a list of.</p>
            </div>

            <!-- Dropdown -->
          
            <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="selectedList" AutoPostBack="true" CssClass="dropdown">
                <asp:ListItem Value="0" Text="Choose what to list"></asp:ListItem>
                <asp:ListItem Value="Accounts subscribed to a plan" Text="Accounts subscribed to a plan"></asp:ListItem>
                <asp:ListItem Value="SMS offers of an account" Text="SMS offers of an account"></asp:ListItem>
                <asp:ListItem Value="Account Total Usage on All Subscribed Plans" Text="Account Total Usage on All Subscribed Plans"></asp:ListItem>
            </asp:DropDownList>

            <!-- Input Fields -->
            <asp:Label ID="Input1" runat="server" Text="Input Plan ID" Visible="false" CssClass="label"></asp:Label>
            <asp:Label ID="Input2" runat="server" Text="Input" Visible="false" CssClass="label"></asp:Label>
            <asp:TextBox ID="planID" runat="server" Visible="false" CssClass="textbox"></asp:TextBox>
            <asp:TextBox ID="DateORacc" runat="server" Visible="false" CssClass="textbox"></asp:TextBox>

            <!-- Button -->
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Go" Visible="false" CssClass="button" />

            <!-- Message -->
            <asp:Label ID="Message" runat="server" CssClass="label"></asp:Label>

            <!-- GridView -->
            <asp:GridView ID="GridView2" runat="server" CssClass="grid-view"></asp:GridView>
        </div>
    </form>
</body>
</html>