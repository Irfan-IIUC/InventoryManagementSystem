
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

                ' Retrieve the UserID of the user matching the email and password.
                Dim query As String =
                    "SELECT UserID FROM dbo.Users " &
                    "WHERE Email = @Email AND PasswordHash = @PasswordHash"

                ' Create a SQL command using the query and connection.
                Using cmd As New SqlCommand(query, con)

                    ' Pass the entered email as a SQL parameter.
                    cmd.Parameters.AddWithValue("@Email", email)

                    ' Pass the entered password as a SQL parameter.
                    cmd.Parameters.AddWithValue("@PasswordHash", password)

                    ' Open the database connection.
                    con.Open()

                    ' Execute the query and retrieve the matching UserID.
                    Dim result As Object = cmd.ExecuteScalar()

                    ' Check whether a matching user was found.
                    If result IsNot Nothing AndAlso result IsNot DBNull.Value Then

                        ' Convert the retrieved UserID into an Integer.
                        Dim userID As Integer = Convert.ToInt32(result)

                        ' Store the user's ID in the current session.
                        Session("UserID") = userID

                        ' Store the user's email in the current session.
                        Session("UserEmail") = email

                        ' Redirect the user to Products.aspx.
                        Response.Redirect("Products.aspx", False)

                        ' Complete the current ASP.NET request safely.
                        Context.ApplicationInstance.CompleteRequest()

                    Else

                        ' Display this message if no matching user is found.
                        lblMessage.Text = "Invalid email or password."

                    End If

                End Using

            End Using

        Catch ex As Exception

            ' Display a general error message.
            lblMessage.Text = "Login failed. Please try again."

        End Try

        ' End of the Login button click event.
    End Sub

    ' End of the Login page class.
End Class
