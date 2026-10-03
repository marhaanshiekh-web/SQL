create database fin_database;
use permission;
create table Customers(
	customerID int primary key,
    CustomerName varchar(20),
    Email varchar(20)
);
    
    create table Transactions(
    TransactionID int primary key,
    CustomerID int,
    Amount decimal(10,2),
    TransactionDate date,
    foreign key (CustomerID) references Customers(CustomerID)
);

create table Salaries(
	EmployeID int primary key,
    EmployeeName varchar(20),
    Salary decimal (10,2)
);

create user "manager"@"localhost" identified by "Manager@123";

create user "accountant"@"localhost" identified by "accountant@123";

create user "clerk"@"localhost" identified by "Clerk@123";

grant select on permission.*
to "manager"@"localhost";

grant select, insert,update
on permission.Transactions
to "accountant"@"localhost";

grant select
on permission.Customers
to "accountant"@"localhost";

grant select
on permission.Customers
to "clerk"@"localhost";

grant delete
on permission.Transactions
to "accountant"@"localhost";

revoke delete
on permission.Transactions
from "accountant"@"localhost";

