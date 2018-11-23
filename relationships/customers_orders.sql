# https://www.udemy.com/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/v4/t/lecture/7030990?start=0
-- Creating the customers and orders tables

CREATE TABLE customers
(
  id         INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name  VARCHAR(100),
  email      VARCHAR(100)
);
CREATE TABLE orders
(
  id          INT AUTO_INCREMENT PRIMARY KEY,
  order_date  DATE,
  amount      DECIMAL(8,2),
  customer_id INT,
  FOREIGN KEY (customer_id)
    REFERENCES customers (id)
    ON DELETE CASCADE
);

-- Inserting some customers and orders
INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

-- This INSERT fails because of our foreign key constraint. No user with id: 98

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);
