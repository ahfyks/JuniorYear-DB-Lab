-- EXERCISE --
--1. Write a query to create table Q1 with the following fields userId uniqueidentifier, firstName nvarchar(20), lastName nvarchar(20). --
CREATE TABLE Q1 (
userId uniqueidentifier,
firstname nvarchar(20),
lastname nvarchar(20)
);
--2. Write two queries to insert you and your friend data into table Q1 with a random generate on userId. --INSERT INTO Q1 VALUES(NEWID(),'Dujnapa','Lastname'),(NEWID(),'Thanirin','Tritonnarith');--3. From Q1, can you select name, lastname and present these data in one column with a single space between them as well as count total characters of your name and lastname. --SELECT LEN(CONCAT(firstname,' ', lastname)) FROM Q1 --4. Write a query to create table Q2 with the following fields Uname nvarchar(32), Upass nvarchar(64). --CREATE TABLE Q2 (
Uname nvarchar(32),
Upass binary(64)
);--5.Write a query to insert your username e.g., u5988xxx and password ‘123456’ data into table Q2. To insert into a password field, you need to encode it first using HASHBYTES function with MD5 encoding format. --
INSERT INTO Q2 VALUES
('u6088105', HASHBYTES('MD5','123456'));
SELECT * FROM Q2
-- HOMEWORK --
--6. Write a query to create table Q3 with based on the following fields Uid uniqueidentifier, Fname nvarchar(20), LoginDate date, LoginTime time, LogoutTime time. --CREATE TABLE Q3 (
Uid uniqueidentifier,
Fname nvarchar(20),
LoginDate date,
LoginTime time,
Logout time
);--7. Write a query to insert Uid, yourname, LoginDate, and LoginTime into table Q4 (Using current date and time). --INSERT  INTO Q3 (Uid,Fname,LoginDate,LoginTime) VALUES(NEWID(),'Fha',GETDATE(), CURRENT_TIMESTAMP);--8.Write a query to update LogoutTime (Using current date and time), where Fname = yourname in table Q4.--UPDATE Q3SET Logout = CURRENT_TIMESTAMPWHERE Fname = 'Fha'SELECT * FROM Q3--9.Write a query to retrieve Fname, LoginTime, and LogoutTime (showing time in hh:mm:ss format)--SELECT Fname,LoginTime,Logout FROM Q3--10.Write a query to get Fname, LoginDate, and Online time. Where – LoginDate is presented in dd-Month-yyyy format (Month is a full month name e.g., 03 = March). – Online time is calculated from LogoutTime – LoginTime (only different in minutes is considered) --SELECT Fname, FORMAT(LoginDate ,'dd-MMMM-yyyy') as LoginDate, DATEDIFF(MINUTE ,LoginTime,Logout) as OnlineTime FROM Q3