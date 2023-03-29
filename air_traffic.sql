-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic
CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country INT NOT NULL REFERENCES countries ON DELETE CASCADE
);
CREATE TABLE flights(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INT NOT NULL REFERENCES airlines ON DELETE CASCADE,
  from_city INT NOT NULL REFERENCES cities ON DELETE CASCADE,
  to_city INT NOT NULL REFERENCES cities ON DELETE CASCADE
);
CREATE TABLE travelers(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);
CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  ticker_owner INT NOT NULL REFERENCES travelers ON DELETE CASCADE,
  seat TEXT NOT NULL,
  flight INT NOT NULL REFERENCES flights ON DELETE CASCADE
);
INSERT INTO airlines(name)
VALUES
  ('United'),('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

INSERT INTO travelers(first_name,last_name)
VALUES 
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO countries(name)
VALUES
  ('United States'),--1
  ('Japan'),--2
  ('France'),--3
  ('China'),--4
  ('Chile'),--5
  ('Mexico'),--6
  ('United Kingdom'),--7
  ('Morocco'),--8
  ('UAE'),--9
  ('Brazil');--10

INSERT INTO cities(name, country)
VALUES
  ('Washington DC',1),--1
  ('Tokyo',2),--2
  ('Las Vegas',1),  --3
  ('London',7),     --4
  ('Los Angeles',1),--5
  ('Seattle',1),    --6
  ('Mexico City',6),--7
  ('Paris',3),      --8
  ('Casablanca',8), --9
  ('Dubai',9),      --10
  ('Beijing',4),    --11
  ('New York',1),   --12
  ('Cedar Rapids',1),--13
  ('Chicago',1),    --14
  ('Charlotte',1),  --15
  ('New Orleans',1),--16
  ('Sao Paolo',10), --17
  ('Santiago',5);    --18

INSERT INTO flights(departure,arrival,airline,from_city,to_city)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1,6),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2,2,4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 3),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 6, 7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 8),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 15),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 13, 14),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 15, 16),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 18);
  


INSERT INTO tickets
  (ticker_owner, seat,flight)
VALUES
  (1, '33B', 1),
  (2, '8A', 2),
  (3, '12F', 3),
  (1, '20A', 4),
  (4, '23D', 5),
  (2, '18C', 6),
  (5, '9E', 7),
  (6, '1A', 8),
  (5, '32B', 9),
  (7, '10D', 10);