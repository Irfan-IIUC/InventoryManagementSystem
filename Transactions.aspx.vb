
' Import basic .NET functionality.
Imports System

' Import configuration settings from Web.config.
Imports System.Configuration

' Import DataTable and other data-related classes.
Imports System.Data

' Import SQL Server database classes.
Imports System.Data.SqlClient

' Import number parsing and formatting classes.
Imports System.Globalization

' Define the Transactions page class.
Public Class Transactions
    Inherits System.Web.UI.Page

    ' Get the SQL Server connection string from Web.config.
    Private ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("InventoryDB").ConnectionString

    ' Check whether the user is logged in before initializing the page.
    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init

        If Session("UserEmail") Is Nothing OrElse Session("UserID") Is Nothing Then

            Response.Redirect("Login.aspx", False)
            Context.ApplicationInstance.CompleteRequest()
            Return

        End If

    End Sub

    ' Load products and transaction history when the page first opens.
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            LoadProducts()
            LoadTransactions()
        End If

    End Sub

    ' Load available products into the product dropdown.
    Private Sub LoadProducts()

        Using con As New SqlConnection(connectionString)

            Dim query As String = "SELECT ProductID, ProductCode, ProductName FROM dbo.Products ORDER BY ProductName"

            Using cmd As New SqlCommand(query, con)

                con.Open()

                Using reader As SqlDataReader = cmd.ExecuteReader()

                    ddlProduct.DataSource = reader
                    ddlProduct.DataTextField = "ProductName"
                    ddlProduct.DataValueField = "ProductID"
                    ddlProduct.DataBind()

                End Using

            End Using

        End Using

        ' Add a default selection at the beginning of the dropdown.
        ddlProduct.Items.Insert(0, New ListItem("Select a Product", ""))

    End Sub

    ' Load transaction history and display it in the GridView.
    Private Sub LoadTransactions()

        Using con As New SqlConnection(connectionString)

            Dim query As String =
                "SELECT T.TransactionID, P.ProductName, " &
                "T.TransactionType, T.Quantity, T.UnitPrice, " &
                "T.TransactionDate " &
                "FROM dbo.InventoryTransactions T " &
                "INNER JOIN dbo.Products P " &
                "ON T.ProductID = P.ProductID " &
                "ORDER BY T.TransactionID DESC"

            Using cmd As New SqlCommand(query, con)

                Using adapter As New SqlDataAdapter(cmd)

                    Dim dt As New DataTable()
                    adapter.Fill(dt)

                    gvTransactions.DataSource = dt
                    gvTransactions.DataBind()

                End Using

            End Using

        End Using

    End Sub

    ' Validate and save a purchase or sale transaction.
    Protected Sub btnSaveTransaction_Click(
        sender As Object,
        e As EventArgs
    ) Handles btnSaveTransaction.Click

        ' Get the logged-in user's ID from the session.
        If Session("UserID") Is Nothing Then
            Response.Redirect("Login.aspx", False)
            Context.ApplicationInstance.CompleteRequest()
            Return
        End If

        Dim userID As Integer =
            Convert.ToInt32(Session("UserID"))

        ' Validate the selected product.
        Dim productID As Integer

        If Not Integer.TryParse(ddlProduct.SelectedValue, productID) _
            OrElse productID <= 0 Then

            lblMessage.Text = "Please select a product."
            lblMessage.CssClass = "d-block mb-3 text-danger"
            Return

        End If

        ' Validate the transaction type.
        Dim transactionType As String =
            ddlTransactionType.SelectedValue

        If transactionType <> "Purchase" AndAlso
           transactionType <> "Sale" Then

            lblMessage.Text = "Please select Purchase or Sale."
            lblMessage.CssClass = "d-block mb-3 text-danger"
            Return

        End If

        ' Validate the transaction quantity.
        Dim quantity As Integer

        If Not Integer.TryParse(txtQuantity.Text.Trim(), quantity) _
            OrElse quantity <= 0 Then

            lblMessage.Text = "Quantity must be a positive whole number."
            lblMessage.CssClass = "d-block mb-3 text-danger"
            Return

        End If

        ' Validate the unit price.
        Dim unitPrice As Decimal

        If Not Decimal.TryParse(
            txtUnitPrice.Text.Trim(),
            NumberStyles.Number,
            CultureInfo.CurrentCulture,
            unitPrice
        ) OrElse unitPrice < 0D Then

            lblMessage.Text = "Please enter a valid, non-negative unit price."
            lblMessage.CssClass = "d-block mb-3 text-danger"
            Return

        End If

        Try

            Using con As New SqlConnection(connectionString)

                con.Open()

                ' Start a database transaction so the stock update
                ' and transaction record succeed or fail together.
                Using dbTransaction As SqlTransaction =
                    con.BeginTransaction()

                    Try

                        ' Lock the product row while checking and updating stock.
                        Dim stockQuery As String =
                            "SELECT StockQuantity " &
                            "FROM dbo.Products WITH (UPDLOCK, ROWLOCK) " &
                            "WHERE ProductID = @ProductID"

                        Dim currentStock As Integer

                        Using stockCmd As New SqlCommand(
                            stockQuery,
                            con,
                            dbTransaction
                        )

                            stockCmd.Parameters.Add(
                                "@ProductID",
                                SqlDbType.Int
                            ).Value = productID

                            Dim stockResult As Object =
                                stockCmd.ExecuteScalar()

                            If stockResult Is Nothing OrElse
                               stockResult Is DBNull.Value Then

                                Throw New InvalidOperationException(
                                    "The selected product was not found."
                                )

                            End If

                            currentStock =
                                Convert.ToInt32(stockResult)

                        End Using

                        ' Calculate the new stock quantity.
                        Dim newStock As Integer

                        If transactionType = "Purchase" Then

                            ' Prevent an integer overflow when adding stock.
                            If quantity > Integer.MaxValue - currentStock Then

                                Throw New InvalidOperationException(
                                    "The resulting stock quantity is too large."
                                )

                            End If

                            ' Purchases increase stock.
                            newStock = currentStock + quantity

                        Else

                            ' Sales cannot exceed available stock.
                            If quantity > currentStock Then

                                Throw New InvalidOperationException(
                                    "Insufficient stock. Available quantity: " &
                                    currentStock.ToString()
                                )

                            End If

                            ' Sales decrease stock.
                            newStock = currentStock - quantity

                        End If

                        ' Update the product's stock quantity.
                        Dim updateQuery As String =
                            "UPDATE dbo.Products " &
                            "SET StockQuantity = @StockQuantity " &
                            "WHERE ProductID = @ProductID"

                        Using updateCmd As New SqlCommand(
                            updateQuery,
                            con,
                            dbTransaction
                        )

                            updateCmd.Parameters.Add(
                                "@StockQuantity",
                                SqlDbType.Int
                            ).Value = newStock

                            updateCmd.Parameters.Add(
                                "@ProductID",
                                SqlDbType.Int
                            ).Value = productID

                            Dim rowsUpdated As Integer =
                                updateCmd.ExecuteNonQuery()

                            If rowsUpdated <> 1 Then
                                Throw New InvalidOperationException(
                                    "The product stock could not be updated."
                                )
                            End If

                        End Using

                        ' Insert the transaction history record.
                        ' TransactionDate uses the database default.
                        Dim insertQuery As String =
                            "INSERT INTO dbo.InventoryTransactions " &
                            "(ProductID, TransactionType, Quantity, " &
                            "UnitPrice, UserID) " &
                            "VALUES (@ProductID, @TransactionType, " &
                            "@Quantity, @UnitPrice, @UserID)"

                        Using insertCmd As New SqlCommand(
                            insertQuery,
                            con,
                            dbTransaction
                        )

                            insertCmd.Parameters.Add(
                                "@ProductID",
                                SqlDbType.Int
                            ).Value = productID

                            insertCmd.Parameters.Add(
                                "@TransactionType",
                                SqlDbType.NVarChar,
                                10
                            ).Value = transactionType

                            insertCmd.Parameters.Add(
                                "@Quantity",
                                SqlDbType.Int
                            ).Value = quantity

                            Dim priceParameter =
                                insertCmd.Parameters.Add(
                                    "@UnitPrice",
                                    SqlDbType.Decimal
                                )

                            priceParameter.Precision = 18
                            priceParameter.Scale = 2
                            priceParameter.Value = unitPrice

                            insertCmd.Parameters.Add(
                                "@UserID",
                                SqlDbType.Int
                            ).Value = userID

                            insertCmd.ExecuteNonQuery()

                        End Using

                        ' Save both database changes.
                        dbTransaction.Commit()

                    Catch

                        ' Undo the stock update if anything failed
                        ' before the transaction was committed.
                        Try
                            dbTransaction.Rollback()
                        Catch
                            ' Preserve the original error.
                        End Try

                        Throw

                    End Try

                End Using

            End Using

            ' Show a success message.
            lblMessage.Text =
                transactionType & " transaction saved successfully!"

            lblMessage.CssClass = "d-block mb-3 text-success"

            ' Clear the input fields.
            ddlProduct.SelectedIndex = 0
            ddlTransactionType.SelectedIndex = 0
            txtQuantity.Text = ""
            txtUnitPrice.Text = ""

            ' Refresh the product list and transaction history.
            LoadProducts()
            LoadTransactions()

        Catch ex As InvalidOperationException

            ' Show validation errors, such as insufficient stock.
            lblMessage.Text = ex.Message
            lblMessage.CssClass = "d-block mb-3 text-danger"

        Catch ex As Exception

            ' Show a general message for unexpected database errors.
            lblMessage.Text =
                "Transaction failed. Please check the database configuration and try again."

            lblMessage.CssClass = "d-block mb-3 text-danger"

        End Try

    End Sub

End Class
