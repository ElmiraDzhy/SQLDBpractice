-- 2NF

-- NOT IN 2NF
--      ||
--      \/
DROP TABLE employees;

CREATE TABLE employees
(
    id             serial PRIMARY KEY,
    name           varchar(300),
    position       varchar(300),
    car_aviability bool
);

INSERT INTO employees (name, position, car_aviability)
VALUES ('John', 'HR', false),
       ('Jane', 'Sales', false),
       ('Jake', 'Developer', false),
       ('Andrew', 'Driver', true);

--
-- DO IT RIGHT:
--

CREATE TABLE employees
(
    id       serial PRIMARY KEY,
    name     varchar(300),
    position varchar(300) REFERENCES positions (name)
);

CREATE TABLE positions
(
    name           varchar(300) PRIMARY KEY,
    car_aviability bool
);

INSERT INTO positions (name, car_aviability)
VALUES ('HR', false),
       ('Sales', false),
       ('Developer', false),
       ('Driver', true);

INSERT INTO employees (name, position)
VALUES ('John', 'HR'),
       ('Jane', 'Sales'),
       ('Jake', 'Developer'),
       ('Andrew', 'Driver');

SELECT *
FROM employees
         JOIN positions ON employees.position = positions.name;

-- 3NF

-- NOT IN 3NF
--      ||
--      \/

CREATE TABLE employees
(
    id               serial PRIMARY KEY,
    name             varchar(64),
    department       varchar(64),
    phone_department int
);
INSERT INTO employees (name, department, phone_department)
VALUES ('John Doe', 'HR', 66515),
       ('Jane Smith', 'Sales', 66515),
       ('Andrew', 'HR', 2232);

/*
department -> id
phone_department -> department

transitive dependency ----- NOT IN 3NF ------ phone_department -> id
*/

--
-- DO IT RIGHT:
--

CREATE TABLE departments
(
    name  varchar(64) PRIMARY KEY,
    phone int
);

CREATE TABLE employees
(
    id         serial PRIMARY KEY,
    name       varchar(64),
    department varchar(64) REFERENCES departments (name)
);

INSERT INTO employees (name, department)
VALUES ('John Doe', 'HR'),
       ('Jane Smith', 'Sales'),
       ('Andrew', 'HR');