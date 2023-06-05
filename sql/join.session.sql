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


-- maxprice-order
SELECT *, (products.price * products_to_orders.quantity) AS "maxprice"
FROM products_to_orders
         JOIN products ON products_to_orders.product_id = products.id
ORDER BY maxprice DESC
LIMIT 1;



SELECT product_id, p.model
FROM products_to_orders AS pto
         JOIN products AS p on pto.product_id = p.id
GROUP BY product_id, p.model;

SELECT count(pto.order_id), p.id
FROM products_to_orders AS pto
         RIGHT JOIN products AS p
              ON p.id = pto.product_id
GROUP BY p.id
ORDER BY p.id ;