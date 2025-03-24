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