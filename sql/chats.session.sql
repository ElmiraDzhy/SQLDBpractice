CREATE TABLE chats (
   id serial PRIMARY KEY ,
   name varchar(300) NOT NULL CHECK ( name != '' ),
   owner_id int REFERENCES users (id),
   created_at timestamp NOT NULL DEFAULT now()
);

CREATE TABLE users_to_chats (
    user_id int REFERENCES users(id),
    chat_id int REFERENCES chats(id),
    join_at timestamp DEFAULT now(),
    PRIMARY KEY (user_id, chat_id)
);

CREATE TABLE messages (
  id serial PRIMARY KEY ,
  body text NOT NULL CHECK ( body != '' ),
  created_at timestamp DEFAULT current_timestamp,
  author_id int,
  chat_id int,
  FOREIGN KEY (author_id, chat_id) REFERENCES users_to_chats (user_id, chat_id)
);

--

INSERT INTO chats (name, owner_id)
VALUES ('firstchat', 1),
       ('secondchat', 2),
       ('superchat', 2);

INSERT INTO users_to_chats (user_id, chat_id)
VALUES (2, 1),
       (3, 1),
       (2, 2),
       (4, 2);

INSERT INTO messages (body, author_id, chat_id)
VALUES ('hi', 2, 1),
       ('hello', 3, 1),
       ('go to coffee', 2, 2),
       ('how are you', 4, 2);