
<%@ Page Language="vb" AutoEventWireup="false"
    CodeBehind="Transactions.aspx.vb"
    Inherits="InventoryManagementSystem.Transactions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Purchase &amp; Sales - Inventory Management</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7fb;
            color: #1b2a41;
        }

        .page-header {
            background: linear-gradient(135deg, #071952, #088395);
            color: white;
            padding: 28px;
            border-radius: 16px;
            margin-bottom: 24px;
        }

        .content-card {
            background: white;
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.06);
            padding: 26px;
            margin-bottom: 24px;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-save {
            background: #088395;
            color: white;
            border: none;
        }

        .btn-save:hover {
            background: #071952;
            color: white;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container py-4">

            <div class="page-header">
                <h2 class="fw-bold mb-2">Purchase &amp; Sales Management</h2>
                <p class="mb-0">
                    Record stock purchases and sales, and track transactions.
                </p>
            </div>

            <div class="content-card">
                <h4 class="fw-semibold mb-4">Record a Transaction</h4>

                <div class="row g-3">

                    <div class="col-md-6">
                        <label class="form-label">Product</label>
                        <asp:DropDownList ID="ddlProduct" runat="server"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Transaction Type</label>
                        <asp:DropDownList ID="ddlTransactionType" runat="server"
                            CssClass="form-select">
                            <asp:ListItem Text="Select Transaction Type"
                                Value="" />
                            <asp:ListItem Text="Purchase" Value="Purchase" />
                            <asp:ListItem Text="Sale" Value="Sale" />
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Quantity</label>
                        <asp:TextBox ID="txtQuantity" runat="server"
                            CssClass="form-control"
                            TextMode="Number" />
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Unit Price (৳)</label>
                        <asp:TextBox ID="txtUnitPrice" runat="server"
                            CssClass="form-control"
                            TextMode="Number" />
                    </div>

                    <div class="col-12">
                        <asp:Label ID="lblMessage" runat="server"
                            CssClass="d-block mb-3" />

                        <asp:Button ID="btnSaveTransaction" runat="server"
                            Text="Save Transaction"
                            CssClass="btn btn-save px-4" />
                    </div>

                </div>
            </div>

            <div class="content-card">
                <h4 class="fw-semibold mb-3">Transaction History</h4>

                <div class="table-responsive">
                    <asp:GridView ID="gvTransactions" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-striped table-hover align-middle"
                        GridLines="None"
                        EmptyDataText="No transactions recorded yet.">

                        <Columns>
                            <asp:BoundField DataField="TransactionID"
                                HeaderText="Transaction ID" />

                            <asp:BoundField DataField="ProductName"
                                HeaderText="Product" />

                            <asp:BoundField DataField="TransactionType"
                                HeaderText="Type" />

                            <asp:BoundField DataField="Quantity"
                                HeaderText="Quantity" />

                            <asp:BoundField DataField="UnitPrice"
                                HeaderText="Unit Price (৳)"
                                DataFormatString="{0:N2}" />

                            <asp:BoundField DataField="TransactionDate"
                                HeaderText="Date"
                                DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
                        </Columns>

                        <HeaderStyle CssClass="table-dark" />
                    </asp:GridView>
                </div>
            </div>

            <a href="Products.aspx" class="btn btn-outline-secondary">
                Back to Products
            </a>

        </div>
    </form>
</body>
</html>
