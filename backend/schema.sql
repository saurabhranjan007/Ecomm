-- create the database if not present 
CREATE DATABASE IF NOT EXISTS ecomm_db;

-- switch to the created database 
USE ecomm_db;

-- users table 
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- order_chairs table  
CREATE TABLE IF NOT EXISTS order_chairs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    chair_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- order_tablestable
CREATE TABLE IF NOT EXISTS order_tables (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    table_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- order_tops table
CREATE TABLE IF NOT EXISTS order_tops (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    top_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
