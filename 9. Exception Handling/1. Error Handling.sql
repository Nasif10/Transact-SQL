--Raise Error

UPDATE CUSTOMER set CITY = 'Houston' where CustomerId = 0
IF @@ROWCOUNT<1
    RAISERROR ('Customer not found', 16, 0)

UPDATE CUSTOMER set CITY = 'Houston' where CustomerId = 0
IF @@ROWCOUNT<1
    THROW 50001, 'Customer not found', 1  


--TRY CATCH Block

BEGIN TRY    
    SELECT 1/0;  
END TRY  

BEGIN CATCH   
    SELECT ERROR_MESSAGE();
END CATCH;  

--

BEGIN TRY    
    UPDATE CUSTOMERS set Age = 'qwe' where CustomerId = 2; 
END TRY  

BEGIN CATCH   
    SELECT ERROR_MESSAGE() 
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine;
END CATCH;  