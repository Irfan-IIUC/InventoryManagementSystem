
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="InventoryManagementSystem.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Register - Inventory Management System</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Poppins Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #071952, #088395, #35A29F);
        }

        .register-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 25px;
        }

        .register-card {
            width: 100%;
            max-width: 480px;
            background: #ffffff;
            border: none;
            border-radius: 22px;
            padding: 35px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.25);
        }

        .logo {
            width: 100px;
            height: 100px;
            object-fit: contain;
            margin-bottom: 15px;
        }

        .brand-title {
            color: #071952;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .brand-subtitle {
            color: #64748b;
            font-size: 14px;
        }

        .form-label {
            font-weight: 600;
            color: #334155;
        }

        .form-control {
            padding: 12px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
        }

        .form-control:focus {
            border-color: #088395;
            box-shadow: 0 0 0 0.2rem rgba(8, 131, 149, 0.15);
        }

        .register-btn {
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(90deg, #071952, #088395);
            font-size: 16px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            transition: 0.3s;
        }

        .register-btn:hover {
            background: linear-gradient(90deg, #088395, #35A29F);
            transform: translateY(-2px);
        }

        .login-link {
            color: #088395;
            font-weight: 600;
            text-decoration: none;
        }

        .login-link:hover {
            color: #071952;
            text-decoration: underline;
        }

        .footer-text {
            color: #94a3b8;
            font-size: 12px;
        }

        @media (max-width: 480px) {
            .register-card {
                padding: 25px 20px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="register-container">
            <div class="card register-card">

                <!-- Company Logo and Heading -->
                <div class="text-center mb-4">

                    <img src="Images/logo.png"
                         alt="Company Logo"
                         class="logo" />

                    <h2 class="brand-title">Create Account</h2>

                    <p class="brand-subtitle mb-0">
                        Register to access your inventory system.
                    </p>

                </div>

                <!-- Full Name -->
                <div class="mb-3">
                    <label for="txtFullName" class="form-label">
                        Full Name
                    </label>

                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter your full name" />
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">
                        Email Address
                    </label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email"
                        placeholder="Enter your email" />
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">
                        Password
                    </label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Create a password" />
                </div>

                <!-- Registration Button -->
                <asp:Button
                    ID="btnRegister"
                    runat="server"
                    Text="Create Account"
                    CssClass="btn btn-primary register-btn w-100"
                    OnClick="btnRegister_Click" />

                <!-- Registration Message -->
                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="d-block mt-3 text-center" />

                <!-- Login Link -->
                <p class="text-center mt-4 mb-0">
                    Already have an account?
                    <a href="Login.aspx" class="login-link">
                        Sign in
                    </a>
                </p>

                <!-- Footer -->
                <div class="text-center mt-4">
                    <span class="footer-text">
                        Powered By :: Automation & System, KDS Logistics Ltd.
                    </span>
                </div>

            </div>
        </div>

    </form>
</body>
</html>
