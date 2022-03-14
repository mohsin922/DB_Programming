----------------SQL Server LOOPS------
------While LOOP---------------

DECLARE @count INT;
SET @count = 1;
While @count <= 10
BEGIN
	Print @count;
	SET @count = @count + 1;
END
Print 'End Of While Loop'


DECLARE @count INT;
DECLARE @TableNO INT;
SET @count = 1;
SET @TableNO = 10;
while @count <=10
BEGIN
	Print concat(@TableNo,'x', @count, '=', @TableNO * @count);
	SET @count = @count + 1;
End
Print 'End Of While Loop'


DECLARE @count INT;
DECLARE @TableNO INT;
SET @count = 1;
SET @TableNO = 10;
while @count <=10
BEGIN
	Print concat(@TableNo,'x', @count, '=', @TableNO * @count);
	SET @count = @count + 1;
	if @count =5
	break;
End
Print 'End Of While Loop'

--------NESTED WHILE LOPP
DECLARE @TableNO INT;
SET @TableNO = 2;
while @TableNO <=10
BEGIN
	DECLARE @count int =1;
	while @count <=10
	Begin
		Print concat(@TableNo,'x', @count, '=', @TableNO * @count);
		SET @count = @count + 1;
	End
SET @TableNO = @TableNO + 1;
End
Print 'End Of NESTED Loop'

--------------------------------------------------------------------------------
----------Case Statements-------------
-----Case Statement in Select Statement-----
Select *,
JOB_ROLE =
Case
	WHEN Salary > 490000 THEN 'HR'
	WHEN Salary > 400000 AND Salary <= 490000 THEN 'Snr Developer'
	WHEN Salary >=200000 AND Salary <= 400000 THEN 'Jnr Developer'
	Else 'No Role'
End
from employeeDetails

------------------------
select * from employeeDetails;

Alter Table employeeDetails
Add JOB_ROLE varchar(Max);

-----Case Statement inside Update Statement
Update employeeDetails Set JOB_ROLE =
Case
	WHEN Salary > 490000 THEN 'HR'
	WHEN Salary > 400000 AND Salary <= 490000 THEN 'Snr Developer'
	WHEN Salary >=200000 AND Salary <= 400000 THEN 'Jnr Developer'
	Else 'No Role'
End

----Case Statement inside Insert Statement
Declare @Gender char(1)
Set @Gender=1;
Insert Into employeeDetails(FirstName,LastName,Gender,Address,PhoneNumber,Salary,StartDate,JOB_ROLE)
VALUES('Muntazir','Mehdi', CASE WHEN @Gender =1 THEN 'M' else 'F' End,'Kashmir',8675964876,440000,GETDATE(),'Snr Developer');

---Case Statement in Order BY Statement
Select * from employeeDetails
ORDER BY 
CASE WHEN (Select Count(gender) from employeeDetails where Gender ='M') >=5 THEN Address
Else
FirstName
END

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

---If Else Condition Statement-----------------------
DECLARE @RollNo int;
DECLARE @ENGLISH INT;
DECLARE @MATHS INT;
DECLARE @SCIENCE INT;
DECLARE @TOTAL INT;
DECLARE @PERCENTAGE INT;
---INITILIAZE VARIABLSES
SET @RollNo = 101;
SET @ENGLISH = 80;
SET @MATHS = 70;
SET @SCIENCE = 90;
SET @TOTAL = @ENGLISH+@MATHS+@SCIENCE;
SET @PERCENTAGE = @TOTAL/3;

	PRINT Concat('RollNo: ',@RollNo);
	PRINT Concat ('Total: ',@TOTAL);
	PRINT Concat('Percentage: ',@PERCENTAGE);

IF @PERCENTAGE > 80
BEGIN
	PRINT 'GRADE A';
END
ELSE IF @PERCENTAGE > 60 AND @PERCENTAGE <=80 
BEGIN
	PRINT 'GRADE B';
END
ELSE IF @PERCENTAGE > 40 AND @PERCENTAGE <= 60
BEGIN
	PRINT 'GRADE C';
END
ELSE
BEGIN
	PRINT 'FAIL';
END

-----------------------------------
SELECT * FROM employeeDetails;

IF EXISTS (SELECT Address from employeeDetails where Address ='Kashmir')
BEGIN
	PRINT 'ADDRESS EXISTS';
END
ELSE
BEGIN
	PRINT ' ADDRESS DOESNOT EXIST ';
END




