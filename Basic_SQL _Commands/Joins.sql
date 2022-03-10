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
-----------------------------------
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
---------------------------------

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