<%@ Page Language="vb" AutoEventWireup="false"
    CodeBehind="Transactions.aspx.vb"
    Inherits="InventoryManagementSystem.Transactions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Purchase &amp; Sales - Inventory Management System</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <!-- Poppins Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
        rel="stylesheet" />

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #071952, #088395, #35A29F);
            background-attachment: fixed;
            color: #334155;
        }

        .main-container {
            max-width: 1450px;
        }

        /* Page Header */
        .page-header {
            background: linear-gradient(110deg, #071952, #088395);
            color: white;
            padding: 24px 28px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .page-header h2 {
            font-size: 24px;
            font-weight: 700;
        }

        .page-header p {
            color: #dbeafe;
            font-size: 13px;
        }

        /* Content Cards */
        .content-card {
            background: #ffffff;
            border: none;
            border-radius: 16px;
            padding: 26px;
            margin-bottom: 24px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.10);
        }

        .section-title {
            color: #071952;
            font-size: 19px;
            font-weight: 700;
        }

        .section-description {
            color: #64748b;
            font-size: 13px;
        }

        /* Form Fields */
        .form-label {
            font-size: 13px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 8px;
        }

        .form-control,
        .form-select {
            padding: 12px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #088395;
            box-shadow: 0 0 0 0.2rem rgba(8, 131, 149, 0.15);
        }

        /* Buttons */
        .btn {
            border-radius: 9px;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.25s ease;
        }

        .btn-save {
            color: white;
            background: linear-gradient(90deg, #071952, #088395);
            border: none;
            padding: 12px 24px;
        }

        .btn-save:hover {
            color: white;
            background: linear-gradient(90deg, #088395, #35A29F);
            transform: translateY(-2px);
        }

        .btn-back {
            color: #ffffff;
            background: #071952;
            border: 1px solid #ffffff;
            padding: 11px 20px;
        }

        .btn-back:hover {
            color: #071952;
            background: #ffffff;
        }

        /* Transaction Table */
        .table-responsive {
            border-radius: 10px;
        }

        .table {
            margin-bottom: 0;
            font-size: 13px;
            white-space: nowrap;
        }

        .table thead th {
            background: #071952;
            color: #ffffff;
            padding: 15px 12px;
            font-weight: 600;
            border: none;
        }

        .table tbody td {
            padding: 13px 12px;
            vertical-align: middle;
        }

        .table tbody tr:hover td {
            background-color: #effafa;
        }

        .table tbody tr:last-child td {
            border-bottom: none;
        }

        .footer-text {
            color: #ffffff;
            font-size: 12px;
            text-align: center;
            padding: 20px 0 5px;
        }

        @media (max-width: 767px) {
            .page-header {
                padding: 18px;
            }

            .brand-logo {
                width: 55px;
                height: 55px;
            }

            .page-header h2 {
                font-size: 17px;
            }

            .page-header p {
                font-size: 11px;
            }

            .content-card {
                padding: 18px;
            }

            .section-title {
                font-size: 17px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="container-fluid main-container py-4 px-3 px-lg-4">

            <!-- Page Header -->
            <div
                class="page-header d-flex justify-content-between align-items-center mb-4">

                <!-- Groups the application heading and subtitle together -->
                <div class="d-flex align-items-center gap-3">

                    <div>

                        <!-- Main application heading -->
                        <h2 class="mb-1">Sales Management</h2>

                        <!-- Short description of the page's purpose -->
                        <p class="mb-0">Record purchases, manage sales, and
                            track inventory transactions</p>

                    </div>

                </div>

                <!-- Navigation actions: Purchase & Sales and Logout buttons aligned to the right -->
                <div
                    class="d-flex justify-content-end align-items-center gap-2">

                    <!-- Navigate to the Purchase and Sales Management page -->
                    <a href="Products.aspx" class="btn btn-back">
                        &#8592; Back to Products
                    </a>

                </div>

            </div>

            <!-- Record Transaction -->
            <div class="content-card">

                <h4 class="section-title mb-2">Record a Transaction</h4>

                <p class="section-description mb-4">
                    Select a product and enter the transaction details below.
                </p>

                <div class="row g-3">

                    <!-- Product -->
                    <div class="col-md-6">
                        <label for="ddlProduct" class="form-label">
                            Product
                        </label>

                        <asp:DropDownList ID="ddlProduct" runat="server"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <!-- Transaction Type -->
                    <div class="col-md-6">
                        <label for="ddlTransactionType" class="form-label">
                            Transaction Type
                        </label>

                        <asp:DropDownList ID="ddlTransactionType" runat="server"
                            CssClass="form-select">

                            <asp:ListItem Text="Select Transaction Type"
                                Value="" />

                            <asp:ListItem Text="Purchase" Value="Purchase" />

                            <asp:ListItem Text="Sale" Value="Sale" />

                        </asp:DropDownList>
                    </div>

                    <!-- Quantity -->
                    <div class="col-md-6">
                        <label for="txtQuantity" class="form-label">
                            Quantity
                        </label>

                        <asp:TextBox ID="txtQuantity" runat="server"
                            CssClass="form-control" TextMode="Number"
                            placeholder="Enter quantity" />
                    </div>

                    <!-- Unit Price -->
                    <div class="col-md-6">
                        <label for="txtUnitPrice" class="form-label">
                            Unit Price (৳)
                        </label>

                        <asp:TextBox ID="txtUnitPrice" runat="server"
                            CssClass="form-control" TextMode="Number"
                            placeholder="Enter unit price" />
                    </div>

                    <!-- Message and Save Button -->
                    <div class="col-12 mt-4">

                        <asp:Label ID="lblMessage" runat="server"
                            CssClass="d-block mb-3" />

                        <asp:Button ID="btnSaveTransaction" runat="server"
                            Text="Save Transaction" CssClass="btn btn-save" />

                    </div>

                </div>
            </div>

            <!-- Transaction History -->
            <div class="content-card">

                <h4 class="section-title mb-2">Transaction History</h4>

                <p class="section-description mb-4">
                    Review previously recorded purchases and sales.
                </p>

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

            <!-- Footer -->
            <div class="footer-text">
                Powered By :: Automation & System, KDS Logistics Ltd.
            </div>

        </div>

    </form>
</body>

</html>