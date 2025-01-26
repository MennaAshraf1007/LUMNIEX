<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Service_plan_draft.aspx.cs" Inherits="WebApplication1.Service_plan_draft" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu - Luminex</title>
    <style>
        /* Global Styles */
       

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

        /* Container */
        .container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
            margin: 50px auto;
            text-align: center;
            backdrop-filter: blur(10px);
        }
        .container h1 {
            font-size: 28px;
            color: #FFD700;
            margin-bottom: 20px;
        }

        /* Buttons */
        .button {
            width: 100%;
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

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(-45deg, #1A2A6C, #008081);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            color: white;
            font-family: 'Poppins', sans-serif;
            transition: background 0.5s, color 0.5s;
        }
      .navbar {
          background-color: rgba(0, 0, 0, 0.3);
      }
      .container {
          background-color: rgba(255, 255, 255, 0.1);
      }

      /* Dark Mode */
      body.dark-mode {
          background: linear-gradient(135deg, #0A0F2C, #004040);
          color: #E0E0E0;
      }
      body.dark-mode .navbar {
          background-color: rgba(0, 0, 0, 0.6);
      }
      body.dark-mode .container {
          background-color: rgba(0, 0, 0, 0.3);
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
        <br />
        <br />

        <!-- Container -->
        <div class="container">
            <h1>What do you want to view?</h1>
            <asp:Button ID="Button1" runat="server" Text="View the Consumption for an input plan" CssClass="button" OnClick="Consume" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Plans you are not Subscribed to" CssClass="button" OnClick="otherplan" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Active Plans" CssClass="button" OnClick="active" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="All Offered Plans" CssClass="button" OnClick="alloffered" />
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

        // Run the check on page load
        checkDarkModePreference();
    </script>
</body>
</html>