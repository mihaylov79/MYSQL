-- JOINS AND SUBQUERIES EXCERCISES

-- 1 Employee Address

SELECT
	e.employee_id,
    e.job_title,
    a.address_id,
    a.address_text
FROM employees e
JOIN addresses a ON a.address_id = e.address_id
ORDER BY address_id LIMIT 5;

-- 2 Addresses with Towns

SELECT
	e.first_name,
    e.last_name,
    t.name AS town,
    a.address_text
FROM employees e
JOIN addresses a ON e.address_id = a.address_id
JOIN towns t ON a.town_id = t.town_id
ORDER BY e.first_name , e.last_name LIMIT 5;

-- 3 Sales Employee

SELECT
	e.employee_id,
    e.first_name,
    e.last_name,
    d.name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.name = 'Sales'
ORDER BY employee_id DESC;

-- 4 Employee Departments

SELECT
	e.employee_id,
    e.first_name,
    e.salary,
    d.name AS department_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE salary > 15000
ORDER BY d.department_id DESC LIMIT 5;

-- 5 Employees Without Project

SELECT
	e.employee_id,
    e.first_name
FROM employees e
LEFT JOIN employees_projects ep ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY employee_id DESC LIMIT 3;

-- 6 Employees Hired After

SELECT
	e.first_name,
    e.last_name,
    e.hire_date,
    d.name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.name IN('Sales', 'Finance') 
	  AND e.hire_date > '1999-01-01'
ORDER BY hire_date;

-- 7 Employees with Project

SELECT
	e.employee_id,
    e.first_name,
    p.name AS 'project_name'
FROM employees e
JOIN employees_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id
WHERE DATE(p.start_date) > '2002-08-13' AND p.end_date IS NULL
ORDER BY e.first_name, p.name
LIMIT 5;

-- 8 Employee 24

SELECT 
	e.employee_id,
    e.first_name,
    IF(YEAR(p.start_date) >= 2005, NULL, p.name) AS project_name
FROM employees e
JOIN employees_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY p.name;

-- -- 9  Employee Manager

SELECT 
	e.employee_id,
    e.first_name,
    e.manager_id,
    m.first_name AS manager_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id 
WHERE e.manager_id IN(3,7)
ORDER BY e.first_name; 

-- 10 Employee Summary

SELECT
	e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    d.name AS department_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
JOIN departments d ON e.department_id = d.department_id
WHERE e.manager_id IS NOT NULL
ORDER BY e.employee_id
LIMIT 5;

-- 11 Min Average Salary

SELECT 
	AVG(salary) AS min_average_salary
FROM employees e
GROUP BY department_id
ORDER BY min_average_salary
LIMIT 1;

-- 12 Highest Peaks in Bulgaria
USE geography;

SELECT 
	c.country_code,
    m.mountain_range,
    p.peak_name,
    p.elevation
FROM countries c
JOIN mountains_countries mc ON c.country_code = mc.country_code
JOIN mountains m ON mc.mountain_id = m.id
JOIN peaks p ON mc.mountain_id = p.mountain_id
WHERE c.country_code = 'BG' AND p.elevation > 2835
ORDER BY p.elevation DESC;


-- 13 Count Mountain Ranges

SELECT
	c.country_code,
    COUNT(m.mountain_range) as mountain_range
FROM countries c
JOIN mountains_countries mc ON c.country_code = mc.country_code
JOIN mountains m ON mc.mountain_id = m.id
GROUP BY country_code
HAVING c.country_code IN('BG','RU','US')
ORDER by mountain_range DESC;

-- вариант 2 

SELECT 
	mc.country_code,
    COUNT(*) AS mountain_range
FROM mountains_countries mc
WHERE mc.country_code IN('BG','RU','US')
GROUP BY mc.country_code
ORDER BY mountain_range DESC;

-- 14 Countries with Rivers

SELECT 
	c.country_name,
    r.river_name
FROM countries c
LEFT JOIN countries_rivers cr ON c.country_code = cr.country_code
LEFT JOIN rivers r ON cr.river_id = r.id
JOIN continents cnt ON c.continent_code = cnt.continent_code
WHERE cnt.continent_name = 'Africa'
ORDER BY c.country_name
LIMIT 5;

-- 15 Continents and Currencies 

SELECT 
	c.continent_code,
    c.currency_code,
    COUNT(*) AS currency_usage
FROM countries c
GROUP BY c.continent_code , c.currency_code
HAVING currency_usage > 1 AND currency_usage = 
	(SELECT 
		COUNT(*) AS max_usage 
	 FROM countries
     WHERE continent_code = c.continent_code
	 GROUP BY currency_code
	 ORDER BY max_usage DESC
	 LIMIT 1)
ORDER BY c.continent_code, c.currency_code;
    
  
  -- вложената заявка
-- SELECT 
--     currency_code, 
--     COUNT(*) AS max_usage 
-- FROM continents
-- GROUP BY currency_code
-- ORDER BY max_usage DESC
-- LIMIT 1


-- 16  Countries Without Any Mountains

SELECT COUNT(*) AS country_count FROM countries c
LEFT JOIN mountains_countries mc ON c.country_code = mc.country_code
WHERE mc.mountain_id IS NULL;

-- 17 Highest Peak and Longest River by Country

SELECT 
	c.country_name,
    MAX(p.elevation) AS highest_peak_elevation,
    MAX(r.length) AS longest_river_length
FROM countries c
LEFT JOIN mountains_countries mc 
	ON c.country_code = mc.country_code
LEFT JOIN mountains m 
	ON mc.mountain_id = m.id
LEFT JOIN peaks p
	ON m.id = p.mountain_id
LEFT JOIN countries_rivers cr
	ON c.country_code = cr.country_code
LEFT JOIN rivers r
	ON cr.river_id = r.id
GROUP BY c.country_name
ORDER BY highest_peak_elevation DESC , 
		longest_river_length DESC,
        c.country_name LIMIT 5;



