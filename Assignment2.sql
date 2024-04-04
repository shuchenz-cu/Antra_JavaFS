USE AdventureWorks2019
GO

-- 1.      How many products can you find in the Production.Product table?
SELECT COUNT(DISTINCT ProductID)
FROM Production.Product

-- 2.      Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. 
-- The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
SELECT COUNT(DISTINCT ProductID)
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL



-- 3.      How many Products reside in each SubCategory? Write a query to display the results with the following titles.

-- ProductSubcategoryID CountedProducts

-- -------------------- ---------------
SELECT ProductSubcategoryID, COUNT(DISTINCT ProductID) AS CountedProducts
FROM Production.Product
GROUP BY ProductSubcategoryID
HAVING ProductSubcategoryID IS NOT NULL



-- 4.      How many products that do not have a product subcategory.
SELECT COUNT(DISTINCT ProductID)
FROM Production.Product
WHERE ProductSubcategoryID IS NULL


-- 5.      Write a query to list the sum of products quantity in the Production.ProductInventory table.
SELECT SUM(Quantity)
FROM Production.ProductInventory


-- 6.    Write a query to list the sum of products in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100.

--               ProductID    TheSum

--               -----------        ----------
SELECT ProductID, SUM(Quantity) as TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100


-- 7.    Write a query to list the sum of products with the shelf information in the Production.ProductInventory table and LocationID set to 40 
-- and limit the result to include just summarized quantities less than 100

--     Shelf      ProductID    TheSum

--     ----------   -----------        -----------
SELECT Shelf, ProductID, SUM(Quantity) as TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY Shelf, ProductID
HAVING SUM(Quantity) < 100


-- 8. Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table.
SELECT AVG(Quantity)
FROM Production.ProductInventory
WHERE LocationID = 10
-- 9.    Write query  to see the average quantity  of  products by shelf  from the table Production.ProductInventory

--     ProductID   Shelf      TheAvg

--     ----------- ---------- -----------
SELECT ProductID, Shelf, AVG(Quantity) as TheAvg
FROM Production.ProductInventory
GROUP BY Shelf, ProductID

-- 10.  Write query  to see the average quantity  of  products by shelf excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory

--     ProductID   Shelf      TheAvg

--     ----------- ---------- -----------
SELECT ProductID, Shelf, AVG(Quantity) as TheAvg
FROM Production.ProductInventory
WHERE Shelf IS NOT NULL
GROUP BY Shelf, ProductID


-- 11.  List the members (rows) and average list price in the Production.Product table. This should be grouped independently over the Color and the Class column. Exclude the rows where Color or Class are null.

--     Color                        Class              TheCount          AvgPrice

--     -------------- - -----    -----------            ---------------------
SELECT Color, Class, Count(*) AS TheCount, AVG(ListPrice) AS AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL
AND Class IS NOT NULL
GROUP BY Color, Class

select *
from Person.StateProvince
-- Joins:

-- 12.   Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following.

--     Country                        Province

--     ---------                          ----------------------
SELECT c.Name as Country, s.Name as Province
FROM Person.StateProvince s LEFT JOIN Person.CountryRegion c on s.CountryRegionCode = c.CountryRegionCode

-- 13.  Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada. 
-- Join them and produce a result set similar to the following.
 

--     Country                        Province

--     ---------                          ----------------------
SELECT c.Name as Country, s.Name as Province
FROM Person.StateProvince s LEFT JOIN Person.CountryRegion c on s.CountryRegionCode = c.CountryRegionCode
WHERE c.Name in ('Germany', 'Canada')


--  Using Northwnd Database: (Use aliases for all the Joins)
USE Northwind
GO
-- 14.  List all Products that has been sold at least once in last 26 years.
SELECT DISTINCT d.ProductID, ProductName
FROM [Order Details] AS d
JOIN Orders AS o on d.OrderID = o.OrderID
LEFT JOIN Products AS p ON d.ProductID = p.ProductID
WHERE o.OrderDate <= DATEADD(YEAR, -26, GETDATE())

-- 15.  List top 5 locations (Zip Code) where the products sold most.
SELECT TOP 5 *
FROM(
    SELECT DISTINCT ShipPostalCode, COUNT(*) as ShipCount
    FROM Orders as o
    GROUP BY ShipPostalCode
    HAVING ShipPostalCode IS NOT NULL) counts
ORDER BY ShipCount DESC

-- 16.  List top 5 locations (Zip Code) where the products sold most in last 26 years.
SELECT TOP 5 *
FROM(
    SELECT DISTINCT ShipPostalCode, COUNT(*) as ShipCount
    FROM Orders as o
    WHERE o.OrderDate <= DATEADD(YEAR, -26, GETDATE())
    GROUP BY ShipPostalCode
    HAVING ShipPostalCode IS NOT NULL) counts
ORDER BY ShipCount DESC

-- 17.   List all city names and number of customers in that city.     
SELECT City, COUNT(*) as Count
FROM Customers
GROUP BY City



-- 18.  List city names which have more than 2 customers, and number of customers in that city
SELECT *
FROM(
    SELECT City, COUNT(*) as Count
    FROM Customers
    GROUP BY City) c
WHERE Count > 2


-- 19.  List the names of customers who placed orders after 1/1/98 with order date.
SELECT DISTINCT ContactName
FROM Orders AS o
LEFT JOIN Customers AS c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate > '1998-01-01'


-- 20.  List the names of all customers with most recent order dates
SELECT ContactName, MostRecent
FROM(
    SELECT DISTINCT CustomerID, MAX(o.OrderDate) AS MostRecent
    FROM Orders AS o
    GROUP BY CustomerID) AS m
LEFT JOIN Customers AS c ON c.CustomerID = m.CustomerID


-- 21.  Display the names of all customers  along with the  count of products they bought
SELECT ContactName, Count
FROM(
    SELECT DISTINCT CustomerID, COUNT(*) AS Count
    FROM Orders AS o
    GROUP BY CustomerID) AS m
LEFT JOIN Customers AS c ON c.CustomerID = m.CustomerID

-- 22.  Display the customer ids who bought more than 100 Products with count of products.
SELECT CustomerID, Count
FROM(
    SELECT DISTINCT CustomerID, COUNT(*) AS Count
    FROM Orders AS o
    GROUP BY CustomerID) AS m
WHERE Count > 100


-- 23.  List all of the possible ways that suppliers can ship their products. Display the results as below

--     Supplier Company Name                Shipping Company Name

--     ---------------------------------            ----------------------------------
Select DISTINCT Suppliers.CompanyName AS [Supplier Company Name], Shippers.CompanyName AS [Shipping Company Name]
FROM Orders AS o
JOIN [Order Details] AS ord ON o.OrderID = ord.OrderID
JOIN Products AS p ON ord.ProductID = p.ProductID
JOIN Suppliers ON p.SupplierID = Suppliers.SupplierID
JOIN Shippers ON o.ShipVia = Shippers.ShipperID

-- 24.  Display the products order each day. Show Order date and Product Name.
SELECT OrderDate, ProductName
FROM [Order Details] AS ord
LEFT JOIN Orders AS o ON ord.OrderID = o.OrderID
LEFT JOIN Products AS p ON ord.ProductID = p.ProductID


-- 25.  Displays pairs of employees who have the same job title.
SELECT e1.EmployeeID AS Employee1ID, e1.FirstName +' '+ e1.LastName as Employee1Name, 
    e2.EmployeeID AS Employee2ID, e2.FirstName +' '+ e2.LastName AS Employee2Name, e1.Title
FROM Employees e1
JOIN Employees e2 ON e1.Title = e2.Title
WHERE e1.EmployeeID < e2.EmployeeID


-- 26.  Display all the Managers who have more than 2 employees reporting to them.
SELECT FirstName + ' ' + LastName
FROM Employees
WHERE EmployeeID IN (
    SELECT ReportsTo
    FROM Employees
    GROUP BY ReportsTo
    HAVING COUNT(*) > 2
)


-- 27.  Display the customers and suppliers by city. The results should have the following columns

-- City

-- Name

-- Contact Name,

-- Type (Customer or Supplier)
SELECT DISTINCT City, CompanyName, ContactName, 'Customer' AS Type
FROM Customers

UNION ALL

SELECT DISTINCT City, CompanyName, ContactName, 'Supplier' AS Type
FROM Suppliers