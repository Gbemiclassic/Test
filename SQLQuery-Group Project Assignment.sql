
--Group Assignment
--Question 1
--Find the total number of products in each product category
--Answer
SELECT *
FROM [dbo].[DimProduct]
SELECT *
FROM [dbo].[DimProductCategory]

SELECT*
FROM [dbo].[DimProductSubcategory]
----

SELECT
 PC.ProductCategoryKey,
 COUNT(*) As TotalProducts
 FROM DimProduct P
 JOIN DimProductSubcategory PS
 ON P.ProductSubcategoryKey= PS.ProductSubcategoryKey
 JOIN DimProductCategory PC
 ON PC.ProductCategoryKey =PS. ProductCategoryKey
 GROUP BY PC.ProductCategoryKey
ORDER BY TotalProducts ASC ;




 --Question 2
 --Find the top 10 customers with the highest total purchase amount
--Answer
SELECT TOP 10 
  C.CustomerKey,
  CONCAT(C.FirstName, ' ', C.LastName) FullName,
  SUM(S.SalesAmount) AS TotalPurchase
FROM FactInternetSales S
JOIN 
 DimCustomer C
ON S.CustomerKey = C.CustomerKey
GROUP BY
  C.CustomerKey,
    CONCAT(C.FirstName, ' ', C.LastName) 
   ORDER BY C.CustomerKey DESC ;




----


--Question 3
--Find the average purchase for each customer
--Answer
SELECT 
  C.CustomerKey,
  C.FirstName,
  C.LastName,
  CONCAT(C.FirstName, ' ', C.LastName) FullName,
  AVG(S.SalesAmount) AS AVGPurchase
FROM FactInternetSales S
JOIN 
 DimCustomer C
ON S.CustomerKey = C.CustomerKey
GROUP BY
  C.CustomerKey,
  C.FirstName,
  C.LastName
   ORDER BY C.CustomerKey ;

  ----Question 4
  --Find the total quantity sold for each product

 --Answer
 SELECT
  DP.ProductKey,
  SUM (FS .OrderQuantity) TotalQuantity
  FROM FactInternetSales FS 
  JOIN
  DimProduct DP
  ON DP.ProductKey = FS.ProductKey
  GROUP BY DP.ProductKey



  --Question 5
  --Find the total sales amount for each territory
  --Answer
  SELECT
  SalesTerritoryKey,
  SalesAmount,
  SUM(SalesTerritoryKey) AS Totalsales
  FROM [dbo].[FactInternetSales]
  GROUP BY 
  SalesTerritoryKey,
  SalesAmount;
  
  ---Question 6

  --Find the total number of orders placed in each year
  --Answer
  SELECT
  OrderQuantity,
  OrderDateKey,
  COUNT(*) AS Totalnumberordered
  FROM [dbo].[FactInternetSales]
  GROUP BY 
  OrderQuantity,
  OrderDateKey
  ORDER BY Totalnumberordered ASC;


--  --Question 7
--Find the average order amount for each year.
--Answer
SELECT
  OrderQuantity,
  OrderDateKey,
  AVG(OrderQuantity) AS Totalnumberordered
  FROM [dbo].[FactInternetSales]
  GROUP BY 
  OrderQuantity,
  OrderDateKey
  ORDER BY Totalnumberordered ASC;

  --Question 8
  --Find the top 5 products with the highest total sales amount
  --Answer
  SELECT TOP 5
  DP.ProductKey,
  SF.SalesAmount,
  SUM(SF.SalesAmount) AS TotalSalesAmount
  FROM  FactInternetSales SF
  JOIN DimProduct DP 
  ON DP.ProductKey = SF.ProductKey
  GROUP BY 
  DP.ProductKey,
  SF.SalesAmount
  ORDER BY 
  TotalSalesAmount DESC;

  ----Question 9
  --Find the total number of employees in each job title
--Answer

SELECT
Title,
COUNT( EmployeeKey ) AS Totalemployees
FROM
[dbo].[DimEmployee]
GROUP BY 
Title;


--Question 10
--Find the total number of products in each colour.
--Answer
SELECT
Color,
COUNT(ProductKey) AS Totalnumber
FROM [dbo].[DimProduct]
GROUP BY
Color;




--Question 11
--Find the top 10 Customers with the highest number of orders
--Answer
 SELECT TOP 10
 C.Firstname,
 C.Lastname,
  C.CustomerKey,
  SUM(SF.OrderQuantity) AS numberoforder
  FROM  FactInternetSales SF
  JOIN DimCustomer C
  ON C.CustomerKey = SF.CustomerKey
  GROUP BY 
  C.Firstname,
 C.Lastname,
  C.CustomerKey
  ORDER BY 
  numberoforder DESC;


  --Question 12
  --Find the total number of products sold by each employee
  --Answer
  SELECT
  SF.ProductKey,
  E.EmployeeKey,
  SUM (SalesAmount) Totalnumbersold
  FROM  FactInternetSales SF
  JOIN DIMEmployee E
  ON 
  SF.SalesTerritoryKey = E.SalesTerritoryKey
  GROUP BY 
  SF.ProductKey,
  E.EmployeeKey;


  ----Question 13
  --Find the total number of products in each subcategory
  --Answer

  SELECT
 P.ProductSubcategoryKey ,
  COUNT(P.ProductKey) As Totalnumberofproducts
  FROM DimProduct P
  JOIN DimProductSubcategory SB
  ON SB.ProductSubcategoryKey = P.ProductSubcategoryKey
  GROUP BY  P. ProductSubcategoryKey;


--Question 14 

--Find the top 5 products with the highest profit margin
--Answer
SELECT 
DISTINCT
P. ProductKey,
SF.TotalProductCost,
SF.SalesAmount,
SalesAmount-TotalProductCost AS ProfitMargin
FROM FactInternetSales SF
JOIN DimProduct P
ON SF.ProductKey=P.ProductKey
ORDER BY ProfitMargin DESC;

--Question 15
--Find the total number of sales made by each salesperson
--Answer

SELECT
SalesPersonFlag,
SUM(SalesAmount) Totalnumberofsales
FROM FactInternetSales SF
JOIN DimEmployee E
ON SF.SalesTerritoryKey = E. SalesTerritoryKey 
GROUP BY SalesPersonFlag;


----Question 16
--Find the total number of orders with a specific ship method
--Answer



----Question 17
--Find the top 10 customers with the highest total number of products purchased.
--Answer

SELECT
CustomerKey,
ProductKey,
SUM(SalesAmount) Totalnumberpurchased
FROM[dbo].[FactInternetSales]
GROUP BY 
CustomerKey,
ProductKey;

  
