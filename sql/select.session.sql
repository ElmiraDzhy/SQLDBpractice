SELECT price AS p
FROM products
WHERE price <= 1000;

SELECT price AS p
FROM products
WHERE brand = 'Nokia';

SELECT model AS p
FROM products
WHERE brand = 'Samsung';

-- quantity all of phones
SELECT sum(quantity)
FROM products;

-- quantity of all models
SELECT count(*)
FROM products;

-- middle price
SELECT avg(price)
FROM products;

-- min price
SELECT min(price)
FROM products;

-- max price
SELECT max(price)
FROM products;

--
SELECT sum(quantity)
FROM products
WHERE price BETWEEN 10000 AND 20000;


SELECT avg(price)
FROM products
WHERE brand = 'Iphone';

--
-- LESSON --
--

-- al columns:
SELECT *
FROM users;

-- only emails:
SELECT email
FROM users;

-- several columns
SELECT email, id
FROM users;

--
-- Filtration:
--

SELECT *
FROM orders
WHERE customer_id = 1;

SELECT *
FROM users
WHERE gender = 'male';

SELECT email
FROM users
WHERE gender = 'male';

-- Task #1:

SELECT *
FROM users
WHERE id % 2 = 0;

SELECT *
FROM users
WHERE is_subscribe = true;

SELECT email
FROM users
WHERE gender = 'female';

--
-- Operators
--

SELECT *
FROM users
WHERE first_name IN ('Kate', 'Potter');

SELECT *
FROM users
WHERE id IN (3, 4, 5);

SELECT *
FROM users
WHERE id = 3
   OR id = 4
   OR id = 5;

-- all users id between 100 and 200

SELECT *
FROM users
WHERE id BETWEEN 100 AND 200;

SELECT *
FROM users
WHERE id >= 100
  AND id <= 200;

-- Tasks #2
SELECT *
FROM users
WHERE id BETWEEN 200 AND 250
  AND gender = 'male';


















