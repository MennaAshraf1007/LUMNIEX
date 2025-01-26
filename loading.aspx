<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loading.aspx.cs" Inherits="WebApplication2.post_admin" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loading - Luminex</title>
    <style>
        /* Global Styles */
        body {
            margin: 0;
            padding: 0;
            background: radial-gradient(circle, #0F2027, #203A43, #2C5364);
            height: 100vh;
            font-family: 'Poppins', sans-serif;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .logo {
            justify-self:center;
            width: 350px; /* Increased size */
            height: auto; /* Increased size */
            padding-right:30px;
           
          
          
            justify-content: center;
            align-items: center;
            z-index: 1000;
            animation: fadeOut 0.5s ease-in-out 3s forwards;
        }

        .slogan {
            font-size: 28px; /* Increased font size */
            color: #00FFAA;
            margin-bottom: 30px; /* Increased margin */
            animation: fadeIn 2s ease-in-out;
            text-align: center; /* Center-align text */
        }

        .progress-bar {
            width: 400px; /* Increased width */
            height: 12px; /* Slightly thicker */
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 6px; /* Rounded corners */
            overflow: hidden;
        }

        .progress {
            height: 100%;
            width: 0;
            background-color: #00FFAA;
            animation: progress 3s ease-in-out forwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes progress {
            0% { width: 0; }
            100% { width: 100%; }
        }
        .form {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            animation: fadeOut 0.5s ease-in-out 3s forwards;
        }
    </style>
    <!-- Poppins Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="form">
        <img src="images/logo.png" alt="Luminex Logo" class="logo" />
        <div class="slogan">Connecting you to what matters the most</div>
        <div class="progress-bar">
            <div class="progress"></div>
        </div>
    </form>

    <!-- Redirect to Admin Home Page after 3 seconds -->
    <script>
        setTimeout(function () {
            window.location.href = 'admin_homepage.aspx';
        }, 3000);
    </script>
</body>
</html>