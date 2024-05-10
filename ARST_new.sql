CREATE DATABASE arst;
USE arst;

CREATE TABLE items (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  code INT UNIQUE NOT NULL ,
  name VARCHAR(255),
  thickness DECIMAL(4,2),
    FOREIGN KEY (id) REFERENCES deliveries(item_id)
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
(15102,'Детайли лазерно рязане 1.0',1.0),
(15103,'Детайли лазерно рязане 1.5',1.5),
(15104,'Детайли лазерно рязане 2.0',2.0),
(15111,'Детайли лазерно рязане 2.5',1.0),
(15105,'Детайли лазерно рязане 3.0',3.0),
(15106,'Детайли лазерно рязане 4.0',4.0),
(15107,'Детайли лазерно рязане 5.0',5.0),
(15108,'Детайли лазерно рязане 6.0',6.0),
(15109,'Детайли лазерно рязане 8.0',8.0),
(15110,'Детайли лазерно рязане 10.0',10.0);


INSERT INTO invoices(invoiceN, invoice_data) VALUE
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
    SELECT i.name , d.quantity, d.single_price, d.orderN,d.AS_orderN,
           CONCAT(d.orderN, ' ', d.AS_orderN) AS PARTIDE
FROM deliveries d
JOIN invoices inv ON d.invoice_id = inv.id
JOIN items i ON d.item_id = i.id
ORDER BY thickness , orderN;

SELECT items.code, items.name, thickness, quantity, single_price, orderN, AS_orderN,
           CONCAT(orderN, ' ', AS_orderN) AS PARTIDE
FROM deliveries
JOIN invoices  ON invoices.id = deliveries.invoice_id
JOIN items ON items.id = deliveries.invoice_id
ORDER BY thickness , orderN;

# ALTER TABLE deliveries ADD FOREIGN KEY (invoice_id) REFERENCES invoices(id);
# ALTER TABLE deliveries ADD FOREIGN KEY (item_id) REFERENCES items(id);













































































































































































































































































































































































































































