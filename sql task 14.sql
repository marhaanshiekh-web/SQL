create database finance_database;


-- 2. Create Table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20)
);


-- 3. Insert Data
INSERT INTO transactions
VALUES
(1, 101, '2026-01-01', 5000, 'UPI'),
(2, 102, '2026-01-02', 3000, 'Card'),
(3, 101, '2026-01-03', 7000, 'UPI'),
(4, 103, '2026-01-04', 60000, 'Bank'),
(5, 104, '2026-01-05', 2500, 'UPI'),
(6, 101, '2026-01-06', 5000, 'UPI'),
(7, 101, '2026-01-06', 5000, 'UPI'),
(8, NULL, '2026-01-07', 4000, 'Card'),
(9, 105, '2026-01-08', NULL, 'UPI'),
(10, 106, NULL, 3500, 'Card'),
(11, 107, '2026-01-09', -500, 'UPI'),
(12, 108, '2026-01-10', 80000, 'Bank');

select * from transaction;

create index idx_customer
on transaction (customer_id);

show index from transaction ;

explain
select * from transaction
where customer_id=101;

 select * from transaction 
 where customer_id=105
 
select * from transaction
where payment_method="Bank";

select * from transaction 
where amount>5000;

select * from transaction 
where amount<5000;

select
customer_id
transaction_date,
amount,
count(*) as duplicate_count
from transaction
group by customer_id,transaction_data,amount
having count(*)>1;

select * from transaction
where customer_id is null
or transaction_date is null
or amount is null;


