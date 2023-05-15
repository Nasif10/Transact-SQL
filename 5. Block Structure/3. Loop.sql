BEGIN
    DECLARE @num int = 1,
        @firstName VARCHAR(20);

    WHILE @num <= 5 
    BEGIN
        SELECT @firstName = FirstName FROM CUSTOMER 
        WHERE CustomerId =  @num;

        PRINT @firstName;
        SET @num += 1;
    END
END

--

DECLARE 
    @i int = 1;
BEGIN   
    WHILE (@i <= 10)
    BEGIN
        IF (@i = 6)
        BEGIN
            BREAK;
        END
        
        PRINT 'The value of i is: ' + CAST(@i AS varchar);
        SET @i = @i + 1;
    END
END