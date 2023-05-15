CREATE VIEW GetEmployeeExceptSalary
AS
SELECT Id, FirstName, LastName, Email, Phone, City, HireDate, DepartmentId FROM EMPLOYEE

SELECT * FROM GetEmployeeExceptSalary

--

CREATE VIEW GetEmployeeByDept
AS
SELECT FirstName, Email, Phone, City, HireDate, Salary, DEPARTMENT.Name
FROM EMPLOYEE LEFT JOIN DEPARTMENT
ON EMPLOYEE.DepartmentId = DEPARTMENT.Id

SELECT * FROM GetEmployeeByDept

--

CREATE VIEW GetEmployeeByMarketing
AS
SELECT FirstName, Email, Phone, City, Salary, DEPARTMENT.Name
FROM EMPLOYEE LEFT JOIN DEPARTMENT
ON EMPLOYEE.DepartmentId = DEPARTMENT.Id
WHERE DEPARTMENT.Name = 'Marketing'

SELECT * FROM GetEmployeeByMarketing


-- Updatable views

UPDATE GetEmployeeExceptSalary SET City = 'Houston' WHERE Id = 1

DELETE FROM GetEmployeeExceptSalary WHERE Id = 2
SET IDENTITY_INSERT Employee ON
INSERT INTO GetEmployeeExceptSalary VALUES (11, 'Sean', 'William', 'sw@example.com', '555-1257', 'Miami', '2002-01-07', 4)