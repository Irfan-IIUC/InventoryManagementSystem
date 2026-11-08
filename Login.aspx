<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="InventoryManagementSystem.Login" %>

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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <!-- Imports Bootstrap 5.3.3 for ready-made CSS classes -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Loads the login page styles from the Content folder -->
    <link href="Content/Login.css" rel="stylesheet" />

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