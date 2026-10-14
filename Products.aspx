<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Products.aspx.vb" Inherits="InventoryManagementSystem.Products" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Products - Inventory Management System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fb;
        }

        .page-header {
            background-color: #0d6efd;
            color: white;
            padding: 20px;
            border-radius: 10px;
        }

        .content-card {
            background-color: white;
            border-radius: 10px;
            padding: 24px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="container py-4">

            <div class="page-header d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2 class="mb-1">Inventory Management System</h2>
                    <p class="mb-0">Manage your products and stock</p>
                </div>

                <asp:Button ID="btnLogout" runat="server"
                    Text="Logout"
                    CssClass="btn btn-light" />
            </div>

            <div class="row g-3 mb-4">

                <div class="col-md-6">
                    <div class="content-card">
                        <h5>Total Products</h5>
                        <h2 class="text-primary">
                            <asp:Label ID="lblTotalProducts" runat="server" Text="0" />
                        </h2>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="content-card">
                        <h5>Total Inventory Value</h5>
                        <h2 class="text-success">৳
                            <asp:Label ID="lblInventoryValue" runat="server" Text="0.00" />
                        </h2>
                    </div>
                </div>

            </div>

            <div class="content-card mb-4">
                <h4 class="mb-3">Add New Product</h4>

                <div class="row g-3">

                    <div class="col-md-6">
                        <label class="form-label">Product Code</label>
                        <asp:TextBox ID="txtProductCode" runat="server"
                            CssClass="form-control"
                            placeholder="Enter product code" />
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Product Name</label>
                        <asp:TextBox ID="txtProductName" runat="server"
                            CssClass="form-control"
                            placeholder="Enter product name" />
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Price</label>
                        <asp:TextBox ID="txtPrice" runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            placeholder="Enter price" />
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Stock Quantity</label>
                        <asp:TextBox ID="txtStock" runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            placeholder="Enter stock quantity" />
                    </div>

                    <div class="col-12">
                        <asp:Button ID="btnAddProduct" runat="server"
                            Text="Add Product"
                            CssClass="btn btn-primary" />
                    </div>

                </div>
            </div>

            <div class="content-card">
                <h4 class="mb-3">Product List</h4>

                <div class="table-responsive">


                    <asp:GridView ID="gvProducts" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-striped table-hover align-middle"
                        GridLines="None"
                        EmptyDataText="No products added yet.">

                        <Columns>
                            <asp:BoundField DataField="ProductCode"
                                HeaderText="Product Code" />

                            <asp:BoundField DataField="ProductName"
                                HeaderText="Product Name" />

                            <asp:BoundField DataField="Price"
                                HeaderText="Price (৳)"
                                DataFormatString="{0:N2}" />

                            <asp:BoundField DataField="StockQuantity"
                                HeaderText="Stock Quantity" />

                            <asp:BoundField DataField="TotalValue"
                                HeaderText="Total Value (৳)"
                                DataFormatString="{0:N2}" />
                        </Columns>

                        <HeaderStyle CssClass="table-dark" />
                    </asp:GridView>


                </div>
            </div>

        </div>

    </form>
</body>
</html>
