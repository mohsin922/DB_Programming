Create Table EmployeesIndex(
Id int primary key identity,
[Name] varchar (50),
Email varchar(50),
Department varchar (50)
)
SET NOCOUNT ON
Declare @counter int = 1

While (@counter <= 1000000)
Begin
	Declare @Name varchar(50) = 'ABC ' + RTRIM(@counter)
	Declare @Email varchar (50) = 'abc' + RTRIM(@counter) + '@mohsin.com'
	Declare @Dept varchar (10) = 'Dept ' + RTRIM(@counter)
	Insert into EmployeesIndex values (@Name, @Email, @Dept)
	Set @counter = @counter +1
	If (@Counter%100000 = 0)
	Print RTRIM(@Counter) + ' rows inserted';
End 

-------------------------------------
-------------------------------------Indexes-------------------------------------
/*
Indexes are special data structures associated with tables or views that help speed up the query.
What is Index?
· An index is a pointer to data in a table.
· An index in a database is very similar to an index in the back of a book.
• An index helps to speed up SELECT queries and WHERE clauses.
• Indexes can be created or dropped with no effect on the data.
*/

/*
Types Of Indexes->
1)Clustered index:
> Each table has only one clustered
index because data rows can be only
sorted in one order.
> A clustered index is a special index
which physically orders the data
according to the indexed columns.
> The leaf nodes of the index store the
data for the rest of the columns in
the table.
2)Non-clustered index:
> A table may have one or more non
clustered.
> A Non Clustered index is just like the
index of a book.
> It points back to the actual page that
contains the data. (In other words, it
points back to the clustered index)
*/
Select * from EmployeesIndex where Id = 956000;     -----Uses Clustered Index on Id---

Select * from EmployeesIndex where Name = 'ABC 956000';

--------------------------Creating Non-Clustered Index on Name -----
/*
Non Clustered index
I A non-clustered index doesn't sort the physical data inside the table.
• In fact, a non-clustered index is stored at one place and table data is stored in
another place.
This is similar to a textbook where the book content is located in one place and
the index is located in another.
This allows for more than one non-clustered index per table.
*/
CREATE NONCLUSTERED INDEX IX_Employees_Name
ON [dbo].[EmployeesIndex] ([Name])
GO


Select * from EmployeesIndex where Name = 'ABC 956000';

