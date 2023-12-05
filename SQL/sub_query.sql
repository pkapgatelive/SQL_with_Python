# get first name nand last name of employee number that can be found in the department manager table
use employees;

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
-- HAVING e.first_name = 'Arie'
ORDER BY e.first_name , e.last_name;


-- SQL Subqueries with IN nested inside WHERE - exercise
-- Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.
select* from employees limit 10;

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            e.emp_no
        FROM
            employees e
        WHERE
            e.hire_date BETWEEN '1990-01-01' AND '1995-01-01');