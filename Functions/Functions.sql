/*
SQL System Defined Functions:
> These are predefined or built-in functions.
> SQL Server system functions perform operations on and return information about values,
objects, and settings in SQL Server.
> Functions must return a value or result.
Functions only work with input parameters.
*/
/*
What are SQL User Defined:
UDF is a programming construct that accepts parameters, does actions and returns the
result of that action. The result either is a scalar value or result set.
• UDFS can be used in scripts, Stored Procedures, triggers and other UDF's within a
database.
• You can modify the UDF independent of the source
• They can reduce network traffic.


Types of UDFS:
1)Scalar Functions
A Scalar UDF accepts zero or more
parameters and return a single value

2)Table Valued Functions
A Table Valued UDF accepts zero or more
parameters and return a
table variable.
	a) Inline Table Valued Function:
	An Inline Table Valued Function
	contains a single statement that must
	be a SELECT statement.
	b)Multi-Statement Table Valued Function
	A Multi-Statement contains multiple
	SQL statements enclosed in BEGIN-END blocks.
*/

----------------------------------------------------------
-- HOW TO CREATE SCALER FUNCTION
--RETURN SINGLE VALUE
CREATE FUNCTION AddDigit (@num1 int, @num2 int)
RETURNS int
AS
BEGIN
Declare @result int;
Set @result=@num1+@num2;
RETURN @result
END

select dbo. AddDigit(12,4)


Select * from Student_details;

CREATE FUNCTION GetTotal (@RollNo int)
RETURNS int
AS
BEGIN
Declare @result int;
Select @result=(Marks_Science+Marks_Math+Marks_Eng) from Student_details where RollNO=@RollNo;
RETURN @result
END

select RollNo,Marks_Science,Marks_Math,Marks_Eng,dbo. GetTotal(RollNo) as Total from Student_details

CREATE FUNCTION GetAvg (@RollNo int)
RETURNS int
AS
BEGIN
Declare @result int;
Select @result=(Marks_Science+Marks_Math+Marks_Eng)/3 from Student_details where RollNO=@RollNo;
RETURN @result
END

select RollNo,Marks_Science,Marks_Math,Marks_Eng,dbo. GetTotal(RollNo) as Total,dbo. GetAvg(RollNo)  As Average from Student_details

------------------------------------------------------------------------------------------------------------------------------------

-- HOW TO CREATE TABLE VALUED FUNCTION( IT RETURNS A TABLE)
/*
AN INLINE TABLE VALUED FUNCTION CONTAINS A SINGLE STATEMENT
THAT MUST BE A SELECT STATEMENT.
THERE IS NO NEED FOR A BEGIN-END BLOCK IN AN INLINE FUNCTION.
*/
-- GET student list with marks total greater than 15e
CREATE FUNCTION GetStudentList (@total int)
RETURNS TABLE
AS
return Select * from Student_details where (Marks_Science+Marks_Math+Marks_Eng) > @total;

Select * from dbo.GetStudentList(150);

-------------------------------------------------------------------------------------------------------
/*
Multi-Statement Table Valued Function
A Multi-Statement contains multiple SQL statements enclosed in BEGIN-END blocks.
In a Multi-Statement Table valued function the return value is
declared as a table variable and includes the full structure of the table to be returned
The RETURN statement is without a value and the declared table variable is returned
*/
Create FUNCTION MulistatementGetAllstudents (@RollNO INT)
RETURNS @MarkSheet TABLE (StName VARCHAR (50), RollNO INT, Marks_Eng INT,Marks_Math INT,		
Marks_Science INT, Average DECIMAL (4, 2))
AS
BEGIN
DECLARE @Per DECIMAL (4,2);
DECLARE @StName Varchar(100);
SELECT @StName=Student_Name FROM Student_details WHERE RollNo=@ROllNO
SELECT @Per=((Marks_Science+Marks_Math+Marks_Eng)/3) FROM Student_details WHERE RollNo=@RollNO
INSERT INTO @MarkSheet (StName, RollNO, Marks_Eng, Marks_Math, Marks_Science, Average)
SELECT @StName, RollNO, Marks_Eng, Marks_Math, Marks_Science,@Per FROM Student_details WHERE RollNo=@RollNO
RETURN
END

Select * from dbo.MulistatementGetAllstudents(1);
