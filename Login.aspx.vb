
' Import the System namespace for basic .NET functionality.
Imports System

' Import classes for reading configuration settings from Web.config.
Imports System.Configuration

' Import classes required to connect to SQL Server.
Imports System.Data.SqlClient

' Define the Login page class.
Public Class Login

    ' Inherit the ASP.NET Web Forms Page class.
    Inherits System.Web.UI.Page

    ' This event runs when the Login button is clicked.
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click

        ' Get the email address entered by the user.
        ' Trim() removes spaces from the beginning and end.
        Dim email As String = txtEmail.Text.Trim()

        ' Get the password entered by the user.
        Dim password As String = txtPassword.Text

        ' Check whether the email or password is empty.
        If email = "" OrElse password = "" Then

            ' Display a message if either field is empty.
            lblMessage.Text = "Please enter email and password."

            ' Stop executing this procedure.
            Return
        End If

        ' Get the database connection string named InventoryDB from Web.config.
        Dim cs As String =
            ConfigurationManager.ConnectionStrings("InventoryDB").ConnectionString

        ' Start a Try block to handle possible errors.
        Try

            ' Create a connection to SQL Server.
            ' Using automatically releases the connection when finished.
            Using con As New SqlConnection(cs)

                ' SQL query that counts users matching the entered email and password.
                Dim query As String =
                    "SELECT COUNT(*) FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash"

                ' Create a SQL command using the query and connection.
                Using cmd As New SqlCommand(query, con)

                    ' Pass the entered email as a SQL parameter.
                    cmd.Parameters.AddWithValue("@Email", email)

                    ' Pass the entered password as a SQL parameter.
                    cmd.Parameters.AddWithValue("@PasswordHash", password)

                    ' Open the database connection.
                    con.Open()

                    ' Execute the query and get the number of matching users.
                    ' Convert the returned value into an Integer.
                    Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar())

                    ' If at least one matching user exists, login is successful.
                    If count > 0 Then

                        ' Store the user's email in the current session.
                        ' This can be used to identify the logged-in user.
                        Session("UserEmail") = email

                        ' Redirect the user to Products.aspx.
                        ' False means do not immediately terminate the current page thread.
                        Response.Redirect("Products.aspx", False)

                        ' Complete the current ASP.NET request safely.
                        Context.ApplicationInstance.CompleteRequest()

                    Else

                        ' Display this message if no matching user is found.
                        lblMessage.Text = "Invalid email or password."

                    End If

                    ' Dispose of the SQL command.
                End Using

                ' Dispose of the database connection.
            End Using

            ' Handle unexpected errors during login.
        Catch ex As Exception

            ' Display a general error message.
            lblMessage.Text = "Login failed. Please try again."

            ' Finish error handling.
        End Try

        ' End of the Login button click event.
    End Sub

    ' End of the Login page class.
End Class
