DROP TABLE IF EXISTS hospital CASCADE;
DROP TABLE IF EXISTS doctor CASCADE;
DROP TABLE IF EXISTS patient CASCADE;
DROP TABLE IF EXISTS disease CASCADE;
DROP TABLE IF EXISTS doctor_visit CASCADE;
DROP TABLE IF EXISTS patient_diagnose CASCADE;


CREATE TABLE hospital(
    id SERIAL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE doctor (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  hospital_id INTEGER REFERENCES hospital ON DELETE SET NULL
);
CREATE TABLE patient(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE disease(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE doctor_visit(
    id SERIAL PRIMARY KEY,
    visit_date DATE,
    patient_id INT REFERENCES patient ON DELETE CASCADE,
    doctor_id INT REFERENCES doctor ON DELETE CASCADE
);
CREATE TABLE patient_diagnose(
    id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES doctor_visit ON DELETE CASCADE
);