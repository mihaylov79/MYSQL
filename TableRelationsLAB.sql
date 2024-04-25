-- TABLE RELATIONS LAB
CREATE DATABASE relations;
USE relations;

-- 01 Mountains and Peaks 

CREATE TABLE mountains (
id INT AUTO_INCREMENT  NOT NULL  PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

CREATE TABLE peaks(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
mountain_id INT NOT NULL,
CONSTRAINT fk_peaks_mountain_id_mountains_id
FOREIGN KEY (mountain_id)
REFERENCES mountains(id)
ON DELETE CASCADE
);

INSERT INTO mountains(name) VALUES ("Pirin"),("Rila");
INSERT INTO peaks(name, mountain_id) VALUES ("Musala", 2);
INSERT INTO peaks(name, mountain_id) VALUES ("Musala2", 2);
INSERT INTO peaks(name, mountain_id) VALUES ("Vihren", 1);

-- ПРИМЕР JOIN

SELECT * FROM mountains;
SELECT * FROM peaks;

SELECT * FROM peaks
JOIN mountains ON peaks.mountain_id = mountains.id;

SELECT peaks.id, 
peaks.name AS 'Peak Name' , 
mountains.name AS 'Mountain Name'
FROM peaks
JOIN mountains ON peaks.mountain_id = mountains.id;

-- 02 Trip Organization

SELECT 
vehicles.driver_id AS driver_id, 
vehicles.vehicle_type,
CONCAT( campers.first_name, ' ', campers.last_name) AS driver_name 
FROM vehicles
JOIN campers ON campers.id = vehicles.driver_id;

-- 03 SoftUni Hiking

SELECT 
starting_point AS 'route_starting_point' , 
end_point AS 'route_ending_point', 
leader_id,
CONCAT(campers.first_name, ' ', campers.last_name) AS leader_name
FROM routes
JOIN campers ON campers.id = routes.leader_id;

-- CASCADE Примери
USE relations;
DELETE FROM mountains WHERE id = 1; -- неможе да бъде изтрито защото е свързано с върховете (FOREIGN KEY)

ALTER TABLE peaks DROP CONSTRAINT fk_peaks_mountain_id_mountains_id;
ALTER TABLE peaks ADD CONSTRAINT fk_peaks_mountain_id_mountains_id FOREIGN KEY (mountain_id)
REFERENCES mountains(id) ON DELETE CASCADE ;

DELETE FROM mountains WHERE id = 1;

SELECT * FROM mountains;
SELECT * FROM peaks;

DELETE FROM peaks WHERE id = 3;

-- 04 Delete Mountains 

CREATE TABLE mountains (
id INT AUTO_INCREMENT  NOT NULL  PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

CREATE TABLE peaks(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
mountain_id INT NOT NULL,
CONSTRAINT fk_peaks_mountain_id_mountains_id
FOREIGN KEY (mountain_id)
REFERENCES mountains(id)
ON DELETE CASCADE
);