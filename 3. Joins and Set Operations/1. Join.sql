USE EmpDb

SELECT * FROM EMPLOYEE JOIN DEPARTMENT
ON EMPLOYEE.DepartmentId = DEPARTMENT.Id

SELECT o.OrderDate, c.FirstName, c.LastName, o.OrderAmount
FROM CUSTOMERS c JOIN ORDERS o 
ON c.CustomerId = o.CustomerId

--INNER JOIN

SELECT * FROM EMPLOYEE INNER JOIN DEPARTMENT
ON EMPLOYEE.DepartmentId = DEPARTMENT.Id

SELECT * FROM ORDERS INNER JOIN CUSTOMERS
ON ORDERS.CustomerId = CUSTOMERS.CustomerId

--LEFT JOIN

SELECT * FROM EMPLOYEE LEFT JOIN DEPARTMENT
ON EMPLOYEE.DepartmentId = DEPARTMENT.Id

SELECT CUSTOMERS.CustomerId , FirstName, Email, OrderAmount, OrderID, OrderDate  FROM 
CUSTOMERS LEFT JOIN ORDERS
ON CUSTOMERS.CustomerId = ORDERS.CustomerId

--RIGHT JOIN

SELECT * FROM EMPLOYEE RIGHT JOIN DEPARTMENT
ON EMPLOYEE.DepartmentId = DEPARTMENT.Id

SELECT * FROM CUSTOMERS RIGHT JOIN ORDERS
ON CUSTOMERS.CustomerId = ORDERS.CustomerId


--FULL JOIN

SELECT * FROM EMPLOYEE FULL JOIN DEPARTMENT
ON EMPLOYEE.DepartmentId = DEPARTMENT.Id

SELECT * FROM CUSTOMERS FULL JOIN ORDERS
ON CUSTOMERS.CustomerId = ORDERS.CustomerId

-- -- --

CREATE TABLE emp
(
Id int IDENTITY(1,1) PRIMARY KEY,
name varchar(50) NOT NULL,
salary int NOT NULL,
managerId int
)

INSERT INTO emp (name, salary, managerId) VALUES 
('John', 20000, NULL),('Bob', 50000, NULL),('William',30000, 2),('Emily', 25000, 2),('David',  60000, 1)

--Self JOIN 

SELECT e1.name as 'Employee Name', e2.name as 'Manager Name'
FROM emp e1 LEFT JOIN emp e2
ON 	e1.managerId = e2.Id

--Replace NULL

SELECT e1.name as 'Employee Name', ISNULL(e2.name, 'No Manager')  as 'Manager Name'
FROM emp e1 INNER JOIN emp e2
ON 	e1.managerId = e2.Id