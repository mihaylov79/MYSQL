
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

-- 4. Self-Referencing

CREATE TABLE teachers(
teacher_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO teachers VALUES
(101, 'John', null),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101);

-- 5. Online Store Database 

CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(50)
);

CREATE TABLE customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(50),
    birthday DATE,
    city_id INT,

    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE item_types(
    item_type_id INT AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(50)
);

CREATE TABLE items(
    item_id INT AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(50),
    item_type_id INT,

    FOREIGN KEY (item_type_id) REFERENCES item_types(item_type_id)
);

CREATE TABLE order_items(
    order_id INT,
    item_id INT,

    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)

);

-- 6. University Database

CREATE TABLE majors(
    major_id INT AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(50)
);

CREATE TABLE students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(12),
    student_name VARCHAR(50),
    major_id INT,

    FOREIGN KEY (major_id) REFERENCES majors(major_id)
);

CREATE TABLE payments(
    payment_id INT AUTO_INCREMENT PRIMARY KEY ,
    payment_date DATE,
    payment_amount DECIMAL(8,2),
    student_id INT,

    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE subjects(
    subject_id INT AUTO_INCREMENT PRIMARY KEY ,
    subject_name VARCHAR(50)
);

CREATE TABLE agenda(
    student_id INT,
    subject_id INT,

    PRIMARY KEY (student_id,subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- 9. Peaks in Rila

SELECT 
    mountain_range, 
    peaks.peak_name , 
    peaks.elevation AS peak_elevation
FROM mountains
JOIN peaks 
	ON mountain_id = peaks.mountain_id
WHERE mountains.mountain_range = 'Rila' 
AND peaks.mountain_id = 17
ORDER BY elevation DESC;

-- ver.2 (better One)

SELECT 
	mountain_range , 
	peak_name, 
	elevation AS peaks_elevation
FROM peaks p
JOIN mountains m 
	ON p.mountain_id = m.id
WHERE m.mountain_range = 'Rila'
ORDER BY elevation DESC;
