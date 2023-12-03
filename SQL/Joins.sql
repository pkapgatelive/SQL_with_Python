-- Active: 1700521783060@@127.0.0.1@3306
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
