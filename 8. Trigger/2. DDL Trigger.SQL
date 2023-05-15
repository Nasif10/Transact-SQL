--DDL triggers

CREATE TRIGGER tr_table_create
ON DATABASE
FOR CREATE_TABLE
as
begin
	print 'New table created'
end

-- -- --

CREATE TRIGGER tr_table_cad
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
	print 'Created or Altered or Dropped a table'
end

CREATE TABLE test(id int)
DROP TABLE test


--Rename triggers

CREATE TRIGGER tr_table_rename
ON DATABASE
FOR RENAME
as
begin
	print 'Renamed table or column'
end

sp_rename 'test', 'test_new'


--Reverting changes

CREATE TRIGGER tr_table_rollback
ON DATABASE
FOR ALTER_TABLE, DROP_TABLE
as
begin
    Rollback
	print 'Cant Alter or Drop table'
end

DROP TABLE test


--Disabling/enabling trigger

DISABLE TRIGGER tr_table_rollback ON DATABASE; 
ENABLE TRIGGER tr_table_rollback ON DATABASE;
DROP TRIGGER tr_table_rollback ON DATABASE;
