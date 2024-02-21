DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosure;

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(225),
    employeeNumber INT
);

CREATE TABLE enclosure (
    id SERIAL PRIMARY KEY,
    name VARCHAR(225),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE assignment (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES staff(id),
    enclosure_id INT REFERENCES enclosure(id),
    day VARCHAR(225)
);

CREATE TABLE animal (
    id SERIAL PRIMARY KEY,
    enclosure_id INT REFERENCES enclosure(id),
    type VARCHAR(225),
    name VARCHAR(225),
    age INT
);

INSERT INTO staff (name, employeeNumber) VALUES
    ('Henry Thierry', 1),
    ('Harry Maguire', 2),
    ('Wayne Rooney', 3),
    ('Bukayo Saka', 4),
    ('Jude Bellingham', 5),
    ('Mikel Arteta', 6);

INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES
    ('Farm', 10, True),
    ('Tank', 5, False),
    ('Pond', 10, False),
    ('Hotel', 30, True),
    ('Garden', 20, False);

INSERT INTO assignment (employee_id, enclosure_id, day) VALUES
    (1, 3, 'Friday'),
    (4, 4, 'Monday'),
    (3, 5, 'Tuesday'),
    (3, 4, 'Wednesday'),
    (2, 1, 'Wednesday'),
    (1, 3, 'Thursday'),
    (4, 2, 'Monday');

INSERT INTO animal (name, type, age, enclosure_id) VALUES
    ('Molly', 'GoldFish', 6, 1),
    ('Japan', 'Cockroach', 4, 1),
    ('Henry', 'Horrid', 14, 5),
    ('Jamana', 'Octapus', 8, 2),
    ('Kapadi', 'Lion', 10, 3),
    ('Sampa', 'Dog', 6, 2),
    ('Lapol', 'Lizard', 4, 3);


    -- The names of the animals in a given enclosure
    SELECT * FROM animals WHERE animals.enclosures_id = 1

    -- The names of the staff working in a given enclosure (Garden)
SELECT s.name AS staff_name
FROM assignment a
JOIN staff s ON a.employee_id = s.id
WHERE a.enclosure_id = (SELECT id FROM enclosure WHERE name = 'Garden');