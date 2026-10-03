use arhan_database;
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Order_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Order_ID INT,
    Invoice_Date DATE,
    Invoice_Amount DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Invoice_ID INT,
    Payment_Date DATE,
    Payment_Amount DECIMAL(10,2),
    FOREIGN KEY (Invoice_ID) REFERENCES Invoices(Invoice_ID)
);

CREATE TABLE Ledger (
    Ledger_ID INT PRIMARY KEY,
    Customer_ID INT,
    Transaction_Date DATE,
    Debit DECIMAL(10,2),
    Credit DECIMAL(10,2),
    Description VARCHAR(100),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);
