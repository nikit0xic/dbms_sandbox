CREATE TABLE users
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE customers
(
    user_id      INT PRIMARY KEY,
    surname      VARCHAR(50) NOT NULL,
    middle_name  VARCHAR(50),
    phone_number VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE products
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE orders
(
    id          SERIAL PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE product_orders
(
    order_id   INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);
