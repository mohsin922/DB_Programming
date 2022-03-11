use DB_Programming
Go

CREATE TABLE candidates(
    CandidateID INT PRIMARY KEY IDENTITY,
    FullName VARCHAR(Max) NOT NULL
);

CREATE TABLE employees(
    EmployeeID INT PRIMARY KEY IDENTITY,
    FullName VARCHAR(Max) NOT NULL
);
-----------------------------------------------
INSERT INTO 
    candidates(FullName)
VALUES
    ('Peter Parker'),
    ('Thomas Shelby'),
    ('Walter White'),
    ('Jesse Pinkman');


INSERT INTO 
    employees(FullName)
VALUES
    ('Jack Sparrow'),
    ('Jesse Pinkman'),
    ('Michael Scott'),
    ('Peter Parker');
---------------------------------------------

SELECT  
    c.CandidateID,
    c.FullName Candidate_Name,
    e.EmployeeID,
    e.FullName Employee_Name
FROM 
    candidates c
    INNER JOIN employees e			-----Inner join produces a data set that includes rows from the left table, matching rows from the right table.
        ON e.fullname = c.fullname;

---------------------------------
SELECT  
	c.CandidateID,
	c.FullName candidate_name,
	e.EmployeeID,
	e.FullName employee_name
FROM 
	candidates c
	LEFT JOIN employees e				-----The left join returns all rows from the left table and the matching rows from the right table.
		ON e.FullName = c.FullName;		----If a row in the left table does not have a matching row in the right table, the columns of the right table will have nulls
-----------------------
SELECT  
	c.CandidateID,
	c.FullName candidate_name,
	e.EmployeeID,
	e.FullName employee_name
FROM 
	candidates c
	LEFT JOIN employees e				
		ON e.FullName = c.FullName		
WHERE 
    e.EmployeeID IS NULL; ------------------ rows that are available only in the left table but not in the right table

------------------------------------------------
SELECT  
	c.CandidateID,
	c.FullName candidate_name,
	e.EmployeeID,
	e.FullName employee_name
FROM 
	candidates c
	RIGHT JOIN employees e				
		ON e.FullName = c.FullName	
--------------------------------------
SELECT  
	c.CandidateID,
	c.FullName candidate_name,
	e.EmployeeID,
	e.FullName employee_name
FROM 
	candidates c
	FULL JOIN employees e				
		ON e.FullName = c.FullName	


SELECT  
	c.CandidateID,
	c.FullName candidate_name,
	e.EmployeeID,
	e.FullName employee_name
FROM 
	candidates c
	FULL JOIN employees e				
		ON e.FullName = c.FullName
WHERE								----To select rows that exist either left or right table, you exclude rows that are common to both tables
	e.EmployeeID IS NULL
	OR
	c.CandidateID IS NULL;

-------------------------------------------------------------------------------------------------
SELECT
	
    CandidateID,FullName
FROM
    candidates
UNION 
SELECT
    EmployeeID,
    FullName
FROM
    employees;


--------------------------------------------------------------------------------------------- 
--In other words, the cross join returns a Cartesian product of rows from both tables.

--The CROSS JOIN gets a row from the first table (T1) and then creates a new row for every row in the second table (T2). 
--It then does the same for the next row for in the first table (T1) and so on.

--if the first table has n rows and the second table has m rows, the cross join will result in n x m rows.

Select * from employeeDetails
Select * from Deparment
SELECT 
	FirstName, DepartmentName 
From 
	employeeDetails CROSS JOIN Deparment;

Select * from employeeDetails, Deparment

-----------------------------------------------------------------------------------------------------------

CREATE TABLE staffs(
    staff_id INT PRIMARY KEY IDENTITY,
    first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(100),
	phone VARCHAR(50),
	active int,
	store_id bigint NOT NULL,
	manager_id bigint
);


INSERT INTO staffs (first_name,last_name,email,phone,active,store_id,manager_id) VALUES
('Zuhaib', 'Haroon', 'zuhaib@gmail.com','9973070519',1, 1,1),
('Akilan', 'Shekhar', 'akilan@gmail.com','7706730759',1, 1,2),
('Peter', 'Parker', 'peter@gmail.com','8973070785',1, 1,2),
('Shahrukh', 'Khan', 'Shahrukh@gmail.com','9173000052',1, 2,1),
('Bruce', 'Wayne', 'Bruce@gmail.com','9973070521',1, 2,5),
('Joe', 'Denly', 'Joe@gmail.com','9973070500',1, 2,5),
('Tom', 'Cruise', 'Tom@gmail.com','9973070579',1, 3,1),
('Zubair', 'Haroon', 'zubair@gmail.com','8873070510',1, 1,7),
('Mahendra', 'Dhoni', 'Dhoni@gmail.com','9993070500',1, 1,7);

select * from staffs;
---A self join allows you to join a table to itself. It helps query hierarchical data or compare rows within the same table.

---A self join uses the inner join or left join clause. Because the query that uses the self join references the same table, the table alias is used to assign different names to the same table within the query.

SELECT
    e.first_name + ' ' + e.last_name EmployeeName,
    m.first_name + ' ' + m.last_name EmployeeManager
FROM
    staffs e
INNER JOIN staffs m ON e.staff_id = m.manager_id
ORDER BY
    EmployeeManager;

SELECT
    e.first_name + ' ' + e.last_name EmployeeName,
    m.first_name + ' ' + m.last_name EmployeeManager
FROM
    staffs e
LEFT JOIN staffs m ON e.staff_id = m.manager_id
ORDER BY
    EmployeeManager;


----Using self join to compare rows within a table
SELECT
    c1.Address,
    c1.FirstName + ' ' + c1.LastName emoloyee_1,
    c2.FirstName + ' ' + c2.LastName emoloyee_2
FROM
    employeeDetails c1
INNER JOIN employeeDetails c2 ON c1.ID > c2.ID
AND c1.Address = c2.Address
ORDER BY
    Address,
    emoloyee_1,
    emoloyee_2;