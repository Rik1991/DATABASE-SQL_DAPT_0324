CREATE TABLE region (
    ID_region INT PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL
);

CREATE TABLE product (
    ID_product INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE sales (
    ID_sales INT PRIMARY KEY,
    ID_region INT,
    ID_product INT,
    order_date DATE,
    unit_price DECIMAL(10 , 2 ),
    order_quantity INT,
    sales_amount DECIMAL(10 , 2 ),
    FOREIGN KEY (ID_region)
        REFERENCES region (ID_region),
    FOREIGN KEY (ID_product)
        REFERENCES product (ID_product)
);

INSERT INTO region (ID_region, region_name) VALUES
(1, 'Italy'),
(2, 'Germany'),
(3, 'Spain'),
(4, 'France'),
(5, 'Swiss'),
(6, 'Russia'),
(7, 'U.S.A.'),
(8, 'Cina'),
(9, 'Canada'),
(10, 'Japan');

INSERT INTO product (ID_product, product_name, category_name) VALUES
(1, 'SuperDino', 'Giocattoli_azione'),
(2, 'RoboAmico', 'Giocattoli_interattivi'),
(3, 'AvventuradeiPirati', 'Giocattoli_azione'),
(4, 'MagicCastle', 'Giocattoli_creativi'),
(5, 'AutoTurbo', 'Giocattoli_azione'),
(6, 'CucciolidaCoccolare', 'Giocattoli_interattivi'),
(7, 'FattoriaFelice', 'Giocattoli_educativi'),
(8, 'PuzzleMagico', 'Giocattoli_educativi'),
(9, 'AstronaveSpaziale', 'Giocattoli_di_costruzione'),
(10, 'PrincipessaStella', 'Giocattoli_creativi');

INSERT INTO sales (ID_sales, ID_region, ID_product, order_date, unit_price, order_quantity, sales_amount) VALUES
(1, 3, 1, '2018-03-10', 20.00, 79, 1580.00),
(2, 1, 7, '2018-05-24', 25.00, 99, 2475.00),
(3, 4, 10, '2018-08-07', 30.00, 23, 690.00),
(4, 3, 10, '2018-10-21', 30.00, 75, 2250.00),
(5, 8, 5, '2019-01-04', 30.00, 13, 390.00),
(6, 10, 4, '2019-03-20', 35.00, 8, 280.00),
(7, 6, 4, '2019-06-03', 35.00, 54, 1890.00),
(8, 4, 10, '2019-08-17', 30.00, 72, 2160.00),
(9, 1, 10, '2019-10-31', 30.00, 93, 2790.00),
(10, 4, 4, '2020-01-14', 35.00, 37, 1295.00),
(11, 1, 6, '2020-03-29', 20.00, 22, 440.00),
(12, 5, 7, '2020-06-12', 25.00, 77, 1925.00),
(13, 9, 1, '2020-08-26', 20.00, 13, 260.00),
(14, 7, 2, '2020-11-09', 30.00, 6, 180.00),
(15, 6, 6, '2021-01-23', 20.00, 61, 1220.00),
(16, 10, 7, '2021-04-08', 25.00, 17, 425.00),
(17, 2, 7, '2021-06-22', 25.00, 53, 1325.00),
(18, 8, 4, '2021-09-05', 35.00, 86, 3010.00),
(19, 5, 4, '2021-11-19', 35.00, 35, 1225.00),
(20, 3, 3, '2022-02-02', 35.00, 60, 2100.00);

-- Verificare che i campi definiti come PK siano univoci. 
SELECT ID_sales, COUNT(*)
FROM sales
GROUP BY ID_sales
HAVING COUNT(*) > 1;

SELECT ID_product, COUNT(*)
FROM product
GROUP BY ID_product
HAVING COUNT(*) > 1;

SELECT ID_region, COUNT(*)
FROM region
GROUP BY ID_region
HAVING COUNT(*) > 1;
-- Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno
SELECT 
    p.product_name,
    YEAR(s.order_date) AS year,
    SUM(s.sales_amount) AS total_revenue
FROM
    sales s
        JOIN
    product p ON s.ID_product = p.ID_product
GROUP BY p.product_name , year
ORDER BY p.product_name , year;
-- Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente
SELECT 
    r.region_name,
    YEAR(s.order_date) AS year,
    SUM(s.sales_amount) AS total_revenue
FROM
    sales s
        JOIN
    region r ON s.ID_region = r.ID_region
GROUP BY r.region_name , year
ORDER BY year DESC , total_revenue DESC;
-- Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato? 
SELECT 
    p.category_name, SUM(s.order_quantity) AS total_order
FROM
    sales s
        JOIN
    product p ON s.ID_product = p.ID_product
GROUP BY p.category_name
ORDER BY total_order DESC
LIMIT 1;
-- Rispondere alla seguente domanda: quali sono, se ci sono, i prodotti invenduti? Proponi due approcci risolutivi differenti. 
SELECT 
    p.ID_product, p.product_name
FROM
    product p
        LEFT JOIN
    sales s ON p.ID_product = s.ID_product
WHERE
    s.ID_product IS NULL;

SELECT 
    p.ID_product, p.product_name
FROM
    product p
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            sales s
        WHERE
            s.ID_product = p.ID_product);
-- Esporre l’elenco dei prodotti con la rispettiva ultima data di vendita (la data di vendita più recente).
SELECT 
    p.ID_product,
    p.product_name,
    MAX(s.order_date) AS last_sale_date
FROM
    product p
        JOIN
    sales s ON p.ID_product = s.ID_product
GROUP BY p.ID_product , p.product_name;