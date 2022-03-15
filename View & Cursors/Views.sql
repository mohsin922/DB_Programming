/*
	We can create view using CREATE VIEW STATEMENT.
	A VIEW can be created from a single table or Multiple Tables.
*/

Select  * from employeeDetails;

Create VIEW empInfo
AS
Select  * from employeeDetails;

Select  * from empInfo;

sp_helptext 'empInfo'

-------
Alter VIEW empInfo
AS
Select  FirstName,Gender,Address from employeeDetails;

Select  * from empInfo;
-----------
Drop view empInfo

----------------
select * from Deparment;
Select * from employeeDetails;

----Creating View Table from Two Tables
Create VIEW empInfo
AS
Select  e.FirstName, e.Gender, e.Address, d.DepartmentName  from 
employeeDetails e
JOIN
Deparment d
ON e.Id = d.ID;

Select  * from empInfo;

---Update the Meta Data Of a Sql View

Alter VIEW empInfo
AS
Select  *  from 
employeeDetails;

Alter Table employeeDetails Add Country varchar(MAX);

Select  * from empInfo;
exec sp_refreshview empInfo

------------------------------
-------SCHEMA BINDING SQL VIEW
ALTER TABLE EmployeeDetails Drop Column Country;
Select  * from empInfo;
exec sp_refreshview empInfo

Create VIEW empInfoWithSchemaBinding
WITH SCHEMABINDING
AS
Select  FirstName,Gender,Address  from 
dbo.employeeDetails;
ALTER TABLE EmployeeDetails Drop Column Gender; ---We wont be able to Alter these Column these Columns also  like changing their size.

----------------------------------------------------------

---Hide Complexity of Query
---Row Level Security
----Column Level Security

Create View RowLvl
AS
Select * from employeeDetails where Salary > 300000;

Select * from RowLvl;

Create View ColLvl
AS
Select FirstName,Gender,Address,Salary from employeeDetails;

Select * from ColLvl;

------------------------------------------------------------------------
--------
/*
		Updating Views
				WE CAN USE DML OPERATION ON SINGLE TABLE ONLY
				VIEW SHOULD NOT CONTAIN GROUP BY , DISTINCT, HAVING CLAUSES.
				WE CANNOT USE SUBQUERY IN A VIEW IN SQL SERVER.
				WE CANNOT USE SET OPERATORS IN SQL VIEW.
		DELETE FROM VIEW
		INSERT INTO VIEW
*/
CREATE VIEW DEMO
AS
SELECT * FROM employeeDetails;

SELECT * FROM DEMO;
INSERT INTO DEMO( FirstName,LastName,Gender,Address,PhoneNumber,Salary,StartDate,JOB_ROLE) 
VALUES
('PETER','PARKER','M','BRIMINGHAM',8798700458,440000,GetDate(),'Snr Developer');

DELETE FROM DEMO WHERE FirstName='PETER';
UPDATE DEMO SET LastName='Bhat' WHERE FirstName='Muntazir';
--------------------------------------------------------------------------------------
-----With Check OPtion--
Create view DemoWithCheckOption
AS
Select * from employeeDetails where Address = 'Kashmir'
With Check Option

Select * from DemoWithCheckOption;

Insert Into DemoWithCheckOption Values( 'Peter','Parker','M','US',99778855412,250000,GETDATE(),'Jnr Developer');



