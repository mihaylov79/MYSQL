CREATE DATABASE ARST;
USE ARST;
CREATE TABLE ARTICLES (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(125) NOT NULL,
b DECIMAL(4,2),
quantity INT,
singele_price DECIMAL(8,2),
orderN VARCHAR(10),
invoice INT,
invoice_date DATE
);

INSERT INTO ARTICLES(name, b, quantity, singele_price, orderN, invoice, invoice_date) VALUES
('НЕРЪЖДАЕМ ДЕТАЙЛ',5, 1, 249.9,'ПК119',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',1.5,1,19,'ПК125',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',2,1,93.2,'ПК125',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',3,1,278.7,'ПК125',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',4,1,5.7,'ПК125',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',5,1,150.7,'ПК125',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',1.5,1,136.6,'ПК126',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',2,1,92.9,'ПК126',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',2.5,1,6.3,'ПК126',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',3,1,331.6,'ПК126',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',5,1,207.7,'ПК126',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',6,1,99.7,'ПК126',0000037101,'2024-05-08'),
('НЕРЪЖДАЕМ ДЕТАЙЛ',8,1,27,'ПК126',0000037101,'2024-05-08');

ALTER TABLE articles
ADD COLUMN AS_order_N VARCHAR(20);

UPDATE articles
SET AS_order_N = 'AS-00607'
WHERE id IN(7,8,9,10,11,12,13);


CREATE VIEW invoice_order AS
SELECT
	name, b, singele_price,orderN, CONCAT(orderN,' ',AS_order_N) AS PARTIDE 
FROM ARTICLES
ORDER BY b;

