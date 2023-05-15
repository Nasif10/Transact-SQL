--Create a Database
CREATE DATABASE ShopManagement
USE ShopManagement

--Rename Database
ALTER database ShopManagement modify Name = ShopDb

Use ShopDb
GO

--Drop Database
DROP DATABASE ShopDb

--Create a new table
CREATE TABLE CUSTOMER
(
CustomerId int PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Email varchar(50) NOT NULL,
Phone varchar(11) NULL,
City varchar(200) NULL,
AreaCode int NULL
)


INSERT INTO CUSTOMER (CustomerId, FirstName, LastName, Email, Phone, City, AreaCode)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', '555-555-1234', 'New York', 212);

SELECT * FROM CUSTOMER

--Drop Table
DROP TABLE customer


--Rename table
sp_rename 'CUSTOMER', 'CUSTOMERS';

--Add Column
ALTER TABLE CUSTOMER 
ADD CustomerSince date

--Modify Column
ALTER TABLE CUSTOMER
ALTER COLUMN CustomerSince datetime

--DROP Column
ALTER TABLE CUSTOMER
DROP COLUMN CustomerSince

--TRUNCATE Table 
TRUNCATE TABLE CUSTOMER


--Temporary tables

CREATE TABLE #Person (
    Id int,
    name VARCHAR(MAX),
    age int
);

INSERT INTO #Person VALUES (1, 'John', 'johndoe@example.com'), (2, 'Alice', 'alicejohnson@example.com');

SELECT * FROM #Person

--Re runnable scripts

