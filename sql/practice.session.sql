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

SELECT *
FROM users AS u
WHERE u.id = 1;


------------- date functions

SELECT extract(months from age(birthday))
FROM users;
SELECT extract(years from birthday)
FROM users;

SELECT *
FROM users
WHERE gender = 'female'
  AND first_name LIKE 'A%';

SELECT *
FROM users
WHERE gender = 'male'
  AND extract(years from age(birthday)) >= 18;


SELECT *
FROM users
WHERE extract(month from birthday) = 9;

-----------------------------

SELECT *
FROM users
WHERE extract(years from age(birthday)) BETWEEN 20 AND 40;

UPDATE users
SET is_subscribe = true
WHERE extract(month from birthday) = 1;

UPDATE users
SET height = 1.67
WHERE extract(years from age(birthday)) > 60;

UPDATE users
SET weight = 90
WHERE height > 2;

-------------------------------
SELECT *
FROM users
LIMIT 15 OFFSET 0;

SELECT *
FROM users
LIMIT 15 OFFSET 15;

SELECT *
FROM users
LIMIT 15 OFFSET 45;

SELECT *
FROM users
LIMIT 15 OFFSET 60;



