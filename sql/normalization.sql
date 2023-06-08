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

-- BCNF

-- NOT IN BCNF
--      ||
--      \/

/*
Example:
teachers, students, subjects

Students can go to subjects
One teacher can only teach one subjects
Students can do into more than one subjects

teachers n:1 subjects
students m:n subjects
students m:n teachers
*/
CREATE TABLE students
(
    id   serial PRIMARY KEY,
    name varchar(64)
);

CREATE TABLE teachers
(
    id   serial PRIMARY KEY,
    name varchar(64)
);

CREATE TABLE students_to_teachers_to_subjects
(
    teacher_id int REFERENCES teachers (id),
    student_id int REFERENCES students (id),
    subject    varchar(300),
    PRIMARY KEY (teacher_id, student_id)
);

INSERT INTO students_to_teachers_to_subjects
VALUES (1, 1, 'biology'),
       (1, 2, 'biology'),
       (2, 1, 'math'),
       (2, 2, 'biology');
----- <---- this is a problem

--
-- DO IT RIGHT:
--

CREATE TABLE students
(
    id   serial PRIMARY KEY,
    name varchar(64)
);

CREATE TABLE teachers
(
    id      serial PRIMARY KEY,
    name    varchar(64),
    subject varchar(64) REFERENCES subjects (name)
);

CREATE TABLE subjects
(
    name varchar(64) PRIMARY KEY
);

CREATE TABLE students_to_teachers
(
    teacher_id int REFERENCES teachers (id),
    student_id int REFERENCES students (id),
    PRIMARY KEY (teacher_id, student_id)
);

INSERT INTO students_to_teachers
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 2);

/*
Single source of truth
Need to store primary facts in tables that we cannot know from other facts
*/

-- 4NF

-- NOT IN 4NF
--      ||
--      \/

/*
EXAMPLE

restaurants
pizzas
deliveries

В сети много ресторанов в разных частях города
Рестораны обращаются к тем службам доставки кооторые
работают в тех самых районах где и ресторан
Службы доставки могут работать в нескольких районах одновременно

*/

CREATE TABLE restaurants
(
    id serial PRIMARY KEY
);

CREATE TABLE deliveries
(
    id serial PRIMARY KEY
);

CREATE TABLE restaurants_to_deliveries
(
    restaurant_id int REFERENCES restaurants (id),
    delivery_id   int REFERENCES deliveries (id),
    pizza_type    varchar(300) NOT NULL,
    PRIMARY KEY (restaurant_id, delivery_id)
);

INSERT INTO restaurants_to_deliveries
VALUES (1, 1, 'pepperoni'),
       (1, 1, 'sea'),
       (1, 1, '4chease'),
       (1, 1, 'hawaii'),
       (1, 2, 'pepperoni'),
       (1, 2, 'sea'),
       (1, 2, 'hawaii'),
       (2, 1, 'pepperoni'),
       (2, 1, 'sea'),
       (2, 1, 'special'),
       (2, 3, 'pepperoni'),
       (2, 3, 'special');
-----<----- something wrong here

--
-- DO IT RIGHT:
--

CREATE TABLE pizzas
(
    name varchar(300) PRIMARY KEY
);

CREATE TABLE restaurants_to_pizzas
(
    restaurant_id int REFERENCES restaurants,
    pizza_type    varchar(300) REFERENCES pizzas (name),
    PRIMARY KEY (restaurant_id, pizza_type)
);

CREATE TABLE restaurants_to_deliveries
(
    restaurant_id int REFERENCES restaurants (id),
    delivery_id   int REFERENCES deliveries (id),
    PRIMARY KEY (restaurant_id, delivery_id)
);