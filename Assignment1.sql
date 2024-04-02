-- Write a query that retrieves the columns ProductID, Name, Color 
-- and ListPrice from the Production.Product table, with no filter. 
select ProductID, Name, Color, ListPrice
from Production.Product


-- Write a query that retrieves the columns ProductID, Name, Color 
-- and ListPrice from the Production.Product table, excludes the rows that ListPrice is 0.
select ProductID, Name, Color, ListPrice
from Production.Product
where ListPrice != 0


-- Write a query that retrieves the columns ProductID, Name, Color 
-- and ListPrice from the Production.Product table, the rows that are NULL for the Color column.
select ProductID, Name, Color, ListPrice
from Production.Product
where Color is null


-- Write a query that retrieves the columns ProductID, Name, Color 
-- and ListPrice from the Production.Product table, the rows that are not NULL for the Color column.
select ProductID, Name, Color, ListPrice
from Production.Product
where Color is not null


-- Write a query that retrieves the columns ProductID, Name, Color 
-- and ListPrice from the Production.Product table, the rows that are not NULL for the column Color, 
-- and the column ListPrice has a value greater than zero.
select ProductID, Name, Color, ListPrice
from Production.Product
where Color is not null and ListPrice > 0


-- Write a query that concatenates the columns Name and Color from the Production.
-- Product table by excluding the rows that are null for color.
select Name +' '+ Color as NameColor
from Production.Product
where Color is not null


-- Write a query that generates the following result set  from Production.Product:
-- NAME: LL Crankarm  --  COLOR: Black
-- NAME: ML Crankarm  --  COLOR: Black
-- NAME: HL Crankarm  --  COLOR: Black
-- NAME: Chainring Bolts  --  COLOR: Silver
-- NAME: Chainring Nut  --  COLOR: Silver
-- NAME: Chainring  --  COLOR: Black
select ProductID, Name, Color
from Production.Product
where Color in ('Black', 'Silver')
and Name like '%Crankarm%'
or Name like '%Chainring%'


-- Write a query to retrieve the to the columns ProductID and Name from the Production.
-- Product table filtered by ProductID from 400 to 500
select ProductID, Name
from Production.Product
where ProductID between 400 and 500

-- Write a query to retrieve the to the columns  ProductID, Name and color from 
-- the Production.Product table restricted to the colors black and blue
select ProductID, Name, Color
from Production.Product
where Color in ('Black', 'Blue')

-- Write a query to get a result set on products that begins with the letter S. 
select ProductID, Name, Color, ListPrice
from Production.Product
where Name like 'S%'


-- Write a query that retrieves the columns Name and ListPrice from the Production.
-- Product table. Your result set should look something like the following. Order the result set by the Name column. 
-- Name                                               ListPrice
-- Seat Lug                                              0,00
-- Seat Post                                             0,00
-- Seat Stays                                            0,00
-- Seat Tube                                            0,00
-- Short-Sleeve Classic Jersey, L           53,99
-- Short-Sleeve Classic Jersey, M          53,99
select Name, ListPrice
from Production.Product
where Name like 'S%'
order by 1



--  Write a query that retrieves the columns Name and ListPrice from the Production.Product table.
--  Your result set should look something like the following. Order the result set by the Name column. 
-- The products name should start with either 'A' or 'S'
-- Name                                               ListPrice
-- Adjustable Race                                   0,00
-- All-Purpose Bike Stand                       159,00
-- AWC Logo Cap                                      8,99
-- Seat Lug                                                 0,00
-- Seat Post                                                0,00
select Name, ListPrice
from Production.Product
where Name like 'S%'
or Name like 'A%'
order by 1

-- Write a query so you retrieve rows that have a Name that begins with the letters SPO, 
-- but is then not followed by the letter K. After this zero or more letters can exists. 
-- Order the result set by the Name column.
select ProductID, Name, Color, ListPrice
from Production.Product
where Name LIKE 'SPO%'
AND Name NOT LIKE 'SPOK%'

-- Write a query that retrieves unique colors from the table Production.Product. Order the results  in descending  manner
SELECT DISTINCT Color
from Production.Product
order by 1 DESC


-- Write a query that retrieves the unique combination of columns ProductSubcategoryID
-- and Color from the Production.Product table. Format and sort so the result set accordingly to 
-- the following. We do not want any rows that are NULL.in any of the two columns in the result.
select distinct ProductSubcategoryID, Color
from Production.Product
where ProductSubcategoryID is not NULL
and Color is not null
order by ProductSubcategoryID, Color