-- AFTER triggers

--For insert

CREATE TRIGGER tr_order_insert
ON ORDERS
after insert
as
begin
	select * from inserted
end


CREATE TRIGGER tr_order_insert
ON ORDERS
after insert
as
begin
	DECLARE @order_id INT
    SELECT @order_id = inserted.OrderId FROM inserted

    PRINT 'New order has been inserted. Order ID: ' + CAST(@order_id AS VARCHAR(10))
end


--For update

CREATE TRIGGER tr_order_update
ON ORDERS
after update
as
begin
	select * from deleted
	select * from inserted
end

UPDATE ORDERS set OrderAmount = 200.00 where OrderId = 4

--For delete

CREATE TRIGGER tr_order_delete
ON ORDERS
after delete
as
begin
	select * from deleted
end


CREATE TRIGGER tr_order_delete_rollback
ON ORDERS
for delete
as
begin
	Rollback
	print 'You can not delete record';
end


-- Copy table

CREATE TABLE ORDER_Audit
(
 auditId int IDENTITY(1,1),
 auditInfo varchar(200)
)

SELECT * FROM ORDER_Audit

--For insert

CREATE TRIGGER tr_order_insert_audit
ON ORDERS
after insert
as
begin
	Declare @id int
	SELECT @id = id from inserted
	
	INSERT INTO ORDER_Audit VALUES ('ORDERS Id '+ Cast(@id as varchar(50)) + ' is added' + Cast(GETDATE() as varchar(50) ))
end


INSERT INTO ORDERS VALUES ('Arif', 'Male',10, 3000)
SELECT * FROM ORDER_Audit


--For update

CREATE TRIGGER tr_order_update_audit
ON ORDERS
after update
as
begin
	Declare @id int
	Declare @old_OrderDate datetime, @new_OrderDate datetime
	Declare @old_CustomerId int, @new_CustomerId int
	Declare @old_OrderAmount money, @new_OrderAmount money

	Declare @audit_string varchar(100)
	set @audit_string = ''

	select @id = OrderId,
		   @new_OrderDate = OrderDate,
		   @new_CustomerId = CustomerId,
		   @new_OrderAmount = OrderAmount
	from inserted

	select @old_OrderDate = OrderDate,
		   @old_CustomerId = CustomerId,
		   @old_OrderAmount = OrderAmount
	from deleted
	

	if @old_OrderDate != @new_OrderDate
		set @audit_string = @audit_string + 'Order date changed from ' + 
		convert(varchar, @old_OrderDate, 101) + ' to ' + convert(varchar, @new_OrderDate, 101) + '; '

	if @old_CustomerId != @new_CustomerId
		set @audit_string = @audit_string + 'Customer ID changed from ' + 
		convert(varchar, @old_CustomerId) + ' to ' + convert(varchar, @new_CustomerId) + '; '
	
	if @old_OrderAmount != @new_OrderAmount
		set @audit_string = @audit_string + 'Order amount changed from ' + 
		convert(varchar, @old_OrderAmount, 1) + ' to ' + convert(varchar, @new_OrderAmount, 1) + '; '

	if len(@audit_string) > 0
		insert into ORDER_Audit values('Order ' + convert(varchar, @id) + ' : ' + @audit_string)

end


--For delete

CREATE TRIGGER tr_order_delete_Audit
ON ORDERS
after delete
as
begin
	Declare @id int
	SELECT @id = id from deleted
	
	INSERT INTO ORDER_Audit VALUES ('ORDERS Id '+ Cast(@id as varchar(50)) + ' is deleted' + Cast(GETDATE() as varchar(50) ))
end


--Instead of insert

CREATE TRIGGER tr_GetEmployeeByDept_insteadof_insert
ON GetEmployeeByDept
INSTEAD OF INSERT
as
begin
	DECLARE @dept_id int
    SELECT @dept_id = Id FROM DEPARTMENT JOIN inserted 
	ON inserted.Name = DEPARTMENT.Name

	if(@dept_id IS NULL)
	begin
		RAISERROR ('Error! Invalid dept. name', 16, 1)
		RETURN
	end

    INSERT INTO EMPLOYEE (FirstName, Email, Phone, City, HireDate, Salary, DepartmentId)
	select FirstName, Email, Phone, City, HireDate, Salary, @dept_id from inserted

end


INSERT INTO GetEmployeeByDept VALUES ('Sean', 'sw@example.com', '555-1257', 'Miami', '2002-01-07', 25000.00, 'Finance')