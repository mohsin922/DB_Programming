/*
Trigger is an Even-driven T-SQL Programming Block.
It runs automatically when a particular Event occurs.
UPDATE, DELETE, INSERT -> -> DML Command -> DML TRIGGER
CREATE,ALTER, DROP ->DDL Command -> DDL TRIGGER
*/
Select * from Student_details;

/********* Audit Table ***************/
CREATE TABLE Student_Audit
(RollNO INT ,
Inserted_By Varchar (100)
)
GO

/****** TRIGGER for INSERT Event
***************/
CREATE trigger TRG_insert_Audit
ON Student_details
FOR INSERT
AS
BEGIN
	declare @RollNO int
	SELECT @RollNO = RollNO from inserted
	insert into Student_Audit (RollNO, Inserted_By)
	values (@RollNO, ORIGINAL_LOGIN())
	PRINT 'insert trigger executed'
END
GO

Select * from Student_details;
Select * from Student_Audit;
Insert Into Student_details Values(11,'Zuhaib','12th',95,78,90);
DROP trigger TRG_insert_Audit

/**** TRIGGER for DELETE Event ***************/
create trigger TRG_Delete_Rule
ON Student_details
FOR DELETE
AS
BEGIN
	Rollback
	PRINT '**************';
	PRINT 'You can not delete records from this table';
	PRINT '**************';
END
GO

Delete From Student_details; -----It will not be able to drop any record from Table.
							------It will RollBack And The batch will be aborted.
---------------------------------------------------------------------------------------------
/*************** DDL TRIGGER******/
CREATE TRIGGER Trg_DB_Programming
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
	ROLLBACK
	PRINT 'You are not allowed to create tables'
END

Create Table ABC(ID int);   ---The transaction ended in the trigger. The batch has been aborted.

/****** LIST All Triggers**/
select * from sys.triggers;
----------------------------------
/****** Find the discription of Trigger*************/

SELECT * FROM sys.sql_modules
WHERE Object_ID = Object_id('TRG_Delete_Rule')
GO

/********DISABLE / ENABLE TRIGGER ************/

DISABLE TRIGGER TRG_Delete_Rule ON Student_details
GO
ENABLE TRIGGER TRG_Delete_Rule ON Student_details
GO

/******** REMOVE TRIGGER*******/
DROP TRIGGER TRG_Delete_Rule
GO
DROP TRIGGER TRG_Insert_Rule
GO
