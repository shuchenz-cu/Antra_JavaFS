USE Northwind
GO
-- 1.      List all cities that have both Employees and Customers.
SELECT DISTINCT city
FROM employees
WHERE city IN (
    SELECT city FROM customers
)

-- 2.      List all cities that have Customers but no Employee.

-- a.      Use sub-query
SELECT DISTINCT City
FROM Customers
WHERE City NOT IN (
    SELECT City FROM Employees
)


-- b.      Do not use sub-query
SELECT DISTINCT c.City
FROM Customers AS c
LEFT JOIN Employees AS e
ON c.City = e.City
WHERE e.City IS NULL


-- 3.      List all products and their total order quantities throughout all orders.
SELECT ord.ProductID, ProductName, SUM(Quantity) AS Quantity
FROM [Order Details] AS ord
LEFT JOIN Products AS p
ON ord.ProductID = p.ProductID
GROUP BY ord.ProductID, ProductName


-- 4.      List all Customer Cities and total products ordered by that city.

SELECT DISTINCT City, QuantitySum
FROM Customers c
LEFT JOIN (
    SELECT ShipCity, SUM(Quantity) as QuantitySum
    FROM Orders AS ord
    LEFT JOIN [Order Details] AS ord_d
    ON ord.OrderID = ord_d.OrderID
    GROUP BY ShipCity
) s
ON c.City = s.ShipCity


-- 5.      List all Customer Cities that have at least two customers.

-- a.      Use union
SELECT city
FROM customers
GROUP BY city
HAVING COUNT(*) >= 2

UNION

SELECT city
FROM customers
GROUP BY city
HAVING COUNT(*) >= 2

-- b.      Use sub-query and no union
SELECT DISTINCT c1.City
FROM Customers c1
LEFT JOIN (
    SELECT City, COUNT(*) AS Count
    FROM Customers
    GROUP BY City) c2
ON c1.City = c2.City
WHERE Count >= 2

-- 6.      List all Customer Cities that have ordered at least two different kinds of products.
SELECT c.City, COUNT(ProductID) as Count
FROM Orders ord
LEFT JOIN [Order Details] ord_d ON ord.OrderID = ord_d.OrderID
LEFT JOIN Customers c on ord.CustomerID = c.CustomerID
GROUP BY c.City
HAVING COUNT(ProductID) >=2


-- 7.      List all Customers who have ordered products, but have the ‘ship city’ on the order different from their own customer cities.
SELECT DISTINCT ContactName, c.City, ord.ShipCity
FROM Customers c
LEFT JOIN Orders ord ON c.CustomerID = ord.CustomerID
WHERE c.City != ord.ShipCity

-- 8.      List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
WITH ProductSummary AS(
    SELECT ord.ProductID, p.ProductName, c.City, AVG(ord.UnitPrice) AS AvgPrice, 
    COUNT(ord.Quantity) as Count, ROW_NUMBER() OVER (PARTITION BY ord.ProductID ORDER BY SUM(ord.Quantity) DESC) AS RowNum
    FROM [Order Details] ord
    LEFT JOIN Products p ON ord.ProductID = p.ProductID
    LEFT JOIN Orders o ON ord.OrderID = o.OrderID
    LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
    GROUP BY ord.ProductID, p.ProductName, c.City
)

SELECT TOP 5 ProductID, ProductName, City, AvgPrice, Count
FROM ProductSummary
WHERE RowNum = 1
ORDER BY Count DESC

-- 9.      List all cities that have never ordered something but we have employees there.
-- a.      Use sub-query
SELECT DISTINCT City
FROM Employees
WHERE City NOT IN (
    SELECT DISTINCT ShipCity
    FROM Orders
)


-- b.      Do not use sub-query
SELECT DISTINCT e.City
FROM Employees e
LEFT JOIN Orders o ON e.City = o.ShipCity
WHERE o.OrderID IS NULL


-- 10.  List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, 
-- and also the city of most total quantity of products ordered from. (tip: join  sub-query)

-- 11. How do you remove the duplicates record of a table?
-- Union table to table itself