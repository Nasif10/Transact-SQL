CREATE PROCEDURE GetAllEmployees
AS
SELECT * FROM EMPLOYEE;

-- Execute Procedure

EXEC GetAllEmployee

GetAllEmployee


-- Procedure with input parameters

CREATE PROCEDURE GetAllEmployeesByDept
@deptId int 
AS
SELECT * FROM EMPLOYEE WHERE DepartmentId = @deptId;

EXEC GetAllEmployeesByDept 2


CREATE PROCEDURE GetAllEmployeesByDeptAndCity
@deptId int, 
@city varchar(20) 
AS
SELECT * FROM EMPLOYEE WHERE DepartmentId = @deptId AND City = @city;

EXEC GetAllEmployeesByDeptAndCity 2, 'Chicago'
EXEC GetAllEmployeesByDeptAndCity @city='Chicago', @deptId=2 


-- ALTER Procedure

ALTER PROCEDURE GetAllEmployeesByDept
@deptId int = NULL
AS
IF @deptId IS NULL
    SELECT * FROM EMPLOYEE
ELSE    
    SELECT * FROM EMPLOYEE WHERE DepartmentId = @deptId ORDER BY FirstName;

EXEC GetAllEmployeesByDept 2


-- Procedure with output parameters

CREATE PROCEDURE ReturnAllEmployeesCountByDept
@deptId int,
@eCount int OUTPUT
AS
SELECT @eCount = Count(*) FROM EMPLOYEE WHERE DepartmentId = @deptId;

DECLARE @count int
EXEC GetAllEmployeesCountByDept 2, @count OUTPUT
PRINT @count


-- Procedure with return values

CREATE PROCEDURE ReturnAllEmployeesCountByDept
@deptId int
AS
Return (SELECT Count(*) FROM EMPLOYEE WHERE DepartmentId = @deptId)

DECLARE @count int
EXEC @count = GetAllEmployeesCountByDept 2
PRINT @count