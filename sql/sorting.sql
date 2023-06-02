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