SELECT *, char_length(concat(first_name, last_name)) AS "name"
FROM users
ORDER BY name DESC
LIMIT 1;

SELECT char_length(concat(first_name, last_name)) AS "name", count(*)
FROM users
GROUP BY name
HAVING char_length(concat(first_name, last_name)) > 5
ORDER BY name DESC;

CREATE TABLE a
(
    v char(3),
    t int
);

CREATE TABLE b
(
    v char(3)
);

INSERT INTO a
VALUES ('XXX', 1),
       ('XXY', 1),
       ('XXZ', 1),
       ('XYX', 2),
       ('XYY', 2),
       ('XYZ', 2),
       ('YXX', 3),
       ('YXY', 3),
       ('ZYX', 3);

INSERT INTO b
VALUES ('ZXX'),
       ('XXX'), --
       ('ZXZ'),
       ('YXZ'),
       ('YXY'), --
       ('XYZ'); --


SELECT *  FROM a, b;

SELECT v FROM a
UNION
SELECT v FROM b;

SELECT v FROM a
INTERSECT
SELECT v FROM b;

SELECT v FROM a
EXCEPT
SELECT * FROM b;

SELECT v FROM b
EXCEPT
SELECT v FROM a;