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

------------------------------------------------

----To group rows into groups, you use the GROUP BY clause.
----FROM->WHERE->GROUP BY->SELECT->ORDER BY.
SELECT
    Gender,
    COUNT (*)
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


