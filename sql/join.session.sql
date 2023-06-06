SELECT products.brand,
       products.model,
       products_to_orders.quantity,
       sum(products.price * products_to_orders.quantity)
FROM orders
         JOIN products_to_orders ON orders.id = products_to_orders.order_id
         JOIN products ON products.id = products_to_orders.product_id
WHERE orders.id = 15378
GROUP BY products.brand, products.model, products_to_orders.quantity;

SELECT products.brand,
       products.model,
       products_to_orders.quantity,
       sum(products.price * products_to_orders.quantity)
FROM orders
         JOIN products_to_orders ON orders.id = products_to_orders.order_id
         JOIN products ON products.id = products_to_orders.product_id
WHERE orders.id = 15378
GROUP BY products.brand, products.model, products_to_orders.quantity;

SELECT count(*), brand
FROM products
GROUP BY brand;


SELECT users.first_name
FROM users
         JOIN orders o ON users.id = o.customer_id;

---------------JOIN-------------------
---intersection

SELECT *
FROM a
         JOIN b ON b.v = a.v;

---

SELECT *
FROM users
         JOIN orders o ON users.id = o.customer_id
WHERE users.id = 752;

---

SELECT *
FROM chats AS c
         JOIN messages m on c.id = m.chat_id
WHERE c.id = 1;


---

SELECT *
FROM users
         JOIN chats c on users.id = c.owner_id;

SELECT *
FROM chats
         JOIN users on users.id = chats.owner_id;

---

SELECT *
FROM users
         JOIN chats c on users.id = c.owner_id
         JOIN messages m on c.id = m.chat_id;


SELECT u.id         AS user_id,
       u.first_name AS name,
       c.id         AS chat_id
FROM messages AS m
         JOIN chats AS c ON m.chat_id = c.id
         JOIN users u on u.id = m.author_id
WHERE c.id = 1;

-- все номера заказов, в которых были самсунги

SELECT pto.order_id
FROM products
         JOIN products_to_orders AS pto ON products.id = pto.product_id
WHERE brand = 'Samsung';

-- группировка по моделям

SELECT count(*), products.model
FROM products
         JOIN products_to_orders AS pto ON products.id = pto.product_id
WHERE brand = 'Samsung'
GROUP BY products.model;

--
SELECT count(*), brand
FROM products
         JOIN products_to_orders AS pto ON products.id = pto.product_id
GROUP BY brand;
---

--- top 3 brand

SELECT count(*) AS sales, brand
FROM products
         JOIN products_to_orders AS pto ON products.id = pto.product_id
GROUP BY brand
ORDER BY sales DESC
LIMIT 3;

--- top 5 models

SELECT count(*) AS sales, model
FROM products
         JOIN products_to_orders AS pto ON products.id = pto.product_id
GROUP BY model
ORDER BY sales DESC
LIMIT 5;



SELECT product_id, p.model
FROM products_to_orders AS pto
         JOIN products AS p on pto.product_id = p.id
GROUP BY product_id, p.model;

SELECT count(pto.order_id), p.id
FROM products_to_orders AS pto
         RIGHT JOIN products AS p
                    ON p.id = pto.product_id
GROUP BY p.id
ORDER BY p.id;



/*

1. Извлечь самый дорогой заказ
2. Извлечь топ покупателя (который больше всех потратил суммарно)
3. Извлечь среднюю стоимость заказа
4. Извлечь количество моделей конкретной марки
5. Извлечь все позиции конкретного заказа
6. Извлечь покупателя, который совершил больше всех заказов
7. Извлечь все заказы и отсортировать по убыванию стоимости
8. TOP 10 самых дорогих телефонов
9. Пользователей и количество их заказов, отсортировать по кол-ву заказов
10. TOP 10 самых популярных моделей
*/


-- 1
SELECT products_to_orders.order_id, sum(products.price * products_to_orders.quantity) AS "maxprice"
FROM products_to_orders
         JOIN products ON products_to_orders.product_id = products.id
GROUP BY products_to_orders.order_id
ORDER BY maxprice DESC
LIMIT 1;

-- 2

SELECT u.id, u.first_name, sum(pto.quantity * p.price) AS "summa"
FROM users AS u
         JOIN orders AS o ON o.customer_id = u.id
         JOIN products_to_orders AS pto ON o.id = pto.order_id
         JOIN products AS p ON pto.product_id = p.id
