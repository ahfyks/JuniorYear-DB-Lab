CREATE DATABASE TestTrigger;

CREATE TABLE person(
	pid varchar(4) PRIMARY KEY,
	full_name varchar(255) not null,
	budget decimal(18,2) not null,
	proj_id varchar(4)
);

CREATE TABLE project (
	proj_id varchar(4) PRIMARY KEY,
	proj_name varchar(255) not null,
	total_budget decimal(18,2) not null
);



INSERT INTO project (proj_id, proj_name, total_budget) VALUES
('1','Project 1', 55000),
('2','Project 2', 35000),
('3','Project 3', 98000),
('4','Project 4', 25000);


INSERT INTO person (pid, full_name, budget, proj_id) VALUES
('001','Peter Copper', 20000, 1),
('002','Sarah MaCorr', 10000, 1),
('003','Henry Pipe', 25000, 1),
('004','Wilman Kala', 30000, 2),
('005','Matti Karttunen', 5000, 2),
('006','Luke Miller', 21000, 3),
('007','Margaret Johnson', 22000, 3),
('008','Bruce Randall', 32000, 3),
('009','Hina Siddiqui', 23000, 3),
('010','Joanne Mills', 25000, 4);

-- Lab
CREATE TABLE LogFileAudit (
	LogID INT PRIMARY KEY,
	Action varchar(225) NOT NULL,
	TableName varchar(225) NOT NULL
);


-- HW
-- Q1
DROP TRIGGER addLogINS
CREATE TRIGGER addLogINS
ON Person
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @newLogID int;
	SET @newLogID = 0; 
	IF ((SELECT COUNT(logID) FROM LogFileAudit) > 0)
	BEGIN
		SELECT @newLogID = (MAX(LogID)+1) FROM  LogFileAudit;
	END
	INSERT INTO LogFileAudit VALUES (@newLogID, 'INSERT', 'person');
END;

Select * from LogFileAudit
Select * from person

INSERT INTO person VALUES ('018','Harry Pipe', 25000, 2);

-- Q2
CREATE TRIGGER addLogDEL
ON Project
FOR DELETE
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @newLogID int;
	SET @newLogID = 0; 
	IF ((SELECT COUNT(logID) FROM LogFileAudit) > 0)
	BEGIN
		SELECT @newLogID = (MAX(LogID)+1) FROM  LogFileAudit;
	END
	INSERT INTO LogFileAudit VALUES (@newLogID, 'DELETE', 'project');
END;

DELETE FROM project
Select * from LogFileAudit
