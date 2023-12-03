select @@global.sql_mode;



use employees;

DROP TABLE IF EXISTS departments_dup;
CREATE TABLE IF NOT EXISTS departments_dup
(
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

-- Inserting the data into department_dup table
INSERT INTO departments_dup
(
    dept_no,
    dept_name
)

-- Checking the data
SELECT * FROM departments;

-- inserting the data 
INSERT INTO departments_dup (dept_name) VALUES ('Public Relations');

Select * from departments_dup;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM departments_dup WHERE dept_no = 'd002'; 

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');


-- Inner Join


DROP TABLE IF EXISTS dept_manager_dup;

-- Createing new table 
CREATE TABLE IF NOT EXISTS dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );

INSERT INTO dept_manager_dup select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                
(999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';



-- Selecting department managemr table 

select * from dept_manager_dup order by dept_no;


-- Selecting department table 
select * from departments_dup order by dept_no;

# Find the dept_no matching values from the department_dup and dept_manager_dup table
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;


# Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, d.dept_no
FROM
    employees e
        INNER JOIN
    dept_manager d ON e.emp_no = d.emp_no
ORDER BY d.emp_no;



-- Left Join
# Find the dept_no matching values or unmaching values from the dept_manager_dup department_dup table
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;


-- Left Join
# Find the NULL VALUES	 from the dept_manager_dup department_dup table
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    d.dept_name IS NULL
ORDER BY m.dept_no;


-- Left Join
# Find the NOT  NULL VALUES	 from the dept_manager_dup department_dup table
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    d.dept_name IS NOT NULL
ORDER BY m.dept_no;


/*
Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
See if the output contains a manager with that name.  

Hint: Create an output containing information corresponding to the following fields: 
‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.
*/

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    e.last_name = 'Markovitch'

ORDER BY d.dept_no desc, e.emp_no;


-- The new and the old join syntax - exercise

/*Extract a list containing information about all managers’ 
employee number, first and last name, department number, and hire date. 
Use the old type of join syntax to obtain the result.*/

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e,
    dept_manager d
WHERE
    e.emp_no = d.emp_no
ORDER BY d.dept_no;



-- JOIN and WHERE Used Together - exercise
/*Select the first and last name, the hire date, and the job title of all employees 
whose first name is “Margareta” and have the last name “Markovitch”.
*/
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;


-- Cross Join
SELECT 
    d.*, dm.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm;
    
-- CROSS JOIN - exercise 1
/*
Use a CROSS JOIN to return a list with all possible combinations between managers 
from the dept_manager table and department number 9.
*/
SELECT 
    d.*, dm.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    dm.dept_no = 'd009'
ORDER BY d.dept_no;

-- CROSS JOIN - exercise 2
/*
Return a list with the first 10 employees with all the departments they can be assigned to.
Hint: Don’t use LIMIT; use a WHERE clause.
*/

select e.*, d.*, count(e.emp_no) as employees_count
from employees e
cross join 
departments d
where employees_count 


-- Joins with the aggregate functions
