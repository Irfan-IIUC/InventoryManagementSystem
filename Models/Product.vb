
Public Class Product

    Public Property ProductCode As String
    Public Property ProductName As String
    Public Property Price As Decimal

    Private _stockQuantity As Integer

    Public Property StockQuantity As Integer
        Get
            Return _stockQuantity
        End Get
        Set(value As Integer)
            If value < 0 Then
                Throw New ArgumentException("Stock quantity cannot be negative.")
            End If

            _stockQuantity = value
        End Set
    End Property

    Public ReadOnly Property TotalInventoryValue As Decimal
        Get
            Return Price * StockQuantity
        End Get
    End Property

End Class
