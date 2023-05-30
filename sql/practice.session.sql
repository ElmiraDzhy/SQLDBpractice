DELETE
FROM users
WHERE id = 151;

-- name more then 5 letters
SELECT *
FROM users
WHERE char_length(first_name) > 15;

UPDATE users
SET first_name = upper(first_name)
WHERE id = 1;

SELECT *, concat(first_name, ' ', last_name) AS full_name
FROM users;

SELECT *, char_length(first_name) AS name_lenght
FROM users;

SELECT email AS post, first_name AS name, height
FROM users;

-- Task
SELECT id                                 AS "порядковий номер",
       concat(first_name, ' ', last_name) AS "повне ім'я",
       is_subscribe                       AS "підписка"
FROM users;

SELECT * FROM users AS u WHERE u.id = 1;








