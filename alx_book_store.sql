-- Create database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(10, 2),
    published_year INT
);

-- Create customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create order_details table
CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert sample data into books table
INSERT INTO books (title, author, genre, price, published_year) VALUES
('Python for Beginners', 'John Smith', 'Programming', 25.99, 2021),
('Learning SQL', 'Jane Doe', 'Database', 30.50, 2020),
('AI Fundamentals', 'Andrew Ng', 'Technology', 45.00, 2022);

-- Insert sample data into customers table
INSERT INTO customers (name, email, phone_number) VALUES
('Alice Johnson', 'alice@example.com', '08012345678'),
('Bob Williams', 'bob@example.com', '08087654321');

-- Insert sample order
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2025-10-20', 76.49);

-- Insert order details
INSERT INTO order_details (order_id, book_id, quantity, subtotal) VALUES
(1, 1, 1, 25.99),
(1, 2, 1, 30.50),
(1, 3, 1, 45.00);
