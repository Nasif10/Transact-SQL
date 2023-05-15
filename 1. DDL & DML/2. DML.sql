CREATE DATABASE ShopDb
USE ShopDb

CREATE TABLE CUSTOMERS
(
    CustomerId int IDENTITY(1,1) PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Email varchar(50) NOT NULL UNIQUE,
    Phone varchar(10),
    Age int NOT NULL,
    City varchar(50) DEFAULT 'New York'
)

CREATE TABLE PRODUCTS (
    ProductId int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100),
    Description text,
    Price decimal(10,2)
)

CREATE TABLE ORDERS
(
    OrderId int IDENTITY(1,1) PRIMARY KEY,
    OrderDate datetime NOT NULL,
    CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMERS(CustomerId),
    OrderAmount money NULL
) 

CREATE TABLE ORDER_ITEMS (
    OrderItemId INT IDENTITY(1,1) PRIMARY KEY,
    OrderId int FOREIGN KEY REFERENCES ORDERS(OrderId),
    ProductId int FOREIGN KEY REFERENCES PRODUCTS(ProductId),
    Quantity int NOT NULL,
    Price decimal(10,2) NOT NULL
)

--INSERT
INSERT INTO CUSTOMERS (FirstName, LastName, Email, Phone, Age, City) VALUES
('John', 'Doe', 'johndoe@example.com', '555-1234', 30, 'New York'),
('Jane', 'Smith', 'janesmith@example.com', '555-5678', 25, 'Los Angeles'),
('Bob', 'Johnson', 'bobjohnson@example.com', '555-4321', 40, 'Chicago'),
('Emily', 'Davis', 'emilydavis@example.com', NULL, 25, 'Los Angeles'),
('Samantha', 'Lee', 'samlee@example.com', NULL, 50, 'New York');

INSERT INTO PRODUCTS (Name, Description, Price) VALUES 
('T-Shirt', 'Cotton t-shirt in black', 19.99),
('Jeans', 'Blue denim jeans', 49.99),
('Sneakers', 'White canvas sneakers', 29.99),
('Sunglasses', 'Black sunglasses with polarized lenses', 59.99)

INSERT INTO ORDERS (OrderDate, CustomerId, OrderAmount) VALUES 
('2023-05-13 10:00:00', 1, 59.97),
('2023-05-13 11:00:00', 2, 79.98),
('2023-05-13 12:00:00', 3, 89.97),
('2023-05-14 13:00:00', 1, 59.99)

INSERT INTO ORDER_ITEMS (OrderId, ProductId, Quantity, Price) VALUES 
(1, 1, 2, 19.99),
(1, 2, 1, 49.99),
(2, 2, 1, 49.99),
(2, 3, 1, 29.99),
(3, 3, 3, 29.99),
(4, 4, 1, 59.99)
	 
-- -- --

CREATE TABLE DEPARTMENT (
    Id int IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
)

CREATE TABLE EMPLOYEE
(
    Id int IDENTITY(1,1) PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50),
    Email varchar(50) NOT NULL,
    Phone varchar(20) NULL,
    Gender varchar(20),
    City varchar(200) NULL DEFAULT 'Washington',
    DateOfBirth date NOT NULL,
    HireDate date NOT NULL,
    Salary decimal(10,2) NOT NULL,
    DepartmentId int,
    FOREIGN KEY (DepartmentId) REFERENCES DEPARTMENT(Id)
)

INSERT INTO DEPARTMENT (Name) VALUES
('Finance'),('Marketing'),('HR'),('IT'),('Operations');


INSERT INTO EMPLOYEE (FirstName, LastName, Email, Phone, Gender, DateOfBirth, HireDate, Salary, DepartmentId) VALUES ('John', 'Doe', 'johndoe@email.com', '555-1234', 'Male', '1990-01-01', '2020-01-01', 50000.00, 1),
('Jane', 'Doe', 'janedoe@email.com', '555-5678', 'Female', '1992-05-10', '2009-06-01', 55000.00, 1),
('Bob', 'Smith', 'bobsmith@email.com', NULL, 'Male', '1985-12-25', '2019-01-15', 65000.00, 1),
('Sarah', 'Johnson', 'sarahj@email.com', '555-2468', 'Female', '1988-08-18', '2002-01-01', 70000.00, 2),
('Mike', 'Brown', 'mikebrown@email.com', '555-1357', 'Male', '1995-02-22', '2020-01-01', 60000.00, 2),
('Emily', 'Davis', 'emilyd@email.com', '555-7890', 'Female', '1991-11-11', '2021-07-01', 55000.00, 2),
('Tom', 'Wilson', 'tomwilson@email.com', '555-3691', 'Male', '1993-09-15', '2022-05-01', 65000.00, 3),
('Grace', 'Lee', 'gracelee@email.com', NULL, 'Female', '1997-04-30', '2023-06-01', 60000.00, 4),
('Chris', 'Nguyen', 'chrisnguyen@email.com', '555-8520', 'Male', '1986-06-05', '2020-01-01', 75000.00, 4),
('David', 'Lopez', 'dl@example.com', '555-3698', 'Male', 'Miami', '1993-02-10', '2022-01-09', 42500.00, NULL),
('Jenny', 'Wang', 'jennywang@email.com', '555-9517', 'Female', '1994-02-14', '2022-09-01', 55000.00, NULL);


--UPDATE

UPDATE CUSTOMERS set City = 'Miami' where CustomerId = 2

UPDATE CUSTOMERS SET City = 'Houston', Phone = '555-2234' WHERE CustomerID = 1;

UPDATE CUSTOMERS set City = 'Houston' where CustomerId = 1 or CustomerId = 3

UPDATE CUSTOMERS set Phone = '555-1111'    


--DELETE

DELETE FROM CUSTOMERS where CustomerId = 2

DELETE FROM CUSTOMERS WHERE FirstName = 'Jane'

DELETE FROM CUSTOMERS