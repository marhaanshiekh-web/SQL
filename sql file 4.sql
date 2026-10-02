CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    OrderAmount DECIMAL(10,2)
);
INSERT INTO Customers VALUES
(1, 'Akhil', 'Kochi'),
(2, 'Rahul', 'Bangalore'),
(3, 'Meera', 'Chennai'),
(4, 'Anu', 'Mangalore'),
(5, 'Vishnu', 'Delhi'),
(6, 'Neha', 'Mumbai');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 50000),
(102, 2, 'Mobile', 30000),
(103, 3, 'Tablet', 25000),
(104, 7, 'Printer', 15000),
(105, 8, 'Monitor', 20000);