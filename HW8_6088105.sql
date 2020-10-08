-- EXERCISE --
-- 1. Find all parts with a price greater than or equal to average parts price. --
SELECT *
FROM [PremierProducts].[dbo].[Part]
WHERE Price >= (
				SELECT AVG(Price )
				FROM [PremierProducts].[dbo].[Part]
				)
-- 2. Write a query to find the names of all customer who made an order before '2010-10-22'. --
SELECT C.CustomerName
FROM [PremierProducts].[dbo].[Customer] as C
WHERE EXISTS  (
						SELECT O.CustomerNum
						FROM [PremierProducts].[dbo].[Orders] O
						WHERE C.CustomerNum = O.CustomerNum
						AND OrderDate < '2010-10-22'
						)

-- 3. Write a query to find the names of the customer who were contacted by Valerie Kaiser. --
SELECT CustomerName, RepNum
FROM [PremierProducts].[dbo].[Customer]
WHERE EXISTS (
				SELECT RepNum, FirstName
				FROM [PremierProducts].[dbo].[Rep]
				WHERE Customer.RepNum = Rep.RepNum AND FirstName = 'Valerie' AND Rep.LastName = 'Kaiser'
				)
SELECT * FROM Customer
SELECT * FROM Rep
-- 4. Write a query to find the names and the balance of the customer who have a higher balance than the customer whose Name =‘Brookings Direct’. --
SELECT CustomerName
FROM Customer
WHERE Balance > (
					SELECT Balance
					FROM Customer
					WHERE CustomerName = 'Brookings Direct'
					)

-- HOMEWORK --
-- 1. Write a query to find name of the customers who have ordered part and live in the Fillmore. --
SELECT CustomerName
FROM Customer
WHERE EXISTS (
				SELECT CustomerNum
				FROM Orders
				WHERE Orders.CustomerNum = Customer.CustomerNum AND Customer.City = 'Fillmore'
			)
-- 2. Write a query to find name, balance, and credit limit of the customers who credit limit is greater than the average credit limit. --
SELECT CustomerName, Balance, CreditLine
FROM Customer
WHERE Customer.CreditLine > ( SELECT AVG(CreditLine) FROM Customer) 

-- 3. Write a query to find the names, the balance of the customers who have balance more than customer name Ferguson's. --
SELECT CustomerName, Balance
FROM Customer
WHERE Balance > (SELECT Balance FROM Customer WHERE CustomerName like '%Ferguson%')

-- 4.Lists all the customers who order the Home Gym and Microwave Oven. --
SELECT CustomerName, CustomerNum
FROM Customer
WHERE CustomerNum IN (
				SELECT CustomerNum
				FROM Orders 
				JOIN OrderLine 
				ON Orders.OrderNum = OrderLine.OrderNum
				JOIN Part
				ON OrderLine.PartNum = Part.PartNum
				WHERE Part.Description = 'Home Gym' OR Part.Description = 'Microwave Oven' 
				)
-- 5.Write a query to find the part number and description where price are higher than the average quoted price. --
SELECT PartNum, Description
FROM Part
WHERE Price > (
				SELECT AVG(QuotedPrice)
				FROM OrderLine
				WHERE Part.PartNum = OrderLine.PartNum
				)