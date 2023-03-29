DROP TABLE IF EXISTS region CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS posts CASCADE;


CREATE TABLE region(
    id serial PRIMARY key,
    name text not null
);
CREATE TABLE category(
    id serial PRIMARY key,
    name text not null
);
CREATE TABLE users(
    id serial PRIMARY key,
    user_name text UNIQUE not null,
    password text not null,
    preferred_region INTEGER REFERENCES region ON DELETE SET NULL
);
CREATE TABLE posts(
    id serial PRIMARY key,
    author INTEGER REFERENCES users,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    region_id INTEGER NOT NULL REFERENCES region ON DELETE CASCADE,
    category_id INTEGER REFERENCES category
);

