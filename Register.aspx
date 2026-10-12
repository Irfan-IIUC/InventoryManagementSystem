<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="InventoryManagementSystem.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title></title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>

<body>

    <form id="form1" runat="server">

        
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">

                <div class="card-header bg-primary text-white">
                    <h3 class="text-center mb-0">User Registration</h3>
                </div>

                <div class="card-body">

                    <div class="mb-3">
                        <label class="form-label">Full Name</label>

                        <asp:TextBox ID="txtFullName" runat="server"
                            CssClass="form-control"
                            placeholder="Enter your full name" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>

                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="form-control"
                            TextMode="Email"
                            placeholder="Enter your email" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>

                        <asp:TextBox ID="txtPassword" runat="server"
                            CssClass="form-control"
                            TextMode="Password"
                            placeholder="Create a password" />
                    </div>

                    <asp:Button 
                        ID="btnRegister" 
                        runat="server"
                        Text="Register"
                        CssClass="btn btn-primary w-100" 
                        OnClick="btnRegister_Click" />

                    <asp:Label ID="lblMessage" runat="server"
                        CssClass="d-block mt-3 text-center" />
                </div>

            </div>
        </div>
    </div>
</div>


    </form>

</body>

</html>
