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
