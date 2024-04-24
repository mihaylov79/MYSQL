-- BASIC CRUD OPEATIONS LAB

SELECT id, first_name, last_name, job_title 
FROM employees
ORDER BY id;

SELECT 
id AS 'No.', 
first_name AS 'First Name', 
last_name AS 'Last Name', 
job_title AS 'Job Title'
FROM employees
ORDER BY id;

SELECT CONCAT('#', id, '->', first_name, last_name, job_title) AS 'Full Name'
FROM employees;

select *
from clients, rooms;

SELECT
	CONCAT_WS(' ', first_name , last_name)
    FROM employees;
    
SELECT
id,
CONCAT(first_name, ' ',last_name) AS full_name ,
job_title,
salary
FROM employees
WHERE salary >1000
ORDER BY id;

SELECT DISTINCT first_name
from employees;

SELECT *
FROM employees
WHERE department_id = 4 AND salary >= 1000
ORDER BY id DESC;

CREATE VIEW v_employee_summary AS
    SELECT 
        id,
        CONCAT(first_name, ' ', last_name) AS 'Full Name',
        job_title AS 'Job Title',
        salary AS 'Salary'
    FROM
        employees
    WHERE
        salary > 1000
    ORDER BY first_name , last_name;

SELECT * FROM v_employee_summary;
USE hotel;
SELECT job_title , salary FROM employees;
USE hotel;
UPDATE employees
SET salary = salary + 100
WHERE job_title = 'Manager';
SELECT salary 
FROM employees;

USE hotel;
CREATE view v_top_paid_emplyee AS
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1;
SELECT * FROM v_top_paid_emplyee;

SELECT * FROM employees
WHERE department_id = 4 AND salary >= 1000
ORDER BY id;

DELETE FROM employees
WHERE department_id = 1 OR department_id = 2;

SELECT * FROM employees
ORDER BY id;

