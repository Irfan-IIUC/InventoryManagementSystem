
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Globalization

Public Class Products
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            LoadProducts()
        End If

    End Sub

    Private Sub LoadProducts()

        Dim cs As String = ConfigurationManager.ConnectionStrings("InventoryDB").ConnectionString

        Using con As New SqlConnection(cs)


            Dim query As String =
    "SELECT ProductCode, ProductName, Price, StockQuantity, " &
    "(Price * StockQuantity) AS TotalValue, MinimumStock " &
    "FROM dbo.Products ORDER BY ProductID DESC"


            Using cmd As New SqlCommand(query, con)

                Using adapter As New SqlDataAdapter(cmd)

                    Dim dt As New DataTable()
                    adapter.Fill(dt)

                    lblTotalProducts.Text = dt.Rows.Count.ToString()

                    For Each row As DataRow In dt.Rows

                        Dim stock As Integer = Convert.ToInt32(row("StockQuantity"))
                        Dim minimumStock As Integer = Convert.ToInt32(row("MinimumStock"))

                        If stock <= minimumStock Then
                            row("ProductName") = row("ProductName").ToString() & " (LOW STOCK)"
                        End If

                    Next



                    Dim totalValue As Decimal = 0

                    For Each row As DataRow In dt.Rows
                        totalValue += Convert.ToDecimal(row("TotalValue"))
                    Next

                    lblInventoryValue.Text = "৳" & totalValue.ToString("N2")


                    gvProducts.DataSource = dt
                    gvProducts.DataBind()

                End Using
            End Using
        End Using

    End Sub


    Protected Sub btnAddProduct_Click(sender As Object, e As EventArgs) Handles btnAddProduct.Click

        Dim productCode As String = txtProductCode.Text.Trim()
        Dim productName As String = txtProductName.Text.Trim()

        Dim price As Decimal
        Dim stock As Integer

        If productCode = "" OrElse productName = "" Then
            ClientScript.RegisterStartupScript(
                Me.GetType(), "msg",
                "alert('Please enter product code and product name.');", True)
            Return
        End If

        If Not Decimal.TryParse(txtPrice.Text, NumberStyles.Number,
                                CultureInfo.InvariantCulture, price) OrElse price < 0 Then
            ClientScript.RegisterStartupScript(
                Me.GetType(), "msg",
                "alert('Please enter a valid non-negative price.');", True)
            Return
        End If

        If Not Integer.TryParse(txtStock.Text, stock) OrElse stock < 0 Then
            ClientScript.RegisterStartupScript(
                Me.GetType(), "msg",
                "alert('Stock quantity must be a non-negative whole number.');", True)
            Return
        End If

        Dim cs As String =
            ConfigurationManager.ConnectionStrings("InventoryDB").ConnectionString

        Try
            Using con As New SqlConnection(cs)

                Dim query As String =
                    "INSERT INTO Products " &
                    "(ProductCode, ProductName, Price, StockQuantity) " &
                    "VALUES (@ProductCode, @ProductName, @Price, @StockQuantity)"

                Using cmd As New SqlCommand(query, con)

                    cmd.Parameters.AddWithValue("@ProductCode", productCode)
                    cmd.Parameters.AddWithValue("@ProductName", productName)
                    cmd.Parameters.AddWithValue("@Price", price)
                    cmd.Parameters.AddWithValue("@StockQuantity", stock)

                    con.Open()
                    cmd.ExecuteNonQuery()

                End Using
            End Using

            LoadProducts()  ' Refresh the product list from SQL Server

            txtProductCode.Text = ""
            txtProductName.Text = ""
            txtPrice.Text = ""
            txtStock.Text = ""

            ClientScript.RegisterStartupScript(
                Me.GetType(), "msg",
                "alert('Product added successfully!');", True)

        Catch ex As SqlException
            If ex.Number = 2601 OrElse ex.Number = 2627 Then
                ClientScript.RegisterStartupScript(
                    Me.GetType(), "msg",
                    "alert('This product code already exists.');", True)
            Else
                ClientScript.RegisterStartupScript(
                    Me.GetType(), "msg",
                    "alert('Database error. Please try again.');", True)
            End If

        Catch ex As Exception
            ClientScript.RegisterStartupScript(
                Me.GetType(), "msg",
                "alert('Unable to add product. Please try again.');", True)
        End Try

    End Sub

End Class
