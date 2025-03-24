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
