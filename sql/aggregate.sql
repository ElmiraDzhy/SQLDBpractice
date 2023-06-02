-- Unit: 84
-- Aggregate functions

-- Task: sum of weight all of users
SELECT sum(weight) AS "all weight"
FROM users;

-- min height
SELECT min(height) AS "all weight"
FROM users;

-- avg
SELECT avg(weight)
FROM users;

-- amount of users
SELECT count(*)
FROM users
WHERE age(birthday) < make_interval(18);

--average weight of man and woman
SELECT avg(weight)
FROM users
WHERE gender = 'male';

SELECT avg(weight)
FROM users
WHERE gender = 'female';

SELECT avg(weight), gender
FROM users
GROUP BY gender;

--- all users average weight that born after 2000 y

SELECT avg(weight)
FROM users
WHERE extract(year from birthday) > 2000;

-- all man than more 25 y.o - height ava=erage

SELECT avg(height), gender
FROM users
WHERE extract(years from age(birthday)) > 25
GROUP BY gender;

-- practice

SELECT avg(height), gender
FROM users
GROUP BY gender;

SELECT min(height), gender
FROM users
GROUP BY gender;

SELECT max(height), gender
FROM users
GROUP BY gender;

SELECT count(*)
FROM users
WHERE extract(year from birthday) > 1998;

SELECT count(*)
FROM users
WHERE first_name LIKE 'J%';

SELECT count(*)
FROM users
WHERE extract(years from age(birthday)) BETWEEN 20 AND 30;
--
-- phones count that was
SELECT sum(quantity)
FROM products_to_orders;
--
-- practice #2

SELECT sum(quantity)
FROM products;

SELECT avg(price)
FROM products;

SELECT avg(price), brand
FROM products
GROUP BY brand;

SELECT count(model) AS "models", brand
FROM products
GROUP BY brand;

SELECT avg(price)
FROM products
WHERE brand = 'Nokia';

SELECT count(*), customer_id
FROM orders
GROUP BY customer_id;



