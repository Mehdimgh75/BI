CREATE DATABASE Ahan_Online;
GO

USE Ahan_Online;
GO

CREATE SCHEMA SLS;
GO

CREATE SCHEMA HRS
GO

CREATE TABLE SLS.Ahan_Sale
(
	SalesID INT PRIMARY KEY, 
	OrderID INT,
	Customer VARCHAR(10),
	Product VARCHAR(10),
	DateID INT,
	Quantity INT,
	UnitPrice INT
)

INSERT INTO SLS.Ahan_Sale
Values 
(1, 1, 'C1', 'P1', 1, 2, 100),
(2, 1, 'C1', 'P2', 1, 4, 150),
(3, 2, 'C2', 'P2', 1, 5, 150),
(4, 3, 'C3', 'P4', 1, 3, 550),
(5, 4, 'C4', 'P3', 1, 1, 300),
(6, 4, 'C4', 'P6', 1, 6, 150),
(7, 4, 'C4', 'P4', 1, 6, 550),
(8, 5, 'C5', 'P2', 1, 3, 150),
(9, 5, 'C5', 'P1', 1, 6, 100),
(10, 6, 'C1', 'P6', 1, 3, 150),
(11, 6, 'C1', 'P3', 1, 2, 300),
(12, 7, 'C3', 'P5', 1, 4, 400),
(13, 7, 'C3', 'P1', 1, 6, 100),
(14, 7, 'C3', 'P3', 1, 1, 300),
(15, 8, 'C5', 'P2', 1, 3, 150),
(16, 8, 'C5', 'P5', 1, 4, 400),
(17, 8, 'C5', 'P1', 1, 2, 100),
(18, 9, 'C2', 'P3', 2, 1, 300),
(19, 9, 'C2', 'P4', 2, 3, 550),
(20, 9, 'C2', 'P5', 2, 6, 400),
(21, 9, 'C2', 'P1', 2, 4, 100),
(22, 10, 'C4', 'P6', 2, 3, 150),
(23, 11, 'C6', 'P3', 2, 2, 300),
(24, 11, 'C6', 'P4', 2, 3, 550),
(25, 12, 'C7', 'P1', 2, 5, 100),
(26, 12, 'C7', 'P2', 2, 3, 150),
(27, 12, 'C7', 'P3', 2, 1, 300),
(28, 13, 'C2', 'P1', 2, 4, 100),
(29, 13, 'C2', 'P3', 2, 2, 300),
(30, 14, 'C6', 'P2', 2, 6, 150),
(31, 15, 'C4', 'P6', 2, 1, 150),
(32, 16, 'C1', 'P4', 3, 6, 550),
(33, 17, 'C2', 'P5', 3, 3, 400),
(34, 18, 'C8', 'P1', 3, 6, 100),
(35, 18, 'C8', 'P3', 3, 3, 300),
(36, 18, 'C8', 'P5', 3, 5, 400),
(37, 19, 'C9', 'P2', 3, 2, 150),
(38, 20, 'C2', 'P3', 3, 3, 300),
(39, 20, 'C2', 'P1', 3, 4, 100),
(40, 20, 'C2', 'P2', 3, 1, 150);

CREATE TABLE SLS.Profit
(	
	Product VARCHAR(10),
	ProfitRatio DECIMAL(5,2)
)
INSERT INTO SLS.Profit
Values
('P1', 0.05),
('P2', 0.25),
('P3', 0.10),
('P4', 0.20),
('P5', 0.10),
('P6', 0.10);

CREATE TABLE HRS.General
(
	ID INT  PRIMARY KEY,
	Name VARCHAR(50),
	Manager VARCHAR(50),
	ManagerID int
)

INSERT INTO HRS.General
VALUES
(1, 'Ken', NULL, NULL),
(2, 'Hugo', NULL, NULL),
(3, 'James', 'Carol', 5),
(4, 'Mark', 'Morgan', 13),
(5, 'Carol', 'Alex', 12),
(6, 'David', 'Rose', 21),
(7, 'Michael', 'Markos', 11),
(8, 'Brad', 'Alex', 12),
(9, 'Rob', 'Matt', 15),
(10, 'Dylan', 'Alex', 12),
(11, 'Markos', 'Carol', 5),
(12, 'Alex', 'Ken', 1),
(13, 'Morgan', 'Matt', 15),
(14, 'Jennifer', 'Morgan', 13),
(15, 'Matt', 'Hugo', 2),
(16, 'Tom', 'Brad', 8),
(17, 'Oliver', 'Dylan', 10),
(18, 'Daniel', 'Rob', 9),
(19, 'Amanda', 'Markos', 11),
(20, 'Ana', 'Dylan', 10),
(21, 'Rose', 'Rob', 9),
(22, 'Robert', 'Rob', 9),
(23, 'Fill', 'Morgan', 13),
(24, 'Antoan', 'David', 6),
(25, 'Eddie', 'Mark', 4);


--Question 1
SELECT SUM(Quantity * UnitPrice) AS TotalSales
FROM SLS.Ahan_Sale;

--Question 2
SELECT COUNT(DISTINCT Customer) AS Total_Unique_Customers
FROM SLS.Ahan_Sale;

--Qustion 3
SELECT Product, SUM(Quantity) AS TotalQuantity
FROM SLS.Ahan_Sale
GROUP BY Product;

--Qestion 4
SELECT
    Customer,
    SUM(Quantity * UnitPrice) AS PurchaseAmount,
    COUNT(DISTINCT OrderID) AS NumberOfInvoices,
    SUM(Quantity) AS NumberOfPurchasedItems
FROM
    SLS.Ahan_Sale
GROUP BY
    Customer
HAVING
    SUM(Quantity * UnitPrice) >= 1500;

-- Question 5

SELECT
    SUM(I.Quantity * I.UnitPrice * II.ProfitRatio) AS ProfitAmount,
    SUM(I.Quantity * I.UnitPrice * II.ProfitRatio) / SUM(I.Quantity * I.UnitPrice) * 100 AS ProfitPercentage
FROM
    SLS.Ahan_Sale AS I
JOIN
    SLS.Profit AS II 
ON 
    I.Product = II.Product;

--Question 6
SELECT COUNT(DISTINCT Customer) AS TotalCustomers
FROM SLS.Ahan_Sale;

--Question 7
WITH EmployeeHierarchy AS (
    SELECT
        Id,
        Name,
        Manager,
        1 AS Level,
        Name AS HighestManager
    FROM HRS.General
    WHERE Manager IS NULL

    UNION ALL

    SELECT
        t.Id,
        t.Name,
        t.Manager,
        c.Level + 1 AS Level,
        c.HighestManager AS HighestManager
    FROM HRS.General t
    INNER JOIN EmployeeHierarchy c ON t.Manager = c.Name
)
SELECT
    r.Id,
    r.Name,
    r.Level,
    (SELECT MAX(HighestManager) FROM EmployeeHierarchy WHERE Name = r.Name) AS HighestManager
FROM EmployeeHierarchy r
ORDER BY r.Id;

