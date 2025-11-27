CREATE DATABASE IF NOT EXISTS goit_rdb_hw_02;
USE goit_rdb_hw_02;

-- 1. Таблиця клієнтів
CREATE TABLE clients (
    client_id   INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    address     VARCHAR(200) NOT NULL
);

-- 2. Таблиця замовлень
CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    order_date  DATE NOT NULL,
    client_id   INT NOT NULL,
    CONSTRAINT fk_orders_clients
        FOREIGN KEY (client_id)
        REFERENCES clients(client_id)
);

-- 3. Таблиця товарів
CREATE TABLE products (
    product_id   INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
);

-- 4. Таблиця позицій замовлень
CREATE TABLE order_items (
    order_id   INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL,
    PRIMARY KEY(order_id, product_id),
    CONSTRAINT fk_order_items_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_order_items_products
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
