
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="InventoryManagementSystem.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Login - Inventory Management</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #071952, #088395, #35A29F);
        }

        .login-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 25px;
        }

        .login-card {
            width: 100%;
            max-width: 430px;
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
        }

        .form-control:focus {
            border-color: #088395;
            box-shadow: 0 0 0 0.2rem rgba(8, 131, 149, 0.15);
        }

        .login-btn {
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(90deg, #071952, #088395);
            font-size: 16px;
            font-weight: 600;
            transition: 0.3s;
        }

        .login-btn:hover {
            background: linear-gradient(90deg, #088395, #35A29F);
            transform: translateY(-2px);
        }

        .register-link {
            color: #088395;
            font-weight: 600;
            text-decoration: none;
        }

        .register-link:hover {
            color: #071952;
            text-decoration: underline;
        }

        .footer-text {
            color: #94a3b8;
            font-size: 12px;
        }

        @media (max-width: 480px) {
            .login-card {
                padding: 25px 20px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="login-container">
            <div class="card login-card">

                <div class="text-center mb-4">

                    <img src="Images/logo.png"
                         alt="Company Logo"
                         class="logo" />

                    <h5 class="brand-title">Inventory Management System</h5>

                    <p class="brand-subtitle mb-0">
                        Welcome back! Please sign in.
                    </p>

                </div>

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

                <div class="mb-3">
                    <label for="txtPassword" class="form-label">
                        Password
                    </label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Enter your password" />
                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="text-danger mb-3 d-block" />

                <asp:Button
                    ID="btnLogin"
                    runat="server"
                    Text="Sign In"
                    CssClass="btn btn-primary login-btn w-100" />

                <p class="text-center mt-4 mb-0">
                    Don't have an account?
                    <a href="Register.aspx" class="register-link">
                        Register here
                    </a>
                </p>

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
