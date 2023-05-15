BEGIN
	PRINT 'Hello World!';
END

--Declare variables

DECLARE @name VARCHAR(10);
SET @name = 'ABC'
print @name

BEGIN
	DECLARE @name VARCHAR(20) = 'John';
    DECLARE @age int = 30;
    print @name + ' ' +CAST(@age AS VARCHAR)
END

BEGIN
	DECLARE @name VARCHAR(20);
    DECLARE @age int;

    SELECT @name = FirstName, @age = Age FROM CUSTOMER WHERE CustomerId = 1;
    print @name + ' ' +CAST(@age AS VARCHAR)
END

-- -- --

DECLARE @name VARCHAR(10) = 'David'

SELECT * FROM CUSTOMER WHERE Name = @name

--variable in LIKE operator
DECLARE @name VARCHAR(10) = '%him'
SELECT * FROM CUSTOMER WHERE Name LIKE @name