
<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Products.aspx.vb" Inherits="InventoryManagementSystem.Products" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">

    <!-- Defines character encoding to support text and symbols such as the Bangladeshi Taka sign -->
    <meta charset="utf-8" />

    <!-- Makes the page responsive on desktops, tablets, and mobile devices -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Sets the title displayed in the browser tab -->
    <title>Products - Inventory</title>

    <!-- Imports Bootstrap 5.3.3 for responsive layouts, grids, buttons, and other UI components -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Imports the Poppins font from Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

    <!-- Custom CSS styles for the inventory management page -->
    <style>

        /* Sets the overall page background, font, minimum height, and text color */
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #071952, #088395, #35A29F);
            background-attachment: fixed;
            min-height: 100vh;
            color: #334155;
        }

        /* Restricts the maximum width of the main page content */
        .main-container {
            max-width: 1450px;
        }

        /* Styles the top header containing the page title and logout button */
        .page-header {
            background: linear-gradient(110deg, #071952, #088395);
            color: white;
            padding: 24px 28px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        /* Sets the header title's font weight and size */
        .page-header h2 {
            font-weight: 700;
            font-size: 25px;
        }

        /* Styles the subtitle beneath the page heading */
        .page-header p {
            color: #dbeafe;
            font-size: 14px;
        }

        /* Creates white cards for dashboard statistics, forms, and product listings */
        .content-card {
            background: #ffffff;
            border: none;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.10);
            height: 100%;
        }

        /* Styles section headings such as Add New Product and Product List */
        .section-title {
            color: #071952;
            font-weight: 700;
            font-size: 19px;
        }

        /* Provides a hover animation for dashboard statistic cards */
        .stat-card {
            position: relative;
            overflow: hidden;
            transition: transform 0.25s ease;
        }

        /* Moves a statistic card slightly upward when the mouse hovers over it */
        .stat-card:hover {
            transform: translateY(-4px);
        }

        /* Defines green colors for inventory-value-related icons or elements */
        .value-icon {
            color: #15803d;
            background: #dcfce7;
        }

        /* Styles the labels above dashboard statistic values */
        .stat-label {
            color: #64748b;
            font-size: 14px;
            font-weight: 500;
        }

        /* Styles the numerical values displayed in the dashboard */
        .stat-number {
            font-weight: 700;
            color: #071952;
            font-size: 30px;
            overflow-wrap: anywhere;
        }

        /* Highlights the total inventory value in green */
        .value-number {
            color: #15803d;
        }

        /* Styles labels displayed above the product form input fields */
        .form-label {
            color: #334155;
            font-weight: 600;
            font-size: 13px;
            margin-bottom: 8px;
        }

        /* Applies consistent spacing, borders, and typography to text boxes */
        .form-control {
            padding: 11px 13px;
            border: 1px solid #cbd5e1;
            border-radius: 9px;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
        }

        /* Highlights an input field when the user selects it */
        .form-control:focus {
            border-color: #088395;
            box-shadow: 0 0 0 0.2rem rgba(8, 131, 149, 0.15);
        }

        /* Applies consistent rounded corners, font, and animation to buttons */
        .btn {
            border-radius: 9px;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        /* Defines the gradient background of primary buttons */
        .btn-primary {
            background: linear-gradient(90deg, #071952, #088395);
            border: none;
        }

        /* Changes the primary button's gradient and position on hover */
        .btn-primary:hover {
            background: linear-gradient(90deg, #088395, #35A29F);
            transform: translateY(-1px);
        }

        /* Styles the Update Product button */
        .btn-success {
            background: #15803d;
            border-color: #15803d;
        }

        /* Styles the Delete button */
        .btn-danger {
            background: #dc3545;
            border-color: #dc3545;
        }

        /* Styles the Logout button */
        .btn-light {
            color: #071952;
            font-weight: 600;
        }

        /* Rounds the corners of the responsive product table container */
        .table-responsive {
            border-radius: 10px;
        }

        /* Sets the product table's font size and prevents text from wrapping */
        .table {
            margin-bottom: 0;
            font-size: 13px;
            white-space: nowrap;
        }

        /* Styles the table header row */
        .table thead th {
            background: #071952;
            color: #ffffff;
            padding: 15px 12px;
            font-weight: 600;
            border: none;
        }

        /* Controls the spacing and vertical alignment of table cells */
        .table tbody td {
            padding: 13px 12px;
            vertical-align: middle;
        }

        /* Changes a product row's background when the mouse hovers over it */
        .table tbody tr:hover td {
            background-color: #effafa;
        }

        /* Removes the bottom border from the last product row */
        .table tbody tr:last-child td {
            border-bottom: none;
        }

        /* Styles the footer displayed below the main content */
        .footer-text {
            color: #ffffff;
            font-size: 12px;
            text-align: center;
            padding: 20px 0 5px;
        }

        /* Adjusts the layout and typography for screens smaller than 768 pixels */
        @media (max-width: 767px) {

            /* Reduces header padding and adds spacing between header elements */
            .page-header {
                padding: 20px;
                gap: 15px;
            }

            /* Reduces the title size on mobile devices */
            .page-header h2 {
                font-size: 18px;
            }

            /* Defines the mobile logo dimensions if a brand-logo element is used */
            .brand-logo {
                width: 55px;
                height: 55px;
            }

            /* Reduces the padding inside content cards on small screens */
            .content-card {
                padding: 18px;
            }

            /* Reduces the dashboard number size on small screens */
            .stat-number {
                font-size: 25px;
            }
        }

    </style>
</head>

<body>

    <!-- Main ASP.NET Web Forms container; server controls must be placed inside this form -->
    <form id="form1" runat="server">

        <!-- Main page container with responsive horizontal and vertical spacing -->
        <div class="container-fluid main-container py-4 px-3 px-lg-4">

            <!-- Page Header: displays the application name, description, and logout button -->
            <div class="page-header d-flex justify-content-between align-items-center mb-4">

                <!-- Groups the application heading and subtitle together -->
                <div class="d-flex align-items-center gap-3">

                    <div>

                        <!-- Main application heading -->
                        <h2 class="mb-1">Inventory Management System</h2>

                        <!-- Short description of the page's purpose -->
                        <p class="mb-0">Manage your products and stock</p>

                    </div>

                </div>

                <!-- Navigation actions: Purchase & Sales and Logout buttons aligned to the right -->
                <div class="d-flex justify-content-end align-items-center gap-2">

                    <!-- Navigate to the Purchase and Sales Management page -->
                    <a href="Transactions.aspx" class="btn btn-warning">
                        Purchase &amp; Sales
                    </a>

                    <!-- Server-side button for logging out; its click event is handled in Products.aspx.vb -->
                    <asp:Button ID="btnLogout" runat="server"
                        Text="Logout"
                        CssClass="btn btn-light px-4" />

                </div>

            </div>

            <!-- Dashboard Statistics: displays summary information about inventory -->

            <div class="row g-3 mb-4">

                <!-- Dashboard card showing the total number of products -->
                <div class="col-md-6">
                    <div class="content-card stat-card">

                        <!-- Label describing the statistic -->
                        <div class="stat-label">Total Products</div>

                        <!-- Server-side label updated by VB.NET with the product count -->
                        <div class="stat-number">
                            <asp:Label ID="lblTotalProducts"
                                runat="server" Text="0" />
                        </div>

                    </div>
                </div>

                <!-- Dashboard card showing the combined value of all inventory stock -->
                <div class="col-md-6">
                    <div class="content-card stat-card">

                        <!-- Label describing the inventory value -->
                        <div class="stat-label">Total Inventory Value</div>

                        <!-- Displays the Taka symbol and the value supplied by VB.NET -->
                        <div class="stat-number value-number">
                            ৳<asp:Label ID="lblInventoryValue"
                                runat="server" Text="0.00" />
                        </div>

                    </div>
                </div>

            </div>

            <!-- Add New Product: form for entering a product's basic information -->

            <div class="content-card mb-4">

                <!-- Heading for the product creation form -->
                <h4 class="section-title mb-4">Add New Product</h4>

                <!-- Bootstrap grid arranges the input fields into responsive columns -->
                <div class="row g-3">

                    <!-- Input field for the unique product code -->
                    <div class="col-md-6">
                        <label class="form-label">Product Code</label>

                        <!-- Server-side text box read by Products.aspx.vb -->
                        <asp:TextBox ID="txtProductCode" runat="server"
                            CssClass="form-control"
                            placeholder="Enter product code" />
                    </div>

                    <!-- Input field for the product name -->
                    <div class="col-md-6">
                        <label class="form-label">Product Name</label>

                        <!-- Stores the product name entered by the user -->
                        <asp:TextBox ID="txtProductName" runat="server"
                            CssClass="form-control"
                            placeholder="Enter product name" />
                    </div>

                    <!-- Input field for the product's unit price -->
                    <div class="col-md-6">
                        <label class="form-label">Price (৳)</label>

                        <!-- Number input for the product price -->
                        <asp:TextBox ID="txtPrice" runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            placeholder="Enter price" />
                    </div>

                    <!-- Input field for the current stock quantity -->
                    <div class="col-md-6">
                        <label class="form-label">Stock Quantity</label>

                        <!-- Number input for the quantity currently in stock -->
                        <asp:TextBox ID="txtStock" runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            placeholder="Enter stock quantity" />
                    </div>

                    <!-- Button that triggers the server-side product insertion event -->
                    <div class="col-12 mt-4">
                        <asp:Button ID="btnAddProduct" runat="server"
                            Text="Add Product"
                            CssClass="btn btn-primary px-4 py-2" />
                    </div>

                </div>

            </div>

            <!-- Edit Product: hidden panel that becomes visible when a product is selected for editing -->

            <asp:Panel ID="pnlEditProduct" runat="server"
                Visible="False"
                CssClass="content-card mb-4">

                <!-- Heading for the product editing form -->
                <h4 class="section-title mb-4">Edit Product</h4>

                <!-- Stores the selected product's database ID without displaying it -->
                <asp:HiddenField ID="hfEditProductID" runat="server" />

                <!-- Responsive layout for the editable product fields -->
                <div class="row g-3">

                    <!-- Field for editing the product code -->
                    <div class="col-md-6">
                        <label class="form-label">Product Code</label>

                        <asp:TextBox ID="txtEditProductCode" runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Field for editing the product name -->
                    <div class="col-md-6">
                        <label class="form-label">Product Name</label>

                        <asp:TextBox ID="txtEditProductName" runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Field for editing the product price -->
                    <div class="col-md-6">
                        <label class="form-label">Price (৳)</label>

                        <asp:TextBox ID="txtEditPrice" runat="server"
                            CssClass="form-control"
                            TextMode="Number" />
                    </div>

                    <!-- Field for editing the current stock quantity -->
                    <div class="col-md-6">
                        <label class="form-label">Stock Quantity</label>

                        <asp:TextBox ID="txtEditStock" runat="server"
                            CssClass="form-control"
                            TextMode="Number" />
                    </div>

                    <!-- Contains the buttons for saving changes or cancelling the edit -->
                    <div class="col-12 mt-4">

                        <!-- Triggers the server-side event that updates the selected product -->
                        <asp:Button ID="btnUpdateProduct" runat="server"
                            Text="Update Product"
                            CssClass="btn btn-success px-4 py-2" />

                        <!-- Cancels editing; CausesValidation=False prevents validation from blocking the action -->
                        <asp:Button ID="btnCancelEdit" runat="server"
                            Text="Cancel"
                            CssClass="btn btn-secondary px-4 py-2 ms-2"
                            CausesValidation="False" />

                    </div>

                </div>

            </asp:Panel>

            <!-- Product List: displays product information retrieved from the database -->

            <div class="content-card">

                <!-- Heading for the product table -->
                <h4 class="section-title mb-4">Product List</h4>

                <!-- Allows the product table to scroll horizontally on smaller screens -->
                <div class="table-responsive">

                    <!-- GridView displays database records using explicitly defined columns -->
                    <asp:GridView ID="gvProducts" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-striped table-hover align-middle"
                        GridLines="None"
                        EmptyDataText="No products added yet.">

                        <%-- Defines which database fields appear in the product table --%>
                        <Columns>

                            <%-- Displays the product code --%>
                            <asp:BoundField DataField="ProductCode"
                                HeaderText="Product Code" />

                            <%-- Displays the product name --%>
                            <asp:BoundField DataField="ProductName"
                                HeaderText="Product Name" />

                            <%-- Displays the unit price with two decimal places --%>
                            <asp:BoundField DataField="Price"
                                HeaderText="Price (৳)"
                                DataFormatString="{0:N2}" />

                            <%-- Displays the current stock quantity --%>
                            <asp:BoundField DataField="StockQuantity"
                                HeaderText="Stock Quantity" />

                            <%-- Displays the minimum stock threshold --%>
                            <asp:BoundField DataField="MinimumStock"
                                HeaderText="Minimum Stock" />

                            <%-- Displays the calculated total inventory value --%>
                            <asp:BoundField DataField="TotalValue"
                                HeaderText="Total Value (৳)"
                                DataFormatString="{0:N2}" />

                            <%-- Custom column containing Edit and Delete buttons --%>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>

                                    <%-- Edit button passes the product ID to the server --%>
                                    <asp:Button
                                        ID="btnEdit"
                                        runat="server"
                                        Text="Edit"
                                        CssClass="btn btn-sm btn-primary me-1"
                                        CommandName="EditProduct"
                                        CommandArgument='<%# Eval("ProductID") %>' />

                                    <%-- Delete button asks for confirmation before deletion --%>
                                    <asp:Button
                                        ID="btnDelete"
                                        runat="server"
                                        Text="Delete"
                                        CssClass="btn btn-sm btn-danger"
                                        CommandName="DeleteProduct"
                                        CommandArgument='<%# Eval("ProductID") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this product?');" />

                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                        <%-- Applies Bootstrap dark styling to the table header --%>
                        <HeaderStyle CssClass="table-dark" />

                    </asp:GridView>

                </div>
            </div>

            <!-- Footer: displays the organization and team attribution -->
            <div class="footer-text">
                Powered By :: Automation & System, KDS Logistics Ltd.
            </div>

        </div>

    </form>

</body>
</html>
