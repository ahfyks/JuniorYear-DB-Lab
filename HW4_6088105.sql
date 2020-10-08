-- 1. Write a query that returns BusinessEntityID,LastName , NationalIDNumber, and JobTitle of all Person.--
SELECT Person.person.BusinessEntityID, Person.Person.LastName, HumanResources.Employee.NationalIDNumber, HumanResources.Employee.JobTitle  
FROM Person.Person 
INNER JOIN HumanResources.Employee 
ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID;
-- 2. Write a query that returns FirstName, LastName and CreditCardID of Person who have credit cards. --
SELECT Person.Person.FirstName, Person.Person.LastName, Sales.PersonCreditCard.CreditCardID
FROM Person.Person 
INNER JOIN Sales.PersonCreditCard
ON Person.Person.BusinessEntityID = Sales.PersonCreditCard.BusinessEntityID;
-- 3. Write a query that returns ProductName, Product Category, Product SubCategory and Product Model of all unique Products. --
SELECT DISTINCT Production.Product.Name, Production.ProductCategory.Name, Production.ProductSubcategory.Name, Production.ProductModel.Name
FROM Production.Product
LEFT JOIN Production.ProductSubcategory
ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID
LEFT JOIN Production.ProductCategory ON Production.ProductCategory.ProductCategoryID = Production.ProductSubCategory.ProductCategoryID
LEFT JOIN Production.ProductModel ON Production.ProductModel.ProductModelID = Production.Product.ProductModelID;

-- 4. Write a query that returns Name, LogInID and DepartmentName of Employee who were assigned the department and loginID. --
SELECT pp.FirstName, he.LoginID, dept.Name
FROM Person.Person as pp
INNER JOIN HumanResources.Employee as he ON pp.BusinessEntityID = he.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory as hedh ON hedh.BusinessEntityID = he.BusinessEntityID
INNER JOIN HumanResources.Department as dept ON hedh.DepartmentID = dept.DepartmentID
-- 5. Write a query that returns one column called Name and contains the last name of the employee with NationalIDNumber 112457891. --
SELECT CONCAT(pp.LastName, he.NationalIDNumber) AS Name
FROM Person.Person pp
INNER JOIN HumanResources.Employee he ON pp.BusinessEntityID = he.BusinessEntityID
WHERE he.NationalIDNumber = 112457891

--HW--
-- Write a query against the AdventureWorks database that returns ProductID, Name and SpecialOfferID of (1) all products and that have No Special offers, and (2) all products that have No Discount offer --
SELECT pp.ProductID, pp.Name, ss.SpecialOfferID
FROM Production.Product pp
FULL JOIN Sales.SpecialOfferProduct ss ON pp.ProductID = ss.ProductID
WHERE ss.SpecialOfferID IS NULL