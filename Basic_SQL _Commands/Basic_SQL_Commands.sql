-------Welcome to DB Programming----------

---Create DataBase Db Programming

CREATE DATABASE DB_Programming
Go

---TO Display all Databases
exec sp_databases
Go

--For using Particular Database
USE DB_Programming
Go

--------------------------------------------

---Creating Table inside the Database Db Programming
Create table employeeDetails
(
   Id int identity primary key,
   FirstName varchar(Max) Not null,
   LastName varchar(Max) Not null,
   Gender char(1) Not null default 'M',
   Address varchar(MAX)  default 'Kashmir',
   PhoneNumber bigint,
   Salary money default 1000,
   StartDate DateTime default GetDate()
)
---For Displaying Table Fields
exec sp_help employeeDetails
select * from employeeDetails

-----------------------------------------------------

---Inserting values Inside the Table
INSERT INTO employeeDetails(FirstName,LastName,Gender,Address,PhoneNumber,Salary,StartDate) VALUES
('Mohsin','Zahoor','M','Kashmir',7004567892,500000.00,GETDATE()),
('Raj','Kumar','M','Coimbatore',8545697841,200000.00,GETDATE()),
('Abdul','Raouf','M','Ladakh',9905687941,300000.00,GETDATE()),
('Preksha','Arunachalam','F','Delhi',8806456878,400000.00,GETDATE()),
('Zuhaib','Haroon','M','Kashmir',7706567896,220000.00,GETDATE()),
('Lampny', 'Jacobs','F','Chennai',9978456215,440000.00,GETDATE()),
('Ajith','Natarajan','M','Trichi',8806789678,220000.00,GETDATE()),
('Arun','Shankar','M','Pollachi',9978034578,490000.00,GETDATE()),
('Soliha','Bashir','F','Bangalore',9906786548,330000.00,GETDATE())

------------------------------------------------------
----Display all rows and Columns inside Table----- 
select * from employeeDetails



--------------------------------------------------------

---Update Table Rows--

UPDATE employeeDetails SET LastName='Devaraj' WHERE FirstName= 'Ajith'
Go

---------------------------------------------------------------------

----Delete Particular Row from Table

DELETE FROM employeeDetails WHERE FirstName='Ajith'
Go

Select * from employeeDetails
Go

---------------------------------------------------------------------

---Select Queries----
----Sorting the result set by Where Clause
-----filter rows based on one or more conditions
---From->Where->Select

SELECT
    *
FROM
    employeeDetails
WHERE
    Address = 'Kashmir';
-------------------------------------
---To sort the result set based on one or more columns
----ORDER BY clause sorts the customers by their first names in ascending order.
----FROM->WHERE->SELECT->ORDER BY.
SELECT
    *
FROM
    employeeDetails
WHERE
    Gender = 'M'
ORDER BY
    FirstName;   ---by default sorts by ASC order

SELECT
    FirstName
FROM
    employeeDetails
ORDER BY
	FirstName DESC     ---Descending order


SELECT
    Address,
    FirstName,
    LastName
FROM
    employeeDetails
ORDER BY
    Address DESC,
    FirstName ASC;


SELECT
    FirstName,
    LastName
FROM
    employeeDetails
ORDER BY
    LEN(FirstName) DESC;

-----------------------------------------------------------------------------------------------------
----OFFSET FETCH clauses to limit the number of rows returned by a query.---
-----The OFFSET and FETCH clauses are the options of the ORDER BY clause---
----must use the OFFSET and FETCH clauses with the ORDER BY clause.----

SELECT
    *
FROM
    employeeDetails
ORDER BY
    FirstName
OFFSET 4 ROWS;
------------------
SELECT
    *
FROM
    employeeDetails
ORDER BY
    FirstName
OFFSET 4 ROWS
FETCH NEXT 2 ROWS ONLY;
-------------------------
SELECT
    *
FROM
    employeeDetails
ORDER BY
    FirstName
OFFSET 0 ROWS
FETCH First 5 ROWS ONLY;

--------------------------------------------------------------------
----SELECT TOP clause allows you to limit the number of rows or percentage of rows returned in a query result set.
----- SELECT TOP statement is always used in conjunction with the ORDER BY clause

SELECT TOP 5
    *
FROM
    employeeDetails
ORDER BY 
    FirstName DESC;

SELECT TOP 1 PERCENT   ----The PERCENT keyword indicates that the query returns the first N percentage of rows
    *
FROM
    employeeDetails
ORDER BY 
    FirstName DESC;

SELECT TOP 3 WITH TIES  ----The WITH TIES allows you to return more rows with values that match the last row in the limited result set. 			
    *
FROM
    employeeDetails
ORDER BY 
    Salary DESC;
-----Note that WITH TIES may cause more rows to be returned than you specify in the expression.


--------------------------------------------------------------------------------------------------------------------------------------
--- SELECT DISTINCT clause to retrieve the only distinct values in a specified list of columns. Avoids the Duplicate values
---DISTINCT clause treats all NULL “values” as the same value and displays a single null to avoid duplication.
---Both DISTINCT and GROUP BY clause reduces the number of returned rows in the result set by removing the duplicates.
---However, you should use the GROUP BY clause when you want to apply an aggregate function on one or more columns.

SELECT DISTINCT
	Gender
FROM
	employeeDetails;


SELECT DISTINCT
	Gender,
	Address
FROM
	employeeDetails;


SELECT 
	Gender,Address
FROM 
	employeeDetails
GROUP BY 
	Gender,Address
ORDER BY
	Gender,Address

------------------------------------------------------------------------------------------------------------------------------------------
---To get the rows from the table that satisfy one or more conditions, you use the WHERE clause.
----logical expression is often called a predicate.
SELECT
    *
FROM
    employeeDetails
WHERE
    Address = 'Kashmir' AND Gender = 'M'
ORDER BY
    Salary DESC;


SELECT
    *
FROM
    employeeDetails
WHERE
    Salary > 400000 AND Gender = 'M'
ORDER BY
    FirstName DESC;


SELECT
    *
FROM
    employeeDetails
WHERE
    Salary > 400000 OR Gender = 'M'  ---if any condition satisfies,it will display their result set
ORDER BY
    FirstName DESC;


SELECT
    *
FROM
    employeeDetails
WHERE
    Salary BETWEEN 300000 AND 500000   ---Finding rows with the value between two values(Between Operator)
ORDER BY
    FirstName DESC;


SELECT
    *
FROM
    employeeDetails
WHERE
    Salary In (330000.00,500000.00,440000.00)   ---Finding rows that have a value in a list of values and it's alternative to multiple or conditions					
ORDER BY										----eg Salary = 330000 or Salary = 500000 or Salary = 440000(IN OPerator)
    FirstName DESC;

--------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
    *
FROM
    employeeDetails
WHERE
    Address LIKE '%Kashmir%'   ---Finding rows whose values contain a string(Logical Operator
ORDER BY
    FirstName DESC;

SELECT
    *
FROM
    employeeDetails
WHERE
    Address LIKE '%r'   ---whose last character ends with 'r'
ORDER BY
    FirstName DESC;

SELECT
    *
FROM
    employeeDetails
WHERE
    Address LIKE 'B%'   ---whose first character starts with 'B' ---% matches any sequence of characters
ORDER BY
    FirstName DESC;

SELECT
    *
FROM
    employeeDetails
WHERE
    Address LIKE 'B%re'   ---whose first character starts with 'B' and last character ends with 'er'---% matches any sequence of characters
ORDER BY
    FirstName DESC;

SELECT
    *
FROM
    employeeDetails
WHERE
    Address LIKE '_a%'   ---whose second character is 'a' 
ORDER BY
    FirstName DESC;

SELECT
    *
FROM
    employeeDetails
WHERE
    Address LIKE '[KC]%'   ---starts with K or C. Similarly [A-Z]% will determine Range for first character.
ORDER BY					----'[^A-X]%' will Display Address which doesnt include A to X characters in Starting
    FirstName DESC;

-------------------------------------------------------------------------------------------------------------
--IS NOT NULL is used to check if There is NO NUll inside a column
--IS NULL is used to check Null Values inside a Column.
SELECT
    *
FROM
    employeeDetails
WHERE
    Salary IS NOT NULL
ORDER BY
    FirstName,
    LastName;

------------------------------------------------------------------------
----SQL Server always evaluates the AND operators first.
----However, you can change the order of evaluation by using parentheses.
SELECT
    *
FROM
    employeeDetails
WHERE
    (Salary =490000  OR Salary = 500000)
AND Gender = 'M'
ORDER BY
    FirstName;

---------------------------------------------------------------------------
----In Operator is also used as a SubQuery
SELECT
    FirstName
FROM
    employeeDetails
WHERE
    Id IN (
        SELECT
            Id
        FROM
            employeeDetails
        WHERE
            Gender = 'M'
    )
ORDER BY
    FirstName;
-----------------------------------------------------------------------------------------------------------------------------------------
SELECT
    FirstName + ' ' + LastName AS 'Full Name'		------Full Name is used as an Alias here to give Column Name.We can do it with or without AS keyword.
FROM
    employeeDetails
ORDER BY
    FirstName;

SELECT
    FirstName + ' ' + LastName  'Full Name'		------Full Name is used as an Alias here to give Column Name.We can do it with or without AS keyword.
FROM											---In ORDER BY we can use Alias Name or Column Name.
    employeeDetails
ORDER BY
    FirstName;


-------------------------------------------------------------------------------------------------------------------------------------------
----To group rows into groups, you use the GROUP BY clause.
----FROM->WHERE->GROUP BY->SELECT->ORDER BY.
SELECT
    Gender,
    COUNT (*) AS Count
FROM
    employeeDetails
GROUP BY
    Gender
ORDER BY
    Gender;

-------------------------------------------
----To filter groups based on one or more conditions, you use the HAVING clause.

SELECT
    Gender,
    COUNT (*)
FROM
    employeeDetails
GROUP BY
    Gender
HAVING
    COUNT (*) > 4
ORDER BY
    Gender;


----WHERE clause filters rows while the HAVING clause filters groups

-----------------------------------------------------------------------------------

Create Table Deparment (
DeptID int Primary Key,
DepartmentName varchar(MAX),
ID int FOREIGN KEY REFERENCES employeeDetails(ID)
)
Select * from Deparment


Insert into Deparment (DeptID,DepartmentName,ID) VALUES
(1,'CSE',1),
(2,'MECH',2),
(3,'CSE',3),
(4,'ECE',4),
(5,'ECE',5),
(6,'CSE',6),
(7,'MECH',8),
(8,'MECH',9);








