
-- 2. One-To-Many Relationship 

CREATE TABLE manufacturers(
manufacturer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) UNIQUE,
established_on DATE
);

INSERT INTO manufacturers(name, established_on) VALUES 
('BMW', '1916-03-01'),
('Tesla', '2003-01-01'),
('Lada', '1966-05-01');

CREATE TABLE models(
model_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) ,
manufacturer_id INT,
CONSTRAINT fk_models_manufacturer_id_manucturers_manufacturer_id
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturers(manufacturer_id)
);

INSERT INTO models VALUES 
(101, 'X1' , 1),
(102, 'i6' , 1),
(103,'Model S' , 2),
(104, 'Model X' , 2),
(105, 'Model 3' , 2),
(106, 'Nova' , 3);

SELECT models.name AS model, manufacturers.name AS manufacturer
FROM models
JOIN manufacturers ON manufacturers.manufacturer_id = models.manufacturer_id;

-- 3. Many-To-Many Relationship
USE relations;

CREATE TABLE students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

INSERT INTO students(name) VALUES
('Mila'),
('Toni'),
('Ron');

CREATE TABLE exams(
exam_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

INSERT INTO exams VALUES
(101, 'Spring MVC'),
(102, 'Neo4j'),
(103, 'Oracle 11g');

CREATE TABLE students_exams(
student_id INT,
exam_id INT,
CONSTRAINT pk_students_exams
PRIMARY KEY(student_id,exam_id),
CONSTRAINT fk_students_student_id_students_exams_student_id
FOREIGN KEY (student_id) REFERENCES students(student_id),
CONSTRAINT fk_exams_exam_id_students_exams_exam_id
FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

INSERT INTO students_exams VALUES
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103);