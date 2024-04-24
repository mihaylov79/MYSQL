-- BUILD IN FUNCTIONS LAB

USE book_library;

SELECT
REPLACE(title, 'The', '***')
FROM books
WHERE SUBSTR(title, 1,4) = 'The ';

SELECT length(title), character_length(title)
FROM books;

SELECT length('асд'), char_length('асд')
FROM books;

SELECT left('foobar', 5);

SELECT substring('Pesho',1,3) = LEFT('Pesho',3);

SELECT locate('bar','foobar');

SELECT LOWER('HELLO');
SELECT UPPER('hello');
USE book_library;
SELECT * FROM books
WHERE locate('the',title,2);

SELECT RAND(13,27);

SELECT FLOOR(RAND() *6);
SELECT FLOOR(RAND() *14) +13;

--// SELECT FLOOR(RAND() * (max = min)) + min;

SELECT ROUND(SUM(cost),2) FROM books;

SELECT * FROM authors;

SELECT title, EXTRACT(YEAR_MONTH FROM year_of_release) FROM books;

SELECT TIMESTAMPDIFF(DAY, '2024-01-01', '2024-01-16');

SELECT CONCAT(first_name,' ', last_name) AS 'Full name', 
TIMESTAMPDIFF(DAY,born,died) AS 'Days Lived' FROM authors;

SELECT dayofyear(NOW());
SELECT weekofyear(now()); 

SELECT
	title,
    date_format(year_of_release, '%Y-%M-%e')
FROM books;

SELECT * FROM books
WHERE title LIKE 'The%';

SELECT title FROM books
WHERE title LIKE 'Harry Potter%'
ORDER BY id;

 