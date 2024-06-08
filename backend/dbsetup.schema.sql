-- Drop database if present 
DROP DATABASE IF EXISTS ecomm_db;

-- Create database
CREATE DATABASE ecomm_db;

-- Switch database 
USE ecomm_db;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Order_Chairs table
CREATE TABLE IF NOT EXISTS order_chairs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    chair_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- Order_Tables table
CREATE TABLE IF NOT EXISTS order_tables (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    table_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- Order_Tops table
CREATE TABLE IF NOT EXISTS order_tops (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    top_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- Products table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Insert products into the products table
INSERT INTO products (name, price, category) VALUES
('Lounge Chair', 2000, 'Chairs'),
('Dining Chair', 1800, 'Chairs'),
('Table1', 3000, 'Table'),
('Table2', 3200, 'Table'),
('Table3', 3100, 'Table'),
('Dining Top', 900, 'Top');
