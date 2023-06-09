-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  star_name text NOT NULL,
  galaxy TEXT NOT NULL
);
CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT NOT NULL REFERENCES stars ON DELETE CASCADE
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  planet_id INT NOT NULL REFERENCES planets ON DELETE CASCADE
);
INSERT INTO stars (star_name, galaxy)
VALUES
  ('The Sun', 'Milky Way'),
  ('Proxima Centauri', 'Milky Way'),
  ('Gliese 876', 'Milky Way');
INSERT INTO planets
  (name, orbital_period_in_years, orbits_around)
VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 1),
  ('Proxima Centauri b', 0.03, 2),
  ('Gliese 876 b', 0.23, 3);

  
INSERT INTO moons( moon_name,planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos',2),
  ('Deimos',2),
  ('Naiad',4),
  ('Thalassa',4),
  ('Despina',4),
  ('Galatea',4),
  ('Larissa',4),
  ('S/2004 N 1',4),
  ('Proteus',4),
  ('Triton',4),
  ('Nereid',4),
  ('Halimede',4),
  ('Sao',4),
  ('Laomedeia',4),
  ('Psamathe',4),
  ('Neso',4);
