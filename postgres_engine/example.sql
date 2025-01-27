------------------------
-- Creando las tablas --
------------------------

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT CHECK (Age >= 0 AND Age <= 99),
    Phone VARCHAR(15)
);

CREATE TABLE SubTable (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-----------------------------
-- Insertando datos en Customer --
-----------------------------

INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES 
    (1, 'Shubham', 'Thakur', 'India', 23, '1234567890'),
    (2, 'Aman', 'Chopra', 'Australia', 21, '1234567890'),
    (3, 'Naveen', 'Tulasi', 'Sri Lanka', 24, '1234567890'),
    (4, 'Aditya', 'Arpan', 'Austria', 21, '1234567890'),
    (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain', 22, '1234567890');

-------------------------------------------------
-- Insertando datos en SubTable desde Customer --
-------------------------------------------------

INSERT INTO SubTable (CustomerID, CustomerName)
SELECT CustomerID, CustomerName
FROM Customer;

-------------------------------------------------
-- Seleccionando datos de la tabla Customer --
-------------------------------------------------

SELECT CustomerName, LastName 
FROM Customer;

