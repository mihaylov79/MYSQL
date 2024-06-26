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

-- 2 ------------------
SELECT * FROM addresses;

------- вариант 1

SELECT a.town_id, t.name, a.address_text
FROM addresses AS a
JOIN towns AS t ON a.town_id = t.town_id
WHERE t.name IN( 'San Francisco', 'Sofia', 'Carnation')
ORDER BY a.town_id, a.address_id;

---- вариант 2

SELECT a.town_id, t.name, a.address_text
FROM addresses AS a
JOIN towns AS t ON a.town_id = t.town_id
AND t.name IN( 'San Francisco', 'Sofia', 'Carnation')
ORDER BY a.town_id, a.address_id;

-- 3 Employees Without Managers
SELECT employee_id, 
		first_name, 
        last_name ,
         department_id,
	 salary 
FROM employees
WHERE manager_id IS NULL;

-- JOIN в една и съща таблица пример
SELECT 
e.employee_id,
e.first_name,
e.last_name,
e.manager_id,
m.employee_id,
m.first_name,
m.last_name
FROM employees e
JOIN employees AS m ON e.manager_id = m.employee_id;

-- JOIN на две или повече таблици примери
SELECT
e.employee_id,
e.first_name,
e.last_name,
ep.project_id,
p.name
FROM employees AS e
JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
JOIN projects AS p ON ep.project_id = p.project_id
ORDER BY e.employee_id;

