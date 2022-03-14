--------------Stored Procedures---------------------------------
-----Stored Procedure is Database Object
------SP is a Series of Declarative Sql Statements
------Its's Stored In Database and can be reused over and over again.
-------SQL creates execution plan  and stores it in Cache.
-------Parameters can be passed to SP.So that it can act on Passed Parameters.
Select * from employeeDetails where Gender= 'M';

----How to Create Stored Procedure---
CREATE PROCEDURE spEmployeeInfo
AS
BEGIN
Select * from employeeDetails where Gender= 'M';
End

spEmployeeInfo
EXECUTE spEmployeeInfo
EXEC spEmployeeInfo
--------------------------------------
CREATE PROC spEmployeeInfo2
AS
BEGIN
Select * from employeeDetails where Gender= 'F';
End

spEmployeeInfo2
--------------------------------------------------

---Update SP------
ALTER Proc spEmployeeInfo
AS
BEGIN
Select * from employeeDetails where Gender= 'M';
Select * from  employeeDetails where Salary > 400000;
End

spEmployeeInfo

-----------------------------------------------------------------

----Drop SP----

DROP Proc spEmployeeInfo2

spEmployeeInfo2

----------------------------------------------------------------

----Parameters in Stored Procedure
----Parameters are three Types : Input And Output Parameter And Default Parameter.


ALTER Proc spEmployeeInfo
@Gender char(1),
@FirstName varchar(Max)
AS
BEGIN
Select * from employeeDetails where Gender = @Gender;
Select * from  employeeDetails where FirstName = @FirstName;
End

spEmployeeInfo 'M','Preksha'
spEmployeeInfo @FirstName = 'Mohsin', @Gender ='M' -----Named Parameter value.Order Doesn't Matter here


ALTER Proc spEmployeeInfo
@Gender char(1) ='M',
@FirstName varchar(Max) = 'Mohsin'			-----Default Parameters.
AS
BEGIN
Select * from employeeDetails where Gender = @Gender;
Select * from  employeeDetails where FirstName = @FirstName;
End

spEmployeeInfo 'F', 'Arun'

--------------------------------------------------------
---Output Parameter
Create Proc spAddNumbers
@N1 INT,
@N2 INT,
@Add INT OUTPUT
AS
BEGIN
	SET @Add = @N1 + @N2;
END

Declare @Result INT
EXEC spAddNumbers 10,20, @Add = @Result OUTPUT;
SELECT @Result AS Addition;

---------------------------------------------
---SP security with Encryption
sp_helptext spAddNumbers

Alter Proc spAddNumbers
@N1 INT,
@N2 INT,
@Add INT OUTPUT
WITH ENCRYPTION
AS
BEGIN
	SET @Add = @N1 + @N2;
END

----------------------------------------------------------------------------------------------------------
Alter PROCEDURE spEmployeeInfo2
AS
BEGIN
Select * from employees where FullName = 'Peter Parker'
End

Drop Proc spEmployeeInfo2
spEmployeeInfo2