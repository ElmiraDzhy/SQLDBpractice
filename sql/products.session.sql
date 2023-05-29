-- products
CREATE TABLE products (
                          id serial PRIMARY KEY,
                          name varchar(300),
                          category varchar(300),
                          price decimal(16, 2) CHECK ( price > 0 ),
                          quantity int CHECK ( quantity >= 0 ),
                          UNIQUE (name, quantity)
);

-- users
CREATE TABLE users (
                       first_name varchar(64) NOT NULL ,
                       last_name varchar(64) NOT NULL ,
                       email varchar(500),
                       birthday date CHECK ( birthday > '1900-01-01' ),
                       is_subscribe  boolean NOT NULL

);
ALTER TABLE users
    ADD COLUMN id serial PRIMARY KEY ;

-- orders
CREATE TABLE orders (
                        id serial PRIMARY KEY,
                        created_at timestamp NOT NULL DEFAULT now(),
                        customer_id int REFERENCES users(id)
);

--
INSERT INTO users (first_name, last_name, email, birthday, is_subscribe)
VALUES ('Mikki', 'Mouse', 'mikki@mouse.com', '1980-02-01', true),
       ('Rapuntzel', 'Longhair', 'hair@cur.com', '1990-2-03', false),
       ('Cinderella', 'Gold', 'shoe@cn.com', '1940-02-1', true),
       ('Bell', 'Beasted', 'rose@flow.com', '1994-2-01', false);

INSERT INTO products (name, category, price, quantity)
VALUES ('Samsung', 'phones', 100, 20),
       ('Sony', 'phones', 150, 40),
       ('Apple', 'phones', 500, 50),
       ('Nokia', 'phones', 50, 70),
       ('Alcatel', 'phones', 60, 25),
       ('Motorolla', 'phones', 80, 100);

-- many to many connection table
CREATE TABLE products_to_orders (
                                    product_id int REFERENCES products(id),
                                    order_id int REFERENCES orders(id),
                                    quantity int NOT NULL DEFAULT 1,
                                    PRIMARY KEY (product_id, order_id)
);

--
INSERT INTO orders (customer_id)
VALUES (1), (1), (2), (4), (4), (4);

INSERT INTO products_to_orders (order_id, product_id, quantity)
VALUES (1,1,2),
       (1,2,3),
       (2,1,5),
       (3,3,1),
       (4,1,1),
       (4,2,1),
       (5,2,1);

