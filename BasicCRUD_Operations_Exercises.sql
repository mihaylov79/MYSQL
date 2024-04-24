-- BASIC CRUD Operations Exercises

SELECT first_name, last_name, salary FROM employees
ORDER BY employee_id;

SELECT first_name, middle_name , last_name
FROM employees ORDER BY employee_id;

SELECT CONCAT(first_name,'.',last_name, '@softuni.bg')
AS full_email_address FROM employees;

SELECT DISTINCT salary FROM employees;

SELECT * FROM employees
WHERE job_title = 'Sales Representative' ORDER BY employee_id;

SELECT first_name , last_name, job_title FROM employees
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id;

SELECT CONCAT(employees.first_name, ' ', middle_name, ' ', last_name) AS 'Full Name'
FROM employees WHERE salary = 25000 OR salary = 14000 OR salary = 12500 OR salary = 23600;

SELECT employees.first_name, employees.last_name FROM employees
WHERE manager_id IS NULL;

SELECT employees.first_name, employees.last_name, employees.salary
FROM employees WHERE salary > 50000
ORDER BY employees.salary DESC ;

SELECT employees.first_name, employees.last_name FROM employees
ORDER BY salary DESC LIMIT 5;

SELECT employees.first_name, employees.last_name
FROM employees
WHERE department_id !=4;

SELECT * FROM employees
ORDER BY salary DESC,first_name,last_name DESC,middle_name;

CREATE VIEW v_employees_salaries AS
SELECT  first_name,last_name,salary
FROM employees;

CREATE VIEW v_employees_job_titles AS
SELECT CONCAT(first_name,' ', IF(middle_name is NOT NULL, CONCAT(middle_name, ' '), ''), last_name) AS full_name,job_title
FROM employees;

SELECT DISTINCT employees.job_title FROM employees
ORDER BY job_title;

SELECT * FROM projects
ORDER BY start_date, name
LIMIT 10;

SELECT employees.first_name,employees.last_name,employees.hire_date
FROM employees
ORDER BY hire_date DESC  LIMIT 7;


UPDATE employees
SET salary = salary * 1.12
WHERE department_id IN(1, 2, 4, 11);

SELECT employees.salary FROM employees;

USE geography;

SELECT peaks.peak_name FROM peaks
ORDER BY peak_name;

SELECT country_name, population
FROM countries
WHERE continent_code = 'EU'
ORDER BY population DESC ,countries.country_name
LIMIT 30;

SELECT country_name,country_code,IF(currency_code = 'EUR', 'Euro', 'Not Euro') AS 'currency'
FROM countries
ORDER BY country_name;

USE diablo;

SELECT characters.name FROM characters
ORDER BY name;



