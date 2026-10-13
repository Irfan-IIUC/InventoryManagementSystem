<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="InventoryManagementSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Login - Inventory Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>

<body class="bg-light">

    <form id="form1" runat="server">

        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            <div class="card shadow p-4" style="max-width: 420px; width: 100%;">

                <h2 class="text-center mb-4">User Login</h2>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email Address</label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email"
                        placeholder="Enter your email" />
                </div>
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Password</label>

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
                    Text="Login"
                    CssClass="btn btn-primary w-100" />
                <p class="text-center mt-3 mb-0">
                    Don't have an account?
                   
                    <a href="Register.aspx">Register here</a>
                </p>

            </div>
        </div>

    </form>

</body>

</html>
