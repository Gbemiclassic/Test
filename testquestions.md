## Case Study Solutions

** Question 1: Find the total number of products in each product category **
````sql
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
````
