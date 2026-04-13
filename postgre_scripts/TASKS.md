### SQL Query Examples

**INNER JOIN:** Get a list of orders along with user names.
```postgresql
SELECT orders.id, users.name
FROM orders
INNER JOIN users ON orders.user_id = users.id;
```

**LEFT JOIN:** Get all users and orders, even if some users have no orders.
```postgresql
SELECT users.id, users.name, orders.id AS order_id
FROM users
LEFT JOIN orders ON users.id = orders.user_id;
```

**UNION:** Combine the list of all users and orders to show which IDs are used in both tables.
```postgresql
SELECT id FROM users
UNION
SELECT user_id AS id FROM orders;
```

**Correlated subquery:** Get users who have at least one order.
```postgresql
SELECT name
FROM users
WHERE EXISTS (SELECT 1 FROM orders WHERE orders.user_id = users.id);
```

**GROUP BY:** A query that counts the number of orders for each user.
```postgresql
SELECT users.id, users.name, COUNT(orders.id) AS order_count
FROM users
LEFT JOIN orders ON users.id = orders.user_id
GROUP BY users.id, users.name;
```

### Adding new entities
```postgresql
INSERT INTO products (name)
VALUES ('New Product 1'),
       ('New Product 2'),
       ('New Product 3');
```

### Updating entities
```postgresql
UPDATE products
SET name = 'Updated Product Name'
WHERE id = 1;
```
