CREATE TABLE contents (
                          id serial PRIMARY KEY ,
                          author_id int REFERENCES users(id),
                          name varchar(250),
                          description text NOT NULL CHECK ( description != '' ),
                          created_at timestamp DEFAULT now()
);

CREATE TABLE marks (
                       user_id int REFERENCES users(id),
                       content_id int REFERENCES contents(id),
                       is_liked boolean,
                       PRIMARY KEY (user_id, content_id)
);
