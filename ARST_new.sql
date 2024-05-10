CREATE DATABASE arst;
USE arst;

CREATE TABLE items (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  code INT UNIQUE NOT NULL ,
  name VARCHAR(255),
  thickness DECIMAL(4,2)
);

CREATE TABLE invoices (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  invoiceN INT UNIQUE,
  invoice_date DATE
);

CREATE TABLE deliveries (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  item_id INT NOT NULL ,
  quantity INT,
  single_price DECIMAL(6,2),
  orderN VARCHAR(20),
  AS_orderN VARCHAR(50),
  invoice_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (item_id) REFERENCES items(id)
);

INSERT INTO items(code, name, thickness) VALUE
(15103,'Детайли лазерно рязане 1.0',1.0),
(15105,'Детайли лазерно рязане 1.5',1.5),
(15106,'Детайли лазерно рязане 2.0',2.0),
(15107,'Детайли лазерно рязане 2.5',2.5),
(15108,'Детайли лазерно рязане 3.0',3.0),
(15109,'Детайли лазерно рязане 4.0',4.0),
(15110,'Детайли лазерно рязане 5.0',5.0),
(15111,'Детайли лазерно рязане 6.0',6.0),
(15112,'Детайли лазерно рязане 8.0',8.0),
(15113,'Детайли лазерно рязане 10.0',10.0);

USE arst;
INSERT INTO invoices(invoiceN, invoice_date) VALUE
(0000037101, '2024-05-08');

INSERT INTO  deliveries(item_id, quantity, single_price, orderN, AS_orderN, invoice_id) VALUE
(6,1,249.90,'ПК119',NULL,1),
(2,1,19,'ПК125','AS-00607',1),
(3,1,293.2,'ПК125','AS-00607',1),
(4,1,5.7,'ПК125','AS-00607',1),
(5,1,249.90,'ПК125','AS-00607',1),
(6,1,150.7,'ПК125','AS-00607',1),
(2,1,136.6,'ПК126','AS-00600',1),
(3,1,92.9,'ПК126','AS-00600',1),
(10,2.5,6.3,'ПК126','AS-00600',1),
(6,1,207.7,'ПК126','AS-00600',1),
(7,1,99.7,'ПК126','AS-00600',1),
(8,1,27,'ПК126','AS-00600',1);

CREATE VIEW sort AS
    SELECT i.code, i.name , d.quantity, d.single_price, d.orderN,d.AS_orderN,
           CONCAT(d.orderN, ' ', d.AS_orderN) AS PARTIDE
FROM deliveries d
JOIN invoices inv ON d.invoice_id = inv.id
JOIN items i ON d.item_id = i.id
ORDER BY thickness , orderN;


UPDATE deliveries 
SET single_price = 93.20 WHERE id = 15;

UPDATE deliveries
SET single_price = 331.6,
	orderN = 'ПК126',
	AS_orderN = 'AS-00600' 
WHERE id = 17;

UPDATE deliveries
SET item_id = 6 WHERE id = 16;

UPDATE deliveries
SET item_id = 7 WHERE id IN (13,18,22);

UPDATE deliveries
SET item_id = 8 WHERE id = 23;

UPDATE deliveries
SET item_id = 9 WHERE id = 24;

UPDATE deliveries
SET item_id = 4 WHERE id = 21;




