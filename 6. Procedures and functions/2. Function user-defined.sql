--Function without parameters

CREATE FUNCTION GetEmployeeCount()
RETURNS int
AS
BEGIN
    DECLARE @empCount int;
    SELECT @empCount = COUNT(*) FROM EMPLOYEE;
    RETURN @empCount;
END

SELECT dbo.GetEmployeeCount()

BEGIN
    DECLARE @count int
    SET @totaCount = dbo.GetEmployeeCount()
    PRINT @count
END

--Scalar Function with parameters

CREATE FUNCTION GetEmployeeByDeptCount (@deptId int)
RETURNS int
BEGIN
    DECLARE @totaCount int
    SET @totaCount = (SELECT Count(*) FROM EMPLOYEE WHERE DepartmentId = @deptId)
    RETURN @totaCount
END

SELECT dbo.GetEmployeeByDeptCount(2)


--Inline table valued functions

CREATE FUNCTION GetEmployeeByDept (@deptId int)
RETURNS TABLE
AS
RETURN (SELECT * FROM EMPLOYEE WHERE DepartmentId = @deptId)


SELECT * FROM dbo.GetEmployeeByDept(2)
SELECT * FROM dbo.GetEmployeeByDept(2) ORDER BY FirstName


--Multi statement table valued functions

CREATE FUNCTION mstvGetEmployeeByDept (@deptId int)
RETURNS @empTable TABLE (id int, name varchar(50), email varchar(50))
BEGIN
    INSERT INTO @empTable
    SELECT Id, FirstName, Email FROM EMPLOYEE WHERE DepartmentId = @deptId
    RETURN
END

SELECT * FROM dbo.mstvGetEmployeeByDept(2)