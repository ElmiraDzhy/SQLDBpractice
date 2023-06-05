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