GROUP BY u.id
ORDER BY summa DESC
LIMIT 1;

-- 3
SELECT avg(p.price * pto.quantity)
FROM orders AS o
         JOIN products_to_orders pto on o.id = pto.order_id
         JOIN products p on p.id = pto.product_id;

--4

SELECT count(model)
FROM products
WHERE brand = 'Samsung';

-- 5

SELECT *
FROM orders
         JOIN products_to_orders pto on orders.id = pto.order_id
         JOIN products p on p.id = pto.product_id
WHERE pto.order_id = 15378;

-- 6
SELECT users.id, users.first_name, count(o.customer_id) AS "quantityOfOrders"
FROM users
         JOIN orders o on users.id = o.customer_id
GROUP BY users.id
ORDER BY "quantityOfOrders" DESC
LIMIT 1;

-- 7
SELECT orders.id, (p.price * pto.quantity) AS "summa"
FROM orders
         JOIN products_to_orders pto on orders.id = pto.order_id
         JOIN products p on p.id = pto.product_id
GROUP BY orders.id, summa
ORDER BY summa;

-- 8
SELECT price, model, brand
FROM products
ORDER BY price DESC
LIMIT 10;

-- 9
SELECT u.id, u.first_name, count(o.customer_id) AS "ordersQuantity"
FROM orders AS o
         JOIN users AS u ON u.id = o.customer_id
GROUP BY u.id
ORDER BY "ordersQuantity";

-- 10

SELECT model, count(model) AS "modelQuantity"
FROM products
         JOIN products_to_orders AS pto ON products.id = pto.product_id
GROUP BY model
ORDER BY "modelQuantity" DESC
LIMIT 10;


---------------------------------------------------------------------------------
/*
products that no one bought
*/
SELECT p.id, p.model, p.brand, pto.order_id
FROM products AS p
         LEFT JOIN products_to_orders pto on p.id = pto.product_id
WHERE order_id IS NULL;


-- all users that made order

SELECT users.id, users.first_name, users.email
FROM users
         JOIN orders o on users.id = o.customer_id
GROUP BY users.id;

SELECT DISTINCT users.id, users.first_name, users.email
FROM users
         JOIN orders o on users.id = o.customer_id;

--  all users that not made order

SELECT users.id, users.first_name, users.email
FROM users
         LEFT JOIN orders o on users.id = o.customer_id
WHERE o.customer_id IS NULL
GROUP BY users.id;


--- practice
---email all users making order with product id = 7
SELECT users.email, users.first_name
FROM users
         JOIN orders o on users.id = o.customer_id
         JOIN products_to_orders pto on o.id = pto.order_id
WHERE product_id = 7;


SELECT users.email, users.first_name, o.customer_id, p.model, o.id, p.model
FROM users
         JOIN orders o on users.id = o.customer_id
         JOIN products_to_orders pto on o.id = pto.order_id
         JOIN products p on p.id = pto.product_id
WHERE p.brand = 'Samsung';

-- task #3

SELECT users.id, users.email, users.first_name, count(o.id) AS "Order quantity"
FROM users
         JOIN orders o on users.id = o.customer_id
GROUP BY users.id;

--- practice
--1
SELECT sum(pto.quantity * p.price), pto.order_id
FROM products_to_orders AS pto
         JOIN products AS p ON pto.product_id = p.id
GROUP BY pto.order_id;

--2
--order: 16027
SELECT p.model, p.id
FROM products AS p
         JOIN products_to_orders AS pto ON p.id = pto.product_id
WHERE pto.order_id = 16027;

--3
--order: 15430

SELECT count(*) AS "Positions"
FROM products_to_orders
WHERE order_id = 15430;

-- 4
SELECT u.id, u.first_name, u.email, sum(pto.quantity)
FROM users AS u
         JOIN orders o on u.id = o.customer_id
         JOIN products_to_orders pto on o.id = pto.order_id
GROUP BY u.id;

--5
SELECT products.model, sum(pto.quantity) AS "popular"
FROM products
         JOIN products_to_orders pto on products.id = pto.product_id
GROUP BY products.model
ORDER BY "popular" DESC
LIMIT 1;











