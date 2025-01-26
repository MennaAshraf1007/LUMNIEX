<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminpt2.aspx.cs" Inherits="DBM3.Adminpt2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Wallets for Customers - Luminex</title>
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
            max-width: 1200px;
            margin: 100px auto;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Grid View */
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .grid-view th, .grid-view td {
            padding: 12px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .grid-view th {
            background: linear-gradient(135deg, #00FFAA, #1A2A6C);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
        }

        .grid-view tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.05);
        }

        .grid-view tr:hover {
            background: rgba(255, 255, 255, 0.1);
            cursor: pointer;
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
                <h1>Available Wallets</h1>
                <p>Here are all the available wallets for customers.</p>
            </div>

            <!-- GridView -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="walletID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="walletID" HeaderText="Wallet ID" ReadOnly="True" SortExpression="walletID" />
                    <asp:BoundField DataField="current_balance" HeaderText="Current Balance" SortExpression="current_balance" />
                    <asp:BoundField DataField="currency" HeaderText="Currency" SortExpression="currency" />
                    <asp:BoundField DataField="last_modified_date" HeaderText="Last Modified Date" SortExpression="last_modified_date" />
                    <asp:BoundField DataField="nationalID" HeaderText="National ID" SortExpression="nationalID" />
                    <asp:BoundField DataField="mobileNo" HeaderText="Mobile No" SortExpression="mobileNo" />
                    <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                    <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Milestone2DB_24ConnectionString %>" ProviderName="<%$ ConnectionStrings:Milestone2DB_24ConnectionString.ProviderName %>" SelectCommand="SELECT [walletID], [current_balance], [currency], [last_modified_date], [nationalID], [mobileNo], [first_name], [last_name] FROM [CustomerWallet]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>