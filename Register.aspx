<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="InventoryManagementSystem.Register" %>

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Imports the Poppins font from Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <!-- Loads the register page styles from the Content folder -->
    <link href="Content/Register.css" rel="stylesheet"/>

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
                    OnClick="btnRegister_Click" /> <!-- OnClick connects the button to its VB.NET event handler -->

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