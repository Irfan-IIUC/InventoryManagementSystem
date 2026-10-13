
Imports System
Imports System.Configuration
Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click

        Dim email As String = txtEmail.Text.Trim()
        Dim password As String = txtPassword.Text

        If email = "" OrElse password = "" Then
            lblMessage.Text = "Please enter email and password."
            Return
        End If

        Dim cs As String =
            ConfigurationManager.ConnectionStrings("InventoryDB").ConnectionString

        Try
            Using con As New SqlConnection(cs)

                Dim query As String =
                    "SELECT COUNT(*) FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash"

                Using cmd As New SqlCommand(query, con)

                    cmd.Parameters.AddWithValue("@Email", email)
                    cmd.Parameters.AddWithValue("@PasswordHash", password)

                    con.Open()

                    Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar())

                    If count > 0 Then
                        Session("UserEmail") = email
                        Response.Redirect("Products.aspx", False)
                        Context.ApplicationInstance.CompleteRequest()
                    Else
                        lblMessage.Text = "Invalid email or password."
                    End If

                End Using
            End Using

        Catch ex As Exception
            lblMessage.Text = "Login failed. Please try again."
        End Try

    End Sub

End Class
