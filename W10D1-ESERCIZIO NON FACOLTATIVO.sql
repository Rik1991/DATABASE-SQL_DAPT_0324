SELECT * FROM AdventureWorksDW.dimproduct;
SELECT 
    ProductKey,
    ProductAlternateKey AS codicemodello,
    EnglishProductName AS nome,
    Color,
    StandardCost,
    FinishedGoodsFlag
FROM
    dimproduct
WHERE
    FinishedGoodsFlag = 1;
    SELECT 
    ProductKey,
    ProductAlternateKey AS codicemodello,
    EnglishProductName AS nome,
    StandardCost,
    ListPrice,
    (ListPrice - StandardCost) AS markup
FROM
    dimproduct
WHERE
    ProductAlternateKey LIKE 'FR%' OR 'BK%';
    SELECT 
    FinishedGoodsFlag ProductKey,
    ProductAlternateKey AS codicemodello,
    ListPrice
FROM
    dimproduct
WHERE
    ListPrice BETWEEN 1000 AND 2000;
    SELECT 
    EmployeeKey, SalesPersonFlag, FirstName, LastName
FROM
    dimemployee
WHERE
    SalespersonFlag = 1;
    SELECT 
    SalesOrderNumber,
    OrderDate,
    ProductKey,
    SalesAmount,
    TotalProductCost,
    (SalesAmount - TotalProductCost) AS profitto
FROM
    factresellersales
WHERE
    OrderDate >= '2020-01-01'
        AND (ProductKey = 597 OR ProductKey = 598
        OR ProductKey = 477
        OR ProductKey = 214);
        
        



