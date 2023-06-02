SELECT min(quantity) AS "rest", brand
FROM products
GROUP BY brand
ORDER BY rest
LIMIT 3;

--

SELECT id, height, first_name, last_name
FROM users
ORDER BY height DESC, id;

--

SELECT id, first_name, last_name
FROM users
ORDER BY id;

SELECT id, first_name, extract(year from birthday) AS "yearFromBrt"
FROM users
ORDER BY first_name, "yearFromBrt";

SELECT extract(year from birthday)
FROM users;


SELECT price, brand
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT first_name, last_name, birthday, extract(years from age(birthday)) AS "Y.O"
FROM users
ORDER BY age(birthday), first_name;

--

SELECT extract(years from age(birthday)) AS age, count(*)
FROM users
GROUP BY age;

SELECT count(*), age
FROM (SELECT extract(years from age(birthday)) AS age, * FROM users) AS u_w_a
GROUP BY u_w_a.age
ORDER BY u_w_a.age;

-- get all users with max order quantity

SELECT count(*) AS "c", customer_id
FROM orders
GROUP BY customer_id
HAVING count(*) > 2
ORDER BY c;

---

SELECT sum(quantity), brand
FROM products
GROUP BY brand
HAVING sum(quantity) > 1000;