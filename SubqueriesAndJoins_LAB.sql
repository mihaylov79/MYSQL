-- SUBQUERIES AND JOINS LAB

SELECT
employee_id ,
CONCAT(first_name, ' ', last_name) AS 'full_name',
departments.department_id,
name AS department_name
FROM departments
JOIN employees ON departments.manager_id = employees.employee_id
ORDER BY employee_id
LIMIT 5;


-- Примери за SUBQUERY
SELECT * FROM departments;

SELECT name AS department, CONCAT(first_name, ' ', last_name) AS full_name
FROM departments AS d
JOIN employees AS e ON  e.employee_id = d.manager_id
WHERE d.department_id IN (
SELECT department_id FROM departments
WHERE name = 'Sales' OR name = 'Marketing'
);

-- 4 Higher Salary 

SELECT COUNT(*) FROM employees
WHERE salary > (
	SELECT AVG (salary) FROM employees
    );

