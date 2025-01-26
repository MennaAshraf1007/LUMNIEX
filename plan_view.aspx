<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="plan_view.aspx.cs" Inherits="WebApplication1.plan_view" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consumption Data - Luminex</title>
    <style>
        /* Global Styles */
        body {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            color: white;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            transition: background 0.5s, color 0.5s;
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

        /* Container */
        .container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 1000px;
            margin: 50px auto;
            text-align: center;
            backdrop-filter: blur(10px);
        }

        /* Buttons */
        .button {
            width: 15%;
            padding: 12px;
            background: linear-gradient(135deg, #008081, #1A2A6C);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            margin: 10px 0;
            transition: 0.3s;
        }
        .button:hover {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            transform: scale(1.05);
        }

        /* Calendar Styling */
        .calendar {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            color: white;
        }
        .calendar table {
            width: 100%;
            border-collapse: collapse;
        }
        .calendar th {
            background-color: rgba(255, 255, 255, 0.1);
            color: #FFD700;
            padding: 10px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .calendar td {
            padding: 10px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
        }
        .calendar a {
            color: #FFD700;
            text-decoration: none;
        }
        .calendar .today {
            background-color: #FFD700;
            color: #1A2A6C;
            border-radius: 50%;
        }
        .calendar .title {
            color: #FFD700;
            font-weight: bold;
        }
        .calendar .nextprev {
            color: #FFD700;
        }

        /* Dynamic Table Styling */
        .dynamic-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
            text-align: left;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            overflow: hidden;
        }
        .dynamic-table th {
            background: linear-gradient(135deg, #008081, #1A2A6C);
            color: white;
            padding: 15px;
            text-transform: uppercase;
            font-weight: bold;
            text-align: center;
        }
        .dynamic-table td {
            padding: 12px 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            color: white;
            text-align: center;
        }
        .dynamic-table tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }
        .dynamic-table tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transition: background-color 0.3s;
        }
        .dynamic-table td:first-child,
        .dynamic-table th:first-child {
            border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
        }
        .dynamic-table td:last-child,
        .dynamic-table th:last-child {
            border-top-right-radius: 15px;
            border-bottom-right-radius: 15px;
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

/* Dark Mode Toggle Button */
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
    </style>
       <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
<!-- Poppins Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Add ScriptManager -->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

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
    <!-- Notifications Dropdown -->
    <div id="notificationsDropdown" class="notifications-dropdown">
        <div class="notification-item"><i class="fas fa-gift"></i> New voucher available!</div>
        <div class="notification-item"><i class="fas fa-exclamation-circle"></i> Your bill is due soon.</div>
        <div class="notification-item"><i class="fas fa-sync"></i> Service plan updated.</div>
    </div>
</div>

        <!-- Container -->
        <div class="container">
            <asp:Label ID="planid" runat="server" Text="Please provide the plan name" ForeColor="WhiteSmoke" Font-Bold="true"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="id_input" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Show" OnClick="Show_plan_consumption" CssClass="button" />
            <br />
            <br />
            <div style="display: flex; gap: 20px; align-items: center;">
                <label for="StartDate">Start Date:</label>
                <asp:Calendar ID="startcalendar" runat="server" CssClass="calendar"></asp:Calendar>
                <label for="EndDate">End Date:</label>
                <asp:Calendar ID="endcalendar" runat="server" CssClass="calendar"></asp:Calendar>
            </div>

            <!-- UpdatePanel for Dynamic Content -->
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:PlaceHolder ID="myContainer" runat="server"></asp:PlaceHolder>
                    <asp:Label ID="Message" runat="server" ForeColor="Green"></asp:Label>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
         <!-- Hero Section -->
 <div class="hero">
     <h1>Consumption Data</h1>
     <p>View your usage details for a specific plan.</p>
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

    
</script>
</body>
</html>
