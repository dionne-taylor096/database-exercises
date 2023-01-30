-- SELECT *
-- DESCRIBE employees (int, date, varchar, enum)
-- Which table(s) do you think contain a numeric type column? Salaries
-- Which table(s) do you think contain a string type column? Employees, Departments, Dept_Manager, Dept_Emp, Titles
-- Which table(s) do you think contain a date type column? Dept_emp, Dept_manager, Employees, Salaries, Titles
-- What is the relationship between the employees and the departments tables? Dept_no, Emp_no (fK stored in Dept_Manager)
-- SHOW CREATE TABLE dept_manager;
-- 'CREATE TABLE `dept_manager` (\n  `emp_no` int NOT NULL,\n  `dept_no` char(4) NOT NULL,\n  `from_date` date NOT NULL,\n  `to_date` date NOT NULL,\n  PRIMARY KEY (`emp_no`,`dept_no`),\n  KEY `dept_no` (`dept_no`),\n  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,\n  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT\n) ENGINE=InnoDB DEFAULT CHARSET=latin1'
-- WHERE, LIMIT, AND OTHER CLAUSES
-- LIMIT
SELECT *
FROM fruits LIMIT 5;
SELECT *
FROM employees LIMIT 15;
SELECT *
FROM fruits_db.name;
SELECT *
FROM employees
WHERE gender = 'm';
select quantity
from fruits 
where name = 'apple';
SELECT *
FROM fruits
WHERE name LIKE '%fruit';
SELECT *
FROM fruits
WHERE name IN ('apple','dragonfruit');
SELECT * 
FROM fruits
WHERE name IN ('apple','dragonfruit')
OR name LIKE '%apple'