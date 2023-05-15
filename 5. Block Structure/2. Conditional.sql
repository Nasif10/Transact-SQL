DECLARE 
    @num int = 10;
BEGIN
    if @num > 5
        PRINT 'Greater Than 5';
END

--

DECLARE 
    @num int = 10;
BEGIN
    if (@num % 2) = 0
        print 'Even';
    else
        print 'Odd';
END

--

DECLARE 
    @num int = 10;
BEGIN
    SELECT Id, FirstName, Salary,
        CASE 
            WHEN Salary > 50000 THEN 'High'
            WHEN Salary > 30000 THEN 'Medium'
            ELSE 'Low'
        END AS SalaryRange
    FROM EMPLOYEE
END