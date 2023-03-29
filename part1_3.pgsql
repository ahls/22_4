DROP TABLE IF EXISTS leagues CASCADE;
DROP TABLE IF EXISTS teams CASCADE;
DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS refrees CASCADE;
DROP TABLE IF EXISTS matches CASCADE;
DROP TABLE IF EXISTS seasons CASCADE;


CREATE TABLE leagues(
    id serial PRIMARY key,
    name text not null
);
CREATE TABLE teams(
    id serial PRIMARY key,
    name text not null,
    league_id INTEGER REFERENCES leagues
);
CREATE TABLE players(
    id serial PRIMARY key,
    name text UNIQUE not null,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);
CREATE TABLE refrees(
    id serial PRIMARY key,
    name text UNIQUE not null
);
CREATE TABLE matches(
    id serial PRIMARY key,
    play_date DATE not null,

    score1 INTEGER NOT NULL,
    score2 INTEGER NOT NULL,
    team1 INTEGER NOT NULL REFERENCES region ON DELETE CASCADE,
    team2 INTEGER NOT NULL REFERENCES region ON DELETE CASCADE,
    refree_id INTEGER REFERENCES refrees
);
CREATE TABLE seasons(
    id serial PRIMARY key,
    start_date date not null,
    end_date DATE,
    league_id INTEGER REFERENCES leagues    
);

