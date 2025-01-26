<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign.aspx.cs" Inherits="WebApplication1.sign" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In - Luminex</title>
    <style>
        /* Global Styles */
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #1A2A6C, #008081);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
            color: white;
            overflow: hidden;
        }

        /* Particle Background */
        #particles-js {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        /* Main Container */
        .bigger {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            text-align: center;
            width: 700px;
            animation: fadeIn 1s ease-in-out;
            position: relative;
            z-index: 1;
        }

        /* Heading */
        h2 {
            font-size: 28px;
            margin-bottom: 10px;
            color: #FFD700;
            text-transform: uppercase;
            animation: glow 2s infinite alternate;
        }

        /* Subheading */
        p {
            font-size: 18px;
            color: #FFD700;
            margin-bottom: 30px;
            animation: fadeInText 1.5s ease-in-out;
        }

        /* Role Selection Container */
        .big {
            display: flex;
            justify-content: space-around;
            gap: 20px;
        }

        /* Role Card */
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 300px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.05));
            transform: rotate(45deg);
            transition: opacity 0.5s ease;
            opacity: 0;
        }

        .container:hover::before {
            opacity: 1;
        }

        .container:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        /* Role Label */
        .container label {
            font-size: 20px;
            color: #FFD700;
            margin-bottom: 20px;
            display: block;
            animation: fadeInText 1.5s ease-in-out;
        }

        /* Button */
        .button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #008081, #1A2A6C);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.3s ease, background 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .button::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 300%;
            height: 300%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 70%);
            transform: translate(-50%, -50%) scale(0);
            transition: transform 0.5s ease;
        }

        .button:hover::after {
            transform: translate(-50%, -50%) scale(1);
        }

        .button:hover {
            background: linear-gradient(135deg, #1A2A6C, #008081);
            transform: scale(1.05);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes glow {
            0% { text-shadow: 0 0 5px #FFD700, 0 0 10px #FFD700, 0 0 20px #FFD700; }
            100% { text-shadow: 0 0 10px #FFD700, 0 0 20px #FFD700, 0 0 40px #FFD700; }
        }

        @keyframes fadeInText {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
        // Initialize Particles.js
        particlesJS.load('particles-js', 'particles.json', function () {
            console.log('Particles.js loaded!');
        });
    </script>
</head>
<body>
    <!-- Particle Background -->
    <div id="particles-js"></div>

    <form id="form1" runat="server">
        <!-- Main Container -->
        <div class="bigger">
            <h2>Welcome to Luminex</h2>
            <p>Would you like to sign in as:</p>

            <!-- Role Selection Container -->
            <div class="big">
                <!-- Admin Card -->
                <div class="container">
                    <asp:Label ID="Label1" runat="server" Text="Admin"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="signIn" runat="server" OnClick="login_Admin" Text="Sign In" CssClass="button" />
                </div>

                <!-- Customer Card -->
                <div class="container">
                    <asp:Label ID="Label2" runat="server" Text="Customer"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="login_Customer" Text="Sign In" CssClass="button" />
                </div>
            </div>
        </div>
    </form>

    <!-- Particles.js Config -->
    <script>
        // Custom Particles.js Config
        const particlesConfig = {
            particles: {
                number: {
                    value: 80,
                    density: {
                        enable: true,
                        value_area: 800
                    }
                },
                color: {
                    value: "#FFD700"
                },
                shape: {
                    type: "circle",
                    stroke: {
                        width: 0,
                        color: "#000000"
                    },
                    polygon: {
                        nb_sides: 5
                    }
                },
                opacity: {
                    value: 0.5,
                    random: false,
                    anim: {
                        enable: false,
                        speed: 1,
                        opacity_min: 0.1,
                        sync: false
                    }
                },
                size: {
                    value: 3,
                    random: true,
                    anim: {
                        enable: false,
                        speed: 40,
                        size_min: 0.1,
                        sync: false
                    }
                },
                line_linked: {
                    enable: true,
                    distance: 150,
                    color: "#FFD700",
                    opacity: 0.4,
                    width: 1
                },
                move: {
                    enable: true,
                    speed: 6,
                    direction: "none",
                    random: false,
                    straight: false,
                    out_mode: "out",
                    bounce: false,
                    attract: {
                        enable: false,
                        rotateX: 600,
                        rotateY: 1200
                    }
                }
            },
            interactivity: {
                detect_on: "canvas",
                events: {
                    onhover: {
                        enable: true,
                        mode: "repulse"
                    },
                    onclick: {
                        enable: true,
                        mode: "push"
                    },
                    resize: true
                },
                modes: {
                    repulse: {
                        distance: 100,
                        duration: 0.4
                    },
                    push: {
                        particles_nb: 4
                    }
                }
            },
            retina_detect: true
        };

        particlesJS('particles-js', particlesConfig);
    </script>
</body>
</html>
