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

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT CHECK (Age >= 0 AND Age <= 99),
    Phone int
);

CREATE TABLE SubTable AS
SELECT CustomerID, CustomerName
FROM customer;


----------------------------------------
-- Insertando datos en tabla customer --
----------------------------------------

INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','1234567890'),
       (2, 'Aman ', 'Chopra', 'Australia','21','1234567890'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','1234567890'),
       (4, 'Aditya', 'Arpan', 'Austria','21','1234567890'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','1234567890');


-------------------------------------------------
-- Seleccionando datos de la tabla customer --
-------------------------------------------------

SELECT CustomerName, LastName FROM Customer;
SELECT CustomerName, Country FROM Customer;
