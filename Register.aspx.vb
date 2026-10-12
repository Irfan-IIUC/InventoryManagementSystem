
Imports System
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Security.Cryptography

Public Class Register
    Inherits System.Web.UI.Page

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click

        Dim fullName As String = txtFullName.Text.Trim()
        Dim email As String = txtEmail.Text.Trim()
        Dim password As String = txtPassword.Text

        If fullName = "" OrElse email = "" OrElse password = "" Then
            lblMessage.Text = "Please fill in all fields."
            Return
        End If

        If password.Length < 8 Then
            lblMessage.Text = "Password must contain at least 8 characters."
            Return
        End If

        Dim cs As String = ConfigurationManager.ConnectionStrings("InventoryDB").ConnectionString

        Try
            Using con As New SqlConnection(cs)
                Dim query As String =
                    "INSERT INTO Users (FullName, Email, PasswordHash) " &
                    "VALUES (@FullName, @Email, @PasswordHash)"

                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@FullName", fullName)
                    cmd.Parameters.AddWithValue("@Email", email)
                    cmd.Parameters.AddWithValue("@PasswordHash", password)

                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            lblMessage.Text = "Registration successful!"

        Catch ex As SqlException
            If ex.Number = 2627 OrElse ex.Number = 2601 Then
                lblMessage.Text = "This email is already registered."
            Else
                lblMessage.Text = "Database error. Please try again."
            End If

        Catch ex As Exception
            lblMessage.Text = "Registration failed. Please check your configuration."

        End Try

    End Sub

End Class
