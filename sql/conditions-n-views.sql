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

SELECT id, created_at, customer_id,
       (CASE
            WHEN is_done IS NULL
                THEN 'false'
            ELSE is_done
           END)
FROM orders;