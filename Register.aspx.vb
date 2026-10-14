
' Import the System namespace for basic .NET functionality.
Imports System

' Import configuration settings from Web.config.
Imports System.Configuration

' Import classes for connecting to and working with SQL Server.
Imports System.Data.SqlClient

' Define the Register page class.
Public Class Register

    ' Inherit the ASP.NET Web Forms Page class.
    Inherits System.Web.UI.Page

    ' This event runs when the Register button is clicked.
    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click

        ' Get the full name from the TextBox and remove extra spaces.
        Dim fullName As String = txtFullName.Text.Trim()

        ' Get the email address and remove extra spaces.
        Dim email As String = txtEmail.Text.Trim()

        ' Get the password entered by the user.
        Dim password As String = txtPassword.Text

        ' Check whether any required field is empty.
        If fullName = "" OrElse email = "" OrElse password = "" Then

            ' Display an error message if a field is empty.
            lblMessage.Text = "Please fill in all fields."

            ' Stop executing the current procedure.
            Return
        End If

        ' Check whether the password contains fewer than 8 characters.
        If password.Length < 8 Then

            ' Display a message if the password is too short.
            lblMessage.Text = "Password must contain at least 8 characters."

            ' Stop executing the current procedure.
            Return
        End If

        ' Get the SQL Server connection string named InventoryDB from Web.config.
        Dim cs As String = ConfigurationManager.ConnectionStrings("InventoryDB").ConnectionString

        ' Start a Try block to handle possible errors.
        Try

            ' Create a SQL Server connection using the connection string.
            ' Using automatically disposes of the connection when finished.
            Using con As New SqlConnection(cs)

                ' SQL query to insert the user's information into the Users table.
                Dim query As String =
                    "INSERT INTO Users (FullName, Email, PasswordHash) " &
                    "VALUES (@FullName, @Email, @PasswordHash)"

                ' Create a SQL command using the query and database connection.
                Using cmd As New SqlCommand(query, con)

                    ' Pass the full name as a parameter.
                    cmd.Parameters.AddWithValue("@FullName", fullName)

                    ' Pass the email address as a parameter.
                    cmd.Parameters.AddWithValue("@Email", email)

                    ' Pass the password as a parameter.
                    cmd.Parameters.AddWithValue("@PasswordHash", password)

                    ' Open the connection to SQL Server.
                    con.Open()

                    ' Execute the INSERT query to save the user.
                    cmd.ExecuteNonQuery()

                    ' Dispose of the SQL command.
                End Using

                ' Dispose of the database connection.
            End Using

            ' Display a success message after registration.
            lblMessage.Text = "Registration successful!"

            ' Handle errors specifically related to SQL Server.
        Catch ex As SqlException

            ' Error 2627 or 2601 usually indicates a duplicate unique value.
            If ex.Number = 2627 OrElse ex.Number = 2601 Then

                ' Tell the user that the email is already registered.
                lblMessage.Text = "This email is already registered."

            Else

                ' Display a general database error for other SQL errors.
                lblMessage.Text = "Database error. Please try again."

            End If

            ' Handle any other unexpected errors.
        Catch ex As Exception

            ' Display a general registration failure message.
            lblMessage.Text = "Registration failed. Please check your configuration."

            ' Finish error handling.
        End Try

        ' End of the Register button click event.
    End Sub

    ' End of the Register page class.
End Class
