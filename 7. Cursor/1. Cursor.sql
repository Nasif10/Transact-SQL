DECLARE @emp_id int
DECLARE @emp_name varchar(30)

DECLARE c_emp CURSOR FOR 
  SELECT id, FirstName FROM EMPLOYEE;

OPEN c_emp

FETCH NEXT FROM c_emp INTO @emp_id, @emp_name
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ID : ' + CAST(@emp_id as varchar) + ' Name : ' + @emp_name
    FETCH NEXT FROM c_emp INTO @emp_id, @emp_name
END

CLOSE c_emp;
DEALLOCATE c_emp;


--  --  --  --


DECLARE @emp_id int
DECLARE @emp_salary varchar(30)

DECLARE c_empSalaryIncrease CURSOR FOR 
    SELECT id, Salary FROM EMPLOYEE;

OPEN c_empSalaryIncrease

FETCH NEXT FROM c_empSalaryIncrease INTO @emp_id, @emp_salary
WHILE @@FETCH_STATUS = 0
BEGIN
    if(@emp_salary < CAST(50000 as decimal(10,2)))
    UPDATE EMPLOYEE set Salary = Salary * 1.1 WHERE Id = @emp_id

    FETCH NEXT FROM c_empSalaryIncrease INTO @emp_id, @emp_salary
END

CLOSE c_empSalaryIncrease
DEALLOCATE c_empSalaryIncrease