
USE InventoryManagementDB;
GO

-- Table for user registration and login
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
GO

-- Table for products and stock
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductCode NVARCHAR(50) NOT NULL UNIQUE,
    ProductName NVARCHAR(150) NOT NULL,
    Price DECIMAL(18,2) NOT NULL CHECK (Price >= 0),
    StockQuantity INT NOT NULL DEFAULT 0
        CHECK (StockQuantity >= 0),
    MinimumStock INT NOT NULL DEFAULT 5
        CHECK (MinimumStock >= 0),
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
GO

-- Table for purchases and sales
CREATE TABLE InventoryTransactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    TransactionType NVARCHAR(10) NOT NULL
        CHECK (TransactionType IN ('Purchase', 'Sale')),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(18,2) NOT NULL CHECK (UnitPrice >= 0),
    TransactionDate DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    UserID INT NOT NULL,
    CONSTRAINT FK_Transactions_Products
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    CONSTRAINT FK_Transactions_Users
        FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO
