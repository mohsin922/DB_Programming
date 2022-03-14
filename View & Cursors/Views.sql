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


