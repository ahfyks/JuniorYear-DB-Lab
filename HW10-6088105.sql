-- EXERCISE --
--1. Write a query to create table Q1 with the following fields userId uniqueidentifier, firstName nvarchar(20), lastName nvarchar(20). --
CREATE TABLE Q1 (
userId uniqueidentifier,
firstname nvarchar(20),
lastname nvarchar(20)
);
--2. Write two queries to insert you and your friend data into table Q1 with a random generate on userId. --
Uname nvarchar(32),
Upass binary(64)
);
INSERT INTO Q2 VALUES
('u6088105', HASHBYTES('MD5','123456'));
SELECT * FROM Q2
-- HOMEWORK --
--6. Write a query to create table Q3 with based on the following fields Uid uniqueidentifier, Fname nvarchar(20), LoginDate date, LoginTime time, LogoutTime time. --
Uid uniqueidentifier,
Fname nvarchar(20),
LoginDate date,
LoginTime time,
Logout time
);