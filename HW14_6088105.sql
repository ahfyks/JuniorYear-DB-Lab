-- Q1 --
SELECT DT.*,O.[CustomerNum]
FROM(
		SELECT OrderNum, NumOrdered, QuotedPrice, P.*
		FROM [OrderLine] OL JOIN [Part] AS P ON P.PartNum = OL.PartNum
		) AS DT
		JOIN [Orders] AS O ON O.OrderNum = DT.[OrderNum]

-- Q2 --
SELECT O.OrderNum, O.OrderDate, DT.CustomerName, Dt.RepName
FROM Orders O
JOIN(	SELECT C.CustomerNum, C.CustomerName, C.RepNum, R.FirstName + ' ' + R.LastName AS RepName
		FROM Customer AS C JOIN Rep AS R ON C.RepNum = R.RepNum
		) AS DT
ON O.CustomerNum = DT.CustomerNum

-- Q3 --
WITH cteOrder (OrderNum, OrderYear, CUstomerName, Part, Amount, Price, RepNum)
AS
(
	SELECT O.OrderNum, YEAR(O.OrderDate), C.CustomerName, P.Description, L.NumOrdered, L.QuotedPrice, C.RepNum
	FROM Orders O
	JOIN OrderLine L ON O.OrderNum = L.OrderNum
	JOIN Customer C ON O.CustomerNum = C.CustomerNum
	JOIN Part P ON L.PartNum = P.PartNum
)
SELECT * FROM cteOrder
SELECT * FROM Customer WHERE CustomerNum = 608

-- EXERCISE --
-- 1. Write a SQL query to get the summary of all orders of CustomerNum ‘608’ using Derived Tables.
SELECT * FROM (
	SELECT O.CustomerNum, O.OrderNum, O.OrderDate, L.NumOrdered FROM Orders as O 
	JOIN OrderLine L ON O.OrderNum = L.OrderNum
	WHERE CustomerNum = 608)
AS DerivedTable


-- 2. Write a SQL query to get the summary of all orders of CustomerNum ‘608’ using Common Table Expression format. 
WITH cteOrder (CustomerNum, OrderNum, OrderDate, NumOrdered)
AS(
	SELECT O.CustomerNum, O.OrderNum, O.OrderDate, L.NumOrdered 
	FROM Orders as O 
	JOIN OrderLine L ON O.OrderNum = L.OrderNum
	WHERE CustomerNum = 608)
SELECT * FROM cteOrder

-- HW
-- Use the template and implement an inline table-valued function that:
-- – takes as input a CustomerNum.
-- – returns the summary of all orders made by the given CustomerNum.
-- The summary of all orders consists of the following fields: OrderNum, OrderDate, CustomerNum, AmountOrder andSumPrice, where
-- – AmountOrder is the total number of lines of the order
-- – SumPrice is the total price of the orderCREATE FUNCTION func_OrderDetail(@CustomerNum int) RETURNS TABLEASRETURN(	SELECT O.OrderNum, O.OrderDate, O.CustomerNum, OD.NumOrdered AS AmountOrder, (OD.QuotedPrice * OD.NumOrdered) AS SumPrice 	FROM Orders O JOIN OrderLine OD ON O.OrderNum = OD.OrderNum	WHERE CustomerNum = @CustomerNum	);SELECT * FROM func_OrderDetail('608')
SELECT * FROM Orders