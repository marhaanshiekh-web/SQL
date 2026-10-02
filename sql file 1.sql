create database fin_db;
use fin_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO customers (customer_id, customer_name, email, city)
VALUES
(101, 'Rahul', 'rahul@gmail.com', 'Mangalore'),
(102, 'Priya', 'priya@gmail.com', 'Bangalore'),
(103, 'Anu', 'anu@gmail.com', 'Kochi'),
(104, 'Arjun', 'arjun@gmail.com', 'Mysore'),
(105, 'Sneha', 'sneha@gmail.com', 'Chennai');

SELECT * FROM customers;

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO transactions 
(transaction_id, customer_id, amount, transaction_date)
VALUES
(1, 101, 5000, '2026-08-01'),
(2, 102, 2500, '2026-08-02'),
(3, 101, 7000, '2026-08-05'),
(4, 103, 1500, '2026-08-06'),
(5, 104, 9000, '2026-08-07'),
(6, 102, 4000, '2026-08-10'),
(7, 103, 2000, '2026-08-11'),
(8, 104, 6000, '2026-08-12'),
(9, 105, 3000, '2026-08-13'),
(10, 105, 2500, '2026-08-14'),
(11, 101, 5000, '2026-08-15'),
(12, 102, 2500, '2026-08-02');

SELECT * FROM transactions;


CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_amount DECIMAL(10,2),
    invoice_date DATE,
    due_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO invoices
(invoice_id, customer_id, invoice_amount, invoice_date, due_date, payment_status)
VALUES
(501, 101, 5000, '2026-08-01', '2026-08-10', 'Unpaid'),
(502, 102, 3000, '2026-08-05', '2026-08-15', 'Paid'),
(503, 103, 7000, '2026-08-10', '2026-08-20', 'Unpaid'),
(504, 104, 4000, '2026-08-12', '2026-08-25', 'Paid'),
(505, 105, 6000, '2026-08-15', '2026-08-28', 'Unpaid');

SELECT * FROM invoices;

select * from invoices where payment_status="Unpaid";

select * from transactions where amount>"4500";

select max(amount) as highest_transaction from transactions;

select avg(amount) as average_transaction from transactions;

with invoices_sumary as(
select customer_id,SUM(invoices_amount) As total_amount
from invoices group by customer_id)
select * from invoices_summary;
