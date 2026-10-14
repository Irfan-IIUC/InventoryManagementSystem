```aspx
<%@ Page Language="vb" AutoEventWireup="false"
    CodeBehind="Login.aspx.vb"
    Inherits="InventoryManagementSystem.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">

    <!-- Defines the character encoding used by the page -->
    <meta charset="utf-8" />

    <!-- Makes the page responsive on mobile devices -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Browser tab title -->
    <title>Login - Inventory Management</title>

    <!-- Imports the Poppins font from Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

    <!-- Imports Bootstrap 5.3.3 for ready-made CSS classes -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <style>

        /* General styling for the entire page */
        body {
            margin: 0; /* Removes the default browser margin */
            min-height: 100vh; /* Makes the page at least the full screen height */
            font-family: 'Poppins', sans-serif; /* Sets the page font */
            background: linear-gradient(135deg, #071952, #088395, #35A29F);
            /* Creates a diagonal gradient background */
        }

        /* Centers the login card horizontally and vertically */
        .login-container {
            min-height: 100vh; /* Uses the full screen height */
            display: flex; /* Enables Flexbox layout */
            justify-content: center; /* Centers content horizontally */
            align-items: center; /* Centers content vertically */
            padding: 25px; /* Adds space around the card */
        }

        /* Styles the main login card */
        .login-card {
            width: 100%; /* Allows the card to use available width */
            max-width: 430px; /* Prevents the card from becoming too wide */
            background: #ffffff; /* Sets a white background */
            border: none; /* Removes the default card border */
            border-radius: 22px; /* Rounds the card corners */
            padding: 35px; /* Adds space inside the card */
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.25);
            /* Adds a shadow behind the card */
        }

        /* Styles the main heading */
        .brand-title {
            color: #071952; /* Sets the heading color */
            font-weight: 700; /* Makes the heading bold */
            letter-spacing: 0.5px; /* Adds slight spacing between letters */
        }

        /* Styles the welcome message below the heading */
        .brand-subtitle {
            color: #64748b; /* Sets a muted gray-blue color */
            font-size: 14px; /* Sets the text size */
        }

        /* Styles labels above the input fields */
        .form-label {
            font-weight: 600; /* Makes labels semi-bold */
            color: #334155; /* Sets the label color */
        }

        /* Styles email and password input fields */
        .form-control {
            padding: 12px 14px; /* Adds space inside each input */
            border: 1px solid #cbd5e1; /* Adds a light border */
            border-radius: 10px; /* Rounds the input corners */
        }

        /* Changes the input appearance when it receives focus */
        .form-control:focus {
            border-color: #088395; /* Changes the border color */
            box-shadow: 0 0 0 0.2rem rgba(8, 131, 149, 0.15);
            /* Adds a subtle focus ring */
        }

        /* Styles the Sign In button */
        .login-btn {
            padding: 12px; /* Adds vertical space inside the button */
            border: none; /* Removes the button border */
            border-radius: 10px; /* Rounds the button corners */
            background: linear-gradient(90deg, #071952, #088395);
            /* Adds a horizontal gradient */
            font-size: 16px; /* Sets the button text size */
            font-weight: 600; /* Makes the button text semi-bold */
            transition: 0.3s; /* Makes hover changes smoother */
        }

        /* Changes the button appearance when the mouse hovers over it */
        .login-btn:hover {
            background: linear-gradient(90deg, #088395, #35A29F);
            /* Changes the gradient colors */
            transform: translateY(-2px); /* Moves the button slightly upward */
        }

        /* Styles the Register here link */
        .register-link {
            color: #088395; /* Sets the link color */
            font-weight: 600; /* Makes the link text semi-bold */
            text-decoration: none; /* Removes the default underline */
        }

        /* Changes the Register link appearance on hover */
        .register-link:hover {
            color: #071952; /* Changes the link color */
            text-decoration: underline; /* Adds an underline */
        }

        /* Styles the footer text */
        .footer-text {
            color: #94a3b8; /* Sets a light gray-blue color */
            font-size: 12px; /* Makes the footer text smaller */
        }

        /* Applies these styles on screens up to 480 pixels wide */
        @media (max-width: 480px) {

            .login-card {
                padding: 25px 20px; /* Reduces padding on small screens */
            }

        }

    </style>
</head>

<body>

    <!-- ASP.NET server form: allows server controls to submit data -->
    <form id="form1" runat="server">

        <!-- Main container that centers the login card -->
        <div class="login-container">

            <!-- Bootstrap card containing the complete login interface -->
            <div class="card login-card">

                <!-- Heading and welcome message -->
                <div class="text-center mb-4">

                    <!-- Application name -->
                    <h3 class="brand-title">Inventory Management</h3>

                    <!-- Short welcome message -->
                    <p class="brand-subtitle mb-0">
                        Welcome back! Please sign in
                    </p>

                </div>

                <!-- Email input section -->
                <div class="mb-3">

                    <!-- Label associated with the email TextBox -->
                    <label for="txtEmail" class="form-label">
                        Email Address
                    </label>

                    <!-- ASP.NET TextBox for entering the user's email -->
                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email"
                        placeholder="Enter your email" />

                </div>

                <!-- Password input section -->
                <div class="mb-3">

                    <!-- Label associated with the password TextBox -->
                    <label for="txtPassword" class="form-label">
                        Password
                    </label>

                    <!-- ASP.NET TextBox hides the entered password characters -->
                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Enter your password" />

                </div>

                <!-- Displays login errors or other server-side messages -->
                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="text-danger mb-3 d-block" />

                <!-- Login button; its click event is handled in Login.aspx.vb -->
                <asp:Button
                    ID="btnLogin"
                    runat="server"
                    Text="Sign In"
                    CssClass="btn btn-primary login-btn w-100" />

                <!-- Link for users who do not have an account -->
                <p class="text-center mt-4 mb-0">
                    Don't have an account?

                    <!-- Navigates to the registration page -->
                    <a href="Register.aspx" class="register-link">
                        Register here
                    </a>
                </p>

                <!-- Footer section -->
                <div class="text-center mt-4">

                    <!-- Company credit displayed at the bottom of the card -->
                    <span class="footer-text">
                        Powered By :: Automation & System, KDS Logistics Ltd.
                    </span>

                </div>

            </div>
            <!-- End of login card -->

        </div>
        <!-- End of main container -->

    </form>
    <!-- End of ASP.NET server form -->

</body>
</html>
```