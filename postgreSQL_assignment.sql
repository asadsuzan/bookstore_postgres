-- 📂 Database Setup

-- 1. Create a new database named "bookstore_db" or any appropriate name.
CREATE DATABASE bookstore_db;

-- 2. Connect to the newly created database.
\c bookstore_db;

-- 1️⃣ Create a "books" table with the following fields:

-- id (Primary Key): A unique identifier for each book.
-- title: The name of the book.
-- author: The author of the book.
-- price: The price of the book (must be non-negative, enforced via CHECK constraint).
-- stock: The number of available copies in stock.
-- published_year: The year the book was published.

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL CHECK (price >= 0),
    stock INT CHECK (stock >= 0),
    published_year INT
);

-- 2️⃣ Create a "customers" table with the following fields:

-- id (Primary Key): A unique identifier for each customer.
-- name: The full name of the customer.
-- email: The email address of the customer (must be unique).
-- joined_date: The date the customer registered (default to the current date).

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

-- 3️⃣ Create an "orders" table with the following fields:

-- id (Primary Key): A unique identifier for each order.
-- customer_id (Foreign Key): References the id field in the "customers" table.
-- book_id (Foreign Key): References the id field in the "books" table.
-- quantity: The number of books ordered (must be greater than zero).
-- order_date: The date and time when the order was placed (default to the current timestamp).

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) NOT NULL,
    book_id INT REFERENCES books(id) NOT NULL,
    quantity INT CHECK (quantity > 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 📂 sample data insertion
-- 1️⃣ Insert sample data into the "books" table.
INSERT INTO books (id, title, author, price, stock, published_year) VALUES
(1, 'The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
(2, 'Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
(3, 'You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
(4, 'Refactoring', 'Martin Fowler', 50.00, 3, 1999),
(5, 'Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

-- 2️⃣ Insert sample data into the "customers" table.
INSERT INTO customers (id, name, email, joined_date) VALUES
(1, 'Alice', 'alice@email.com', '2023-01-10'),
(2, 'Bob', 'bob@email.com', '2022-05-15'),
(3, 'Charlie', 'charlie@email.com', '2023-06-20');

-- 3️⃣ Insert sample data into the "orders" table.
INSERT INTO orders (id, customer_id, book_id, quantity, order_date) VALUES
(1, 1, 2, 1, '2024-03-10'),
(2, 2, 1, 1, '2024-02-20'),
(3, 1, 3, 2, '2024-03-05');




-- 📂 PostgreSQL Problems
-- 1️⃣ Find books that are out of stock.
SELECT * FROM books WHERE stock = 0;
-- 2️⃣ Retrieve the most expensive book in the store.

SELECT * FROM books ORDER BY price DESC LIMIT 1;

-- 3️⃣ Find the total number of orders placed by each customer.
SELECT c.name, COUNT(o.id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.name;


-- 4️⃣ Calculate the total revenue generated from book sales.
SELECT SUM(b.price * o.quantity) AS total_revenue
FROM books b
JOIN orders o ON b.id = o.book_id;

-- 5️⃣ List all customers who have placed more than one order.
SELECT c.name, COUNT(o.id) AS total_orders
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.id) > 1;

-- 6️⃣ Find the average price of books in the store.
SELECT AVG(price) AS average_price
FROM books;

-- 7️⃣ Increase the price of all books published before 2000 by 10%.

UPDATE books
SET price = price * 1.10
WHERE published_year < 2000;
-- 8️⃣ Delete customers who haven't placed any orders.

DELETE FROM customers
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);
