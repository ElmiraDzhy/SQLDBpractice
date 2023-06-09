ALTER TABLE orders
    ADD COLUMN is_done bool;

-- CASE

SELECT id,
       email,
       (CASE
            WHEN weight IS NULL
                THEN 0
            ELSE weight
           END) AS user_weight
FROM users;

SELECT id,
       created_at,
       customer_id,
       (CASE
            WHEN is_done IS NULL
                THEN 'false'
            ELSE is_done
           END)
FROM orders;

UPDATE orders
SET is_done = true
WHERE id % 2 = 0;

UPDATE orders
SET is_done = false
WHERE id % 2 != 0;


SELECT *,
       (
           CASE extract(month from birthday)
               WHEN 1 THEN 'winter'
               WHEN 2 THEN 'winter'
               WHEN 3 THEN 'spring'
               WHEN 4 THEN 'spring'
               WHEN 5 THEN 'spring'
               WHEN 6 THEN 'summer'
               WHEN 7 THEN 'summer'
               WHEN 8 THEN 'summer'
               WHEN 9 THEN 'autumn'
               WHEN 10 THEN 'autumn'
               WHEN 11 THEN 'autumn'
               WHEN 12 THEN 'winter'
               END
           ) AS season
FROM users;


SELECT id,
       email,
       first_name,
       birthday,
       (CASE extract(years from age(birthday)) < 21
            WHEN true THEN false
            WHEN false THEN true
           END) AS adult
FROM users;

SELECT *,
       (CASE
            WHEN brand ILIKE 'Iphone'
                THEN 'Apple'
            ELSE 'other'
           END) as manufacturer
FROM products;

SELECT*,
      (CASE
           WHEN price < 7000 THEN 'budget'
           WHEN price > 14000 THEN 'flagman'
           WHEN price BETWEEN 7000 AND 14000 THEN 'middle class'
           ELSE 'unknown'
          END) AS "class"
FROM products;
SELECT*,
      (CASE
           WHEN price > (SELECT avg(price) FROM products) THEN 'expensive'
           ELSE 'low'
          END) AS "class"
FROM products;



SELECT users.*,
       count(o.id) AS "orders_quantity",
       (CASE
            WHEN count(o.id) > 3 THEN 'often'
            WHEN count(o.id) >= 1 THEN 'regular'
            WHEN count(o.id) = 0 THEN 'new'
           END)    AS "client_status"
FROM users
         LEFT JOIN orders o on users.id = o.customer_id
GROUP BY users.id
ORDER BY users.id;


----- COALESCE, NULLIF, GREATEST and LIST

SELECT COALESCE(NULL, 12, 24);

SELECT users.*, COALESCE(weight, NULL) AS "users_weight"
FROM users;

------

SELECT NULLIF(12, 13);

------

SELECT GREATEST(12, 13, 78, 67, 2, 3, 45);

------

SELECT LEAST(12, 13, 78, 67, 2, 3, 45);

-- get price -> if price < 2000 return 2000

SELECT id, brand, model, GREATEST(price, 2000) as price
FROM products;


-- ENUM

-- create data type (db level)
CREATE TYPE order_status AS ENUM ('new', 'processing', 'delivery', 'done');

ALTER TABLE orders
    RENAME COLUMN is_done TO status; -- rename column

ALTER TABLE orders
    ALTER COLUMN status TYPE order_status;
-- if into column status has not data, this command successfully change data type
-- but we already have data into this column


ALTER TABLE orders
    ALTER COLUMN status
        TYPE order_status USING (
        CASE status
            WHEN false THEN 'new'
            WHEN true THEN 'done'
            ELSE 'processing'
            END
        )::order_status;

-- if column status had default value- that we could not  cast it
-- we need to crash default and after this casting type and adding new default

UPDATE orders SET status = 'processing'
WHERE customer_id BETWEEN 700 and 800;

INSERT INTO orders (customer_id, status) VALUES (678, 'new');

--

ALTER TABLE orders  ALTER COLUMN status SET DEFAULT 'new';