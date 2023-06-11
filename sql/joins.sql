CREATE TABLE basket_a
(
    a       INT PRIMARY KEY,
    fruit_a VARCHAR(100) NOT NULL
);

CREATE TABLE basket_b
(
    b       INT PRIMARY KEY,
    fruit_b VARCHAR(100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES (1, 'Apple'),
       (2, 'Orange'),
       (3, 'Banana'),
       (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES (1, 'Orange'),
       (2, 'Apple'),
       (3, 'Watermelon'),
       (4, 'Pear');


-- inner default join
-- intersection
SELECT *
FROM basket_a
         JOIN basket_b ON basket_a.fruit_a = basket_b.fruit_b;

-- we can do this like :
SELECT fruit_b
FROM basket_b
INTERSECT
SELECT fruit_a
FROM basket_a;

-- допустим мы хотим достать все из корзины "а" и те фрукты и корзины "б" которые также есть и в корзине "а"
SELECT *
FROM basket_a
         LEFT OUTER JOIN basket_b ON basket_a.fruit_a = basket_b.fruit_b;


-- теперь хотим сделать тоже самое с корзиной "б"
SELECT *
FROM basket_a
         RIGHT OUTER JOIN basket_b ON basket_a.fruit_a = basket_b.fruit_b;


-- извлекаем все из двух корзин
-- но строки которые совпадают по условию - будут рядом, а места где нет совпадения будет с <null>
SELECT *
FROM basket_a
         FULL OUTER JOIN basket_b ON basket_a.fruit_a = basket_b.fruit_b;


-- когда нам нужно извлечь из корзины "а" только те фрукты которых нет в корзине "б"
SELECT *
FROM basket_a
         LEFT OUTER JOIN basket_b ON basket_a.fruit_a = basket_b.fruit_b
WHERE fruit_a NOT IN (SELECT fruit_b FROM basket_b);
-- or
SELECT *
FROM basket_a
         LEFT OUTER JOIN basket_b ON basket_a.fruit_a = basket_b.fruit_b
WHERE fruit_b IS NULL;


-- взять из двух корзин только уникальные значение которые не пересекаются

SELECT *
FROM basket_a
         FULL OUTER JOIN basket_b ON basket_b.fruit_b = basket_a.fruit_a
WHERE fruit_a NOT IN (SELECT fruit_b FROM basket_b)
   OR fruit_b NOT IN (SELECT fruit_a FROM basket_a);

SELECT *
FROM basket_a
         FULL OUTER JOIN basket_b ON basket_b.fruit_b = basket_a.fruit_a
WHERE fruit_a IS NULL
   OR fruit_b IS NULL;


--- practice ---

CREATE TABLE users
(
    id        serial PRIMARY KEY,
    name      varchar(64)  NOT NULL CHECK ( name != '' ),
    surname   varchar(64)  NOT NULL CHECK ( surname != '' ),
    email     varchar(300) NOT NULL UNIQUE,
    pass_hash text         NOT NULL
);

CREATE TABLE employees
(
    user_id     int REFERENCES users (id) PRIMARY KEY,
    salary      numeric(8, 2) NOT NULL CHECK ( salary > 0 ),
    department  varchar(64)   NOT NULL,
    hiring_date date          NOT NULL DEFAULT current_date
);

INSERT INTO users (name, surname, email, pass_hash)
VALUES ('Lara', 'Croft', 'lara1234@gmail.com', 'uyewgduq3gf67o#g4f8713f813*&4778rg9gf1f!'),
       ('Pippi', 'Longstocking', 'pippilong@gmail.com', 'erug7813478370jfiuql3bfio34yvcc'),
       ('Mary', 'Poppins', 'poppins89@gmail.com', 'rugf7o3r67o34cf7934c79v13479cv14f973cv'),
       ('Peter', 'Pan', 'peter.pan.cool_man@gmail.com', 'iuwehfiup4hiuprh3478prh7834'),
       ('Steven', 'Spielberg', 'spielberg@gmail.com', '5646845iuof783qo4go87gfui');

INSERT INTO employees (user_id, salary, department)
VALUES (2, 900, 'develop'),
       (4, 1200, 'HR'),
       (5, 5000, 'sales');

SELECT users.*, employees.*
FROM users
         LEFT JOIN employees ON employees.user_id = users.id;

SELECT users.*
FROM users
         LEFT JOIN employees ON employees.user_id = users.id
WHERE user_id IS NULL;

