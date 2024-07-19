-- Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria. Quali considerazioni/ragionamenti è necessario che tu faccia? --> è una PK perchè non presenta righe NULL o duplicati
SELECT 
    COUNT(dimproduct.ProductKey),
    COUNT(*),
    COUNT(DISTINCT dimproduct.ProductKey)
FROM
    dimproduct;
-- Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK --> non può essere un PK in quanto contiene duplicati (numero di righe con valori distinti non nulli concatenati < numero righe totali tb)
SELECT 
    COUNT(*),
    COUNT(DISTINCT factresellersales.SalesOrderNumber),
    COUNT(DISTINCT CONCAT(factresellersales.SalesOrderLineNumber,
                '_',
                factresellersales.SalesOrderNumber)),
    COUNT(factresellersales.SalesOrderLineNumber),
    COUNT(factresellersales.SalesOrderNumber)
FROM
    factresellersales; 
-- Conta il numero transazioni (SalesOrderLineNumber) realizzate ogni giorno a partire dal 1 Gennaio 2020.
SELECT 
    factresellersales.OrderDate,
    COUNT(factresellersales.SalesOrderLineNumber)
FROM
    factresellersales
GROUP BY factresellersales.OrderDate
HAVING factresellersales.OrderDate > 2020 - 01 - 01;
-- Calcola il fatturato totale (FactResellerSales.SalesAmount), la quantità totale venduta (FactResellerSales.OrderQuantity) e il prezzo medio di vendita (FactResellerSales.UnitPrice) per prodotto (DimProduct) a partire dal 1 Gennaio 2020. Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, la quantità totale venduta e il prezzo medio di vendita. I campi in output devono essere parlanti!
SELECT 
    dimproduct.EnglishProductName AS 'product_name',
    SUM(factresellersales.SalesAmount) AS 'total_revenue',
    SUM(factresellersales.OrderQuantity) AS 'total_sales_quantity',
    AVG(factresellersales.UnitPrice) AS 'avg_sales_price'
FROM
    factresellersales
        INNER JOIN
    dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey
WHERE
    factresellersales.OrderDate > 2020 - 01 - 01
GROUP BY dimproduct.EnglishProductName;
-- Calcola il fatturato totale (FactResellerSales.SalesAmount) e la quantità totale venduta (FactResellerSales.OrderQuantity) per Categoria prodotto (DimProductCategory). Il result set deve esporre pertanto il nome della categoria prodotto, il fatturato totale e la quantità totale venduta. I campi in output devono essere parlanti!
SELECT 
    dimproductcategory.EnglishProductCategoryName AS 'category_name',
    SUM(factresellersales.SalesAmount) AS 'total_revenue',
    SUM(factresellersales.OrderQuantity) AS 'total_sales_quantity'
FROM
    factresellersales
        INNER JOIN
    dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey
        INNER JOIN
    dimproductsubcategory ON dimproductsubcategory.ProductSubcategoryKey = dimproduct.ProductSubcategoryKey
        INNER JOIN
    dimproductcategory ON dimproductcategory.ProductCategoryKey = dimproductsubcategory.ProductCategoryKey
GROUP BY dimproductcategory.EnglishProductCategoryName;
-- Calcola il fatturato totale per area città (DimGeography.City) realizzato a partire dal 1 Gennaio 2020. Il result set deve esporre l’elenco delle città con fatturato realizzato superiore a 60K.
SELECT 
    dimgeography.City AS 'city',
    SUM(factresellersales.SalesAmount) AS 'total_revenue'
FROM
    factresellersales
        INNER JOIN
    dimgeography ON factresellersales.SalesTerritoryKey = dimgeography.SalesTerritoryKey
WHERE
    factresellersales.OrderDate > 2020 - 01 - 01
GROUP BY dimgeography.City
HAVING SUM(factresellersales.SalesAmount) > 60000;



