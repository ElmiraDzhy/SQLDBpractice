CREATE TABLE coaches (
                         id serial PRIMARY KEY ,
                         name varchar(64) NOT NULL
);
--   team_id int REFERENCES teams(id)
ALTER TABLE coaches
    ADD COLUMN team_id int REFERENCES teams(id);

CREATE TABLE teams (
                       id serial PRIMARY KEY,
                       name varchar(64),
                       coach_id int REFERENCES coaches(id)
);


CREATE TABLE users_with_profile(
                                   id serial PRIMARY KEY ,
                                   name varchar(64),
                                   surname varchar(64)
);

ALTER TABLE users_with_profile
    ADD COLUMN profile_id int REFERENCES profiles(id);

CREATE TABLE profiles(
                         id serial PRIMARY KEY,
                         user_with_profile_id int REFERENCES users_with_profile(id)
);

ALTER TABLE profiles
    ADD COLUMN  user_with_profile_id int REFERENCES users_with_profile(id);

