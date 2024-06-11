### Примеры SQL-запросов:
INNER JOIN: Получить список заказов вместе с именами пользователей.
```postgresql
SELECT orders.id, users.name
FROM orders
INNER JOIN users ON orders.user_id = users.id;
```
###
LEFT JOIN: Получить все пользователи и заказы, даже если у некоторых пользователей нет заказов.
```postgresql
SELECT users.id, users.name, orders.id AS order_id
FROM users
LEFT JOIN orders ON users.id = orders.user_id;
```
###
UNION: Объединить список всех пользователей и заказов, чтобы показать, какие ID используются в обоих таблицах.
```postgresql
SELECT id FROM users
UNION
SELECT user_id AS id FROM orders;
```
###
Коррелированный подзапрос: Получить пользователей, у которых есть хотя бы один заказ.
```postgresql
SELECT name
FROM users
WHERE EXISTS (SELECT 1 FROM orders WHERE orders.user_id = users.id);
```
###
Пример запроса с GROUP BY: Запрос, который подсчитывает количество заказов для каждого пользователя:
```postgresql
SELECT users.id, users.name, COUNT(orders.id) AS order_count
FROM users
LEFT JOIN orders ON users.id = orders.user_id
GROUP BY users.id, users.name;

```
#

Добавление новых сущностей
```postgresql
INSERT INTO products (name)
VALUES ('New Product 1'),
       ('New Product 2'),
       ('New Product 3');
```

Обновление сущностей
```postgresql
UPDATE products
SET name = 'Updated Product Name'
WHERE id = 1;

```