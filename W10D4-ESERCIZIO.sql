-- Esponi l’anagrafica dei prodotti indicando per ciascun prodotto anche la sua sottocategoria (DimProduct, DimProductSubcategory).
SELECT 
    *
FROM
    dimproduct
        LEFT OUTER JOIN
    dimproductsubcategory ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey;
-- Esponi l’anagrafica dei prodotti indicando per ciascun prodotto la sua sottocategoria e la sua categoria (DimProduct, DimProductSubcategory, DimProductCategory).
SELECT 
    *
FROM
    dimproduct
        LEFT OUTER JOIN
    dimproductsubcategory ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
        LEFT OUTER JOIN
    dimproductcategory ON dimproductcategory.ProductCategoryKey = dimproductsubcategory.ProductCategoryKey;    
-- Esponi l’elenco dei soli prodotti venduti (DimProduct, FactResellerSales).
SELECT DISTINCT
    *
FROM
    dimproduct
WHERE
    ProductKey IN (SELECT 
            ProductKey
        FROM
            factresellersales);
-- Esponi l’elenco dei prodotti non venduti (considera i soli prodotti finiti cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1).
    SELECT DISTINCT
    *
FROM
    dimproduct
WHERE
    FinishedGoodsFlag = 1
        AND ProductKey NOT IN (SELECT 
            ProductKey
        FROM
            factresellersales);
-- Esponi l’elenco delle transazioni di vendita (FactResellerSales) indicando anche il nome del prodotto venduto (DimProduct)
SELECT 
    factresellersales.*, dimproduct.EnglishProductName
FROM
    factresellersales
        LEFT OUTER JOIN
    dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey;
-- Esponi l’elenco delle transazioni di vendita indicando la categoria di appartenenza di ciascun prodotto venduto.
SELECT 
    factresellersales.*,
    dimproduct.EnglishProductName,
    dimproductsubcategory.EnglishProductSubcategoryName,
    dimproductcategory.EnglishProductCategoryName
FROM
    factresellersales
        LEFT OUTER JOIN
    dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey
        LEFT OUTER JOIN
    dimproductsubcategory ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
        LEFT OUTER JOIN
    dimproductcategory ON dimproductcategory.ProductCategoryKey = dimproductsubcategory.ProductCategoryKey;
-- Esplora la tabella DimReseller.
SELECT 
    *
FROM
    dimreseller;
-- Esponi in output l’elenco dei reseller indicando, per ciascun reseller, anche la sua area geografica.
SELECT 
    dimreseller.*,
    dimgeography.EnglishCountryRegionName,
    dimgeography.StateProvinceName,
    dimgeography.City,
    dimgeography.PostalCode
FROM
    dimreseller
        LEFT OUTER JOIN
    dimgeography ON dimreseller.GeographyKey = dimgeography.GeographyKey;
-- Esponi l’elenco delle transazioni di vendita. Il result set deve esporre i campi: SalesOrderNumber, SalesOrderLineNumber, OrderDate, UnitPrice, Quantity, TotalProductCost. Il result set deve anche indicare il nome del prodotto, il nome della categoria del prodotto, il nome del reseller e l’area geografica.
SELECT 
    factresellersales.SalesOrderNumber,
    factresellersales.SalesOrderLineNumber,
    factresellersales.OrderDate,
    factresellersales.UnitPrice,
    factresellersales.OrderQuantity AS quantity,
    factresellersales.TotalProductCost,
    dimproduct.EnglishProductName AS ProductName,
    dimproductcategory.EnglishProductCategoryName AS CategoryName,
    dimreseller.ResellerName,
    dimgeography.EnglishCountryRegionName AS CountryRegionName,
    dimgeography.StateProvinceName,
    dimgeography.City
FROM
    factresellersales
        LEFT OUTER JOIN
    dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey
        LEFT OUTER JOIN
    dimproductsubcategory ON dimproductsubcategory.ProductSubcategoryKey = dimproduct.ProductSubcategoryKey
        LEFT OUTER JOIN
    dimproductcategory ON dimproductcategory.ProductCategoryKey = dimproductsubcategory.ProductCategoryKey
        LEFT OUTER JOIN
    dimreseller ON dimreseller.ResellerKey = factresellersales.ResellerKey
        LEFT OUTER JOIN
    dimgeography ON dimreseller.GeographyKey = dimgeography.GeographyKey;
    

