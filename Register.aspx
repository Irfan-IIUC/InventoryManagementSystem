```aspx
<%@ Page Language="vb" AutoEventWireup="false"
    CodeBehind="Register.aspx.vb"
    Inherits="InventoryManagementSystem.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">

    <!-- Defines the character encoding for the webpage -->
    <meta charset="utf-8" />

    <!-- Makes the webpage responsive on different screen sizes -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Sets the browser tab title -->
    <title>Register - Inventory</title>

    <!-- Imports Bootstrap 5.3.3 for predefined CSS classes and styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Imports the Poppins font from Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

    <style>

        /* Applies general styling to the entire webpage */
        body {
            margin: 0; /* Removes the default browser margin */
            min-height: 100vh; /* Makes the page at least the full screen height */
            font-family: 'Poppins', sans-serif; /* Sets the font style */
            background: linear-gradient(135deg, #071952, #088395, #35A29F);
            /* Creates a diagonal gradient background */
        }

        /* Centers the registration card on the screen */
        .register-container {
            min-height: 100vh; /* Uses the full screen height */
            display: flex; /* Enables Flexbox layout */
            justify-content: center; /* Centers the card horizontally */
            align-items: center; /* Centers the card vertically */
            padding: 25px; /* Adds space around the card */
        }

        /* Styles the main registration card */
        .register-card {
            width: 100%; /* Allows the card to use the available width */
            max-width: 480px; /* Limits the maximum card width */
            background: #ffffff; /* Sets a white background */
            border: none; /* Removes the default border */
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

        /* Styles the subtitle below the heading */
        .brand-subtitle {
            color: #64748b; /* Sets the subtitle color */
            font-size: 14px; /* Sets the text size */
        }

        /* Styles the labels above the input fields */
        .form-label {
            font-weight: 600; /* Makes the labels semi-bold */
            color: #334155; /* Sets the label color */
        }

        /* Styles all input fields using the form-control class */
        .form-control {
            padding: 12px 14px; /* Adds space inside the input fields */
            border: 1px solid #cbd5e1; /* Adds a light border */
            border-radius: 10px; /* Rounds the input corners */
            font-family: 'Poppins', sans-serif; /* Uses the Poppins font */
        }

        /* Changes the input field appearance when selected */
        .form-control:focus {
            border-color: #088395; /* Changes the border color */
            box-shadow: 0 0 0 0.2rem rgba(8, 131, 149, 0.15);
            /* Adds a subtle focus ring */
        }

        /* Styles the Create Account button */
        .register-btn {
            padding: 12px; /* Adds space inside the button */
            border: none; /* Removes the default button border */
            border-radius: 10px; /* Rounds the button corners */
            background: linear-gradient(90deg, #071952, #088395);
            /* Creates a horizontal gradient */
            font-size: 16px; /* Sets the button text size */
            font-weight: 600; /* Makes the button text semi-bold */
            font-family: 'Poppins', sans-serif; /* Uses the Poppins font */
            transition: 0.3s; /* Makes hover effects smoother */
        }

        /* Changes the button appearance when the mouse hovers over it */
        .register-btn:hover {
            background: linear-gradient(90deg, #088395, #35A29F);
            /* Changes the gradient colors */
            transform: translateY(-2px); /* Moves the button slightly upward */
        }

        /* Styles the Sign in link */
        .login-link {
            color: #088395; /* Sets the link color */
            font-weight: 600; /* Makes the link semi-bold */
            text-decoration: none; /* Removes the default underline */
        }

        /* Changes the Sign in link when the mouse hovers over it */
        .login-link:hover {
            color: #071952; /* Changes the link color */
            text-decoration: underline; /* Adds an underline */
        }

        /* Styles the footer text */
        .footer-text {
            color: #94a3b8; /* Sets a light gray-blue color */
            font-size: 12px; /* Makes the footer text smaller */
        }

        /* Applies additional styling on small screens */
        @media (max-width: 480px) {

            .register-card {
                padding: 25px 20px; /* Reduces padding on mobile devices */
            }

        }

    </style>

</head>

<body>

    <!-- ASP.NET server form that allows server controls to submit data -->
    <form id="form1" runat="server">

        <!-- Main container that centers the registration card -->
        <div class="register-container">

            <!-- Bootstrap card containing the registration interface -->
            <div class="card register-card">

                <!-- Heading and registration instructions -->
                <div class="text-center mb-4">

                    <!-- Main heading displayed at the top of the card -->
                    <h2 class="brand-title">Create Account</h2>

                    <!-- Explains the purpose of registration -->
                    <p class="brand-subtitle mb-0">
                        Register to access your inventory management
                    </p>

                </div>

                <!-- Full Name input section -->
                <div class="mb-3">

                    <!-- Label associated with the Full Name TextBox -->
                    <label for="txtFullName" class="form-label">
                        Full Name
                    </label>

                    <!-- ASP.NET TextBox for entering the user's full name -->
                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter your full name" />

                </div>

                <!-- Email Address input section -->
                <div class="mb-3">

                    <!-- Label associated with the Email TextBox -->
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

                    <!-- Label associated with the Password TextBox -->
                    <label for="txtPassword" class="form-label">
                        Password
                    </label>

                    <!-- ASP.NET TextBox that hides password characters -->
                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Create a password" />

                </div>

                <!-- Registration button -->
                <asp:Button
                    ID="btnRegister"
                    runat="server"
                    Text="Create Account"
                    CssClass="btn btn-primary register-btn w-100"
                    OnClick="btnRegister_Click" />
                    <!-- OnClick connects the button to its VB.NET event handler -->

                <!-- Displays success or error messages from VB.NET -->
                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="d-block mt-3 text-center" />

                <!-- Link for users who already have an account -->
                <p class="text-center mt-4 mb-0">
                    Already have an account?

                    <!-- Navigates to the Login.aspx page -->
                    <a href="Login.aspx" class="login-link">
                        Sign in
                    </a>

                </p>

                <!-- Footer section -->
                <div class="text-center mt-4">

                    <!-- Displays the company credit -->
                    <span class="footer-text">
                        Powered By :: Automation & System, KDS Logistics Ltd.
                    </span>

                </div>

            </div>
            <!-- End of registration card -->

        </div>
        <!-- End of main container -->

    </form>
    <!-- End of ASP.NET server form -->

</body>

</html>
```