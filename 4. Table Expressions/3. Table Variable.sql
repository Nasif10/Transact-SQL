DECLARE @var_Person_table TABLE (
    Id int,
    name VARCHAR(MAX),
    age int
);

INSERT INTO @var_Person_table (Id, name, age)
VALUES (1, 'John', 30), (2, 'Sarah', 25);

SELECT * FROM @var_Person_table
SELECT Id, name FROM @var_Person_table

--  --  --

DECLARE @var_employeeCountByDept TABLE (
    DepartmentId int,
    Total int
);

INSERT @var_employeeCountByDept
SELECT DepartmentId, COUNT(*) FROM EMPLOYEE WHERE DepartmentId IS NOT NULL 
GROUP BY DepartmentId

SELECT DepartmentId, Total FROM @var_employeeCountByDept


--Derived tables

SELECT DepartmentId, Total FROM (
    SELECT DepartmentId, COUNT(*) AS Total FROM EMPLOYEE WHERE DepartmentId IS NOT NULL 
    GROUP BY DepartmentId
) AS EmployeeCountByDept


--Common Table Expressions

WITH EmployeeCountByDept 
AS (
    SELECT DepartmentId, COUNT(*) AS Total FROM EMPLOYEE WHERE DepartmentId IS NOT NULL 
    GROUP BY DepartmentId
)

SELECT DepartmentId, Total FROM EmployeeCountByDept

SELECT DepartmentId, Total FROM EmployeeCountByDept WHERE Total >= 2