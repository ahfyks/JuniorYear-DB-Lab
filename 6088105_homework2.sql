-- Create Database PremiereProductsCompany --
CREATE DATABASE PremiereProductsCompany COLLATE THAI_CI_AS
GO
-- Create table Rep --
CREATE TABLE PremiereProductsCompany.dbo.Rep
(
RepNum int NOT NULL PRIMARY KEY,
LastName varchar(255),
FirstName varchar(255),
Street varchar(255),
City varchar(255),
State varchar(2), 
Zip varchar(10),
Commision money,
Rate float 
);
EXEC SP_COLUMNS Rep
-- Create table Customer --
CREATE TABLE PremiereProductsCompany.dbo.Customer
(
CustomerNum int NOT NULL PRIMARY KEY,
CustomerName varchar(255),
Street varchar(255),
City varchar(255),
State varchar(2), 
Zip varchar(10),
Balance money,
CreditLimit float,
RepNum int FOREIGN KEY REFERENCES Rep(RepNum) 
);
-- Create table Orders --
CREATE TABLE Orders
(OrderNum CHAR(5) PRIMARY KEY,
OrderDate DATE,
CustomerNum int FOREIGN KEY REFERENCES Customer(CustomerNum)  )
;
-- Create table Part --
CREATE TABLE Part
(PartNum CHAR(4) PRIMARY KEY,
Description CHAR(15),
OnHand DECIMAL(4,0),
Class CHAR(2),
Warehouse CHAR(1),
Price DECIMAL(6,2) )
;
-- Create table Orderline --
CREATE TABLE OrderLine
(OrderNum CHAR(5) FOREIGN KEY REFERENCES Orders(OrderNum) ,
PartNum CHAR(4) FOREIGN KEY REFERENCES Part(PartNum) ,
NumOrdered DECIMAL(3,0),
QuotedPrice DECIMAL(6,2),
 )
;
-- Create Table CurrentOrders --
CREATE TABLE PremiereProductsCompany.dbo.CurrentOrders
(
CustomerName varchar(255) ,
OrderNum CHAR(5) FOREIGN KEY REFERENCES Orders(OrderNum) ,
PartNum CHAR(4) FOREIGN KEY REFERENCES Part(PartNum) ,
Description CHAR(15) ,
NumOrdered DECIMAL(3,0) ,
QuotedPrice DECIMAL(6,2) ,
Warehouse CHAR(1) ,
RepNum int FOREIGN KEY REFERENCES Rep(RepNum) 
);

-- Insert Data into rep --
INSERT INTO RepVALUES (20, 'Kaiser', 'Valerie', '624 Randall','Grove', 'FL', '33321', '20542.50', '0.05'),(35, 'Hull', 'Richard','532 Jackson', 'Sheldon', 'FL', '33553', '39216.00', '0.07'),(65, 'Perez', 'Juan','1626 Taylor', 'Fillmore', 'FL', '33336', '23487.00', '0.05');
-- Insert Data into Customer --
INSERT INTO Customer
VALUES
('148','Al''s Appliance and Sport','2837 Greenway','Fillmore','FL','33336',6550.00,7500.00,'20'),
('282','Brookings Direct','3827 Devon','Grove','FL','33321',431.50,10000.00,'35'),
('356','Ferguson''s','382 Wildwood','Northfield','FL','33146',5785.00,7500.00,'65'),
('408','The Everything Shop','1828 Raven','Crystal','FL','33503',5285.25,5000.00,'35'),
('462','Bargains Galore','3829 Central','Grove','FL','33321',3412.00,10000.00,'65'),
('524','Kline''s','838 Ridgeland','Fillmore','FL','33336',12762.00,15000.00,'20'),
('608','Johnson''s Department Store','372 Oxford','Sheldon','FL','33553',2106.00,10000.00,'65'),
('687','Lee''s Sport and Appliance','282 Evergreen','Altonville','FL','32543',2851.00,5000.00,'35'),
('725','Deerfield''s Four Seasons','282 Columbia','Sheldon','FL','33553',248.00,7500.00,'35'),
('842','All Season','28 Lakeview','Grove','FL','33321',8221.00,7500.00,'20');

-- Insert Data into Orders --
INSERT INTO Orders
VALUES
('21608','20-OCT-2013','148'),
('21610','20-OCT-2013','356'),
('21613','21-OCT-2013','408'),
('21614','21-OCT-2013','282'),
('21617','23-OCT-2013','608'),
('21619','23-OCT-2013','148'),
('21623','23-OCT-2013','608');
-- Insert Data into Part --
INSERT INTO Part
VALUES
('AT94','Iron',50,'HW','3',24.95),
('BV06','Home Gym',45,'SG','2',794.95),
('CD52','Microwave Oven',32,'AP','1',165.00),
('DL71','Cordless Drill',21,'HW','3',129.95),
('DR93','Gas Range',8,'AP','2',495.00),
('DW11','Washer',12,'AP','3',399.99),
('FD21','Stand Mixer',22,'HW','3',159.95),
('KL62','Dryer',12,'AP','1',349.95),
('KT03','Dishwasher',8,'AP','3',595.00),
('KV29','Treadmill',9,'SG','2',1390.00);

-- Insert Data into OrderLine --
INSERT INTO OrderLine
VALUES
('21608','AT94',11,21.95),
('21610','DR93',1,495.00),
('21610','DW11',1,399.99),
('21613','KL62',4,329.95),
('21614','KT03',2,595.00),
('21617','BV06',2,794.95),
('21617','CD52',4,150.00),
('21619','DR93',1,495.00),
('21623','KV29',2,1290.00);


SELECT * FROM Rep
SELECT * FROM Customer
SELECT * FROM Orders
SELECT * FROM OrderLine
SELECT * FROM Part
EXEC sp_fkeys OrderLine

