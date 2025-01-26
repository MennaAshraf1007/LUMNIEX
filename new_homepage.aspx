<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_homepage.aspx.cs" Inherits="WebApplication2.new_homepage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Luminex - Customer Homepage</title>
    <style>
        /* Global Styles */
       

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

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
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
            transition: background 0.3s ease, backdrop-filter 0.3s ease;
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
            .navbar ul li a[href="sign.aspx"]:hover {
                color: #FF6B6B !important; /* Keep the same color on hover */
                text-shadow: 0 0 10px rgba(255, 107, 107, 0.8); /* Add a glow effect */
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
            transition: opacity 0.3s ease, visibility 0.3s ease;
        }

        .notifications-dropdown.show {
            display: block;
            opacity: 1;
            visibility: visible;
        }

        .notification-item {
            padding: 10px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .notification-item:last-child {
            border-bottom: none;
        }

        /* Container */
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 800px;
            margin: 120px auto 40px;
            text-align: center;
            backdrop-filter: blur(10px);
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

        /* Dashboard */
        .dashboard {
            display: flex;
            justify-content: space-around;
            margin-bottom: 30px;
        }

        .dashboard-item {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 15px;
            width: 30%;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .dashboard-item:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        .dashboard-item h4 {
            color: #FFD700;
            margin-bottom: 10px;
        }

        /* Statement Cards */
        .statements {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }

        .statement-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 15px;
            width: 30%;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            margin: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .statement-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        .statement-card h4 {
            color: #FFD700;
            margin-bottom: 10px;
        }

        /* Testimonials */
        .testimonials {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }

        .testimonial-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 15px;
            width: 30%;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            margin: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .testimonial-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        .testimonial-card h4 {
            color: #FFD700;
            margin-bottom: 10px;
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
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .button:hover {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            transform: scale(1.05);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        /* Dark Mode */
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

        /* Splash Screen */
        #splash-screen {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(-45deg, #1A2A6C, #008081);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            animation: fadeOut 0.5s ease-in-out 3s forwards;
        }

       

    
    </style>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <!-- Poppins Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
</head>
<body>
    <div id="main-page">
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
                    <li>
            <a href="sign.aspx" style="color: #FF6B6B;">
                <i class="fas fa-sign-out-alt"></i> Log out
            </a>
        </li>
                </ul>

                <!-- Notifications Dropdown -->
                <div id="notificationsDropdown" class="notifications-dropdown">
                    <div class="notification-item"><i class="fas fa-gift"></i> New voucher available!</div>
                    <div class="notification-item"><i class="fas fa-exclamation-circle"></i> Your bill is due soon.</div>
                    <div class="notification-item"><i class="fas fa-sync"></i> Service plan updated.</div>
                </div>
            </div>
            <!-- Hero Section -->
            <div class="hero">
                <h1>Welcome to Luminex</h1>
                <p>Connecting You to What Matters Most</p>
                <asp:Button ID="Button14" runat="server" Text="Explore Plans" CssClass="button" OnClick="service_plan_direct"/>
                <asp:Button ID="Button15" runat="server" Text="Learn More" CssClass="button" OnClick="learn_more" />
            </div>

            <!-- Container -->
            <div class="container">
                <!-- Dashboard -->
                <div class="dashboard">
                    <div class="dashboard-item">
                        <i class="fas fa-coins"></i>
                        <h4>Current Balance</h4>
                        <p>$150.00</p>
                    </div>
                    <div class="dashboard-item">
                        <i class="fas fa-chart-line"></i>
                        <h4>Data Usage</h4>
                        <p>75% Used</p>
                    </div>
                    <div class="dashboard-item">
                        <i class="fas fa-star"></i>
                        <h4>Active Benefits</h4>
                        <p>3 Benefits</p>
                    </div>
                </div>
                <!-- Why Choose Luminex? -->
                <div class="group">
                    <h3>Why Choose Luminex?</h3>
                    <div class="statements">
                        <div class="statement-card">
                            <h4>Unmatched Speed & Reliability</h4>
                            <p>Experience blazing-fast internet and crystal-clear calls with our state-of-the-art network.</p>
                        </div>
                        <div class="statement-card">
                            <h4>Seamless Connectivity, Everywhere</h4>
                            <p>Stay connected at home, at work, or on the go with our extensive coverage.</p>
                        </div>
                        <div class="statement-card">
                            <h4>Innovation at Your Fingertips</h4>
                            <p>From 5G to cloud solutions, we’re leading the way in telecom innovation.</p>
                        </div>
                    </div>
                </div>

                <!-- Account Management -->
                <div class="group">
                    <h3>Account Management</h3>
                    <asp:Button ID="Button10" runat="server" Text="My Wallet" OnClick="Mywallet" CssClass="button" />
                    <asp:Button ID="Button2" runat="server" Text="Recharge Balance" OnClick="recharge" CssClass="button" />
                    <asp:Button ID="Button4" runat="server" Text="Update Cashback" OnClick="cashback" CssClass="button" />
                    <asp:Button ID="Button11" runat="server" Text="Renew Subscription" OnClick="renew" CssClass="button" />
                </div>

                <!-- Support & Tickets -->
                <div class="group">
                    <h3>Support & Tickets</h3>
                    <asp:Button ID="Button1" runat="server" Text="Unresolved Tickets" OnClick="UnresolvedTickets" CssClass="button" />
                    <asp:Button ID="Button12" runat="server" Text="Review Service Plans" OnClick="past5" CssClass="button" />
                </div>

                <!-- Rewards & Benefits -->
                <div class="group">
                    <h3>Rewards & Benefits</h3>
                    <asp:Button ID="Button5" runat="server" Text="Active Benefits" OnClick="ActiveBenefits" CssClass="button" />
                    <asp:Button ID="Button13" runat="server" Text="Redeem Voucher" OnClick="redeem" CssClass="button" />
                    <asp:Button ID="Button6" runat="server" Text="Highest Voucher Value" OnClick="HighestVoucherValue" CssClass="button" />
                </div>

                <!-- Payments & History -->
                <div class="group">
                    <h3>Payments & History</h3>
                    <asp:Button ID="Button9" runat="server" Text="Top 10 Successful Payments" OnClick="Top10SuccessfulPayments" CssClass="button" />
                    <asp:Button ID="Button7" runat="server" Text="Remaining Amount" OnClick="RemainingAmount" CssClass="button" />
                    <asp:Button ID="Button8" runat="server" Text="Extra Amount" OnClick="ExtraAmount" CssClass="button" />
                </div>

                <!-- Shop & Services -->
                <div class="group">
                    <h3>Shop & Services</h3>
                    <asp:Button ID="Button3" runat="server" Text="View Shop Details" OnClick="shop" CssClass="button" />
                </div>

                <!-- Testimonials -->
                <div class="group">
                    <h3>What Our Customers Say</h3>
                    <div class="testimonials">
                        <div class="testimonial-card">
                            <h4>John D.</h4>
                            <p>"Luminex has transformed how we connect. Fast and reliable!"</p>
                        </div>
                        <div class="testimonial-card">
                            <h4>Sarah L.</h4>
                            <p>"The best telecom service I’ve ever used. Highly recommend!"</p>
                        </div>
                        <div class="testimonial-card">
                            <h4>Mike T.</h4>
                            <p>"Great customer support and seamless connectivity."</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- CTA Section -->
            <div class="cta-section">
                <h2>Ready to Experience the Future of Connectivity?</h2>
                <asp:Button ID="Button17" runat="server" Text="About Us" CssClass="button" OnClick="About_Us" />
            </div>

            <!-- Dark Mode Toggle -->
            <div class="dark-mode-toggle" onclick="toggleDarkMode()">🌙</div>
        </form>
    </div>
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
            dropdown.style.opacity = dropdown.classList.contains('show') ? '0' : '1';
            dropdown.style.visibility = dropdown.classList.contains('show') ? 'hidden' : 'visible';
            dropdown.classList.toggle('show');
        }

        // Close dropdown when clicking outside
        window.onclick = function (event) {
            if (!event.target.matches('.notification-bell')) {
                const dropdown = document.getElementById('notificationsDropdown');
                if (dropdown.classList.contains('show')) {
                    dropdown.style.opacity = '0';
                    dropdown.style.visibility = 'hidden';
                    dropdown.classList.remove('show');
                }
            }
        };

        // Run the check on page load
        checkDarkModePreference();
    </script>
</body>
</html>