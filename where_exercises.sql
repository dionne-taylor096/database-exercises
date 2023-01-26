-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
-- Enter a comment with the number of records returned. 709 records
SELECT *
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya');
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
-- Enter a comment with the number of records returned. 249 Does it match number of rows from Q2? No 
SELECT *
FROM employees
WHERE first_name = 'Irena' OR 'Vidya' OR 'Maya';
-- first_name = 'Irena' OR
-- first_name = 'Vidya' OR
-- first_name = 'Maya';
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
-- Enter a comment with the number of records returned. 441 records returned.
SELECT *
FROM employees
WHERE gender = 'm' AND (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya');
-- Find all current or previous employees whose last name starts with 'E'. 
-- Enter a comment with the number of employees whose last name starts with E. 7330 names start with E.
SELECT *
FROM employees
WHERE last_name LIKE 'e%';
-- Find all current or previous employees whose last name starts or ends with 'E'. 
-- Enter a comment with the number of employees whose last name starts or ends with E. 30723
-- How many employees have a last name that ends with E, but does not start with E? 23393
SELECT *
FROM employees
WHERE last_name LIKE '%e' OR last_name LIKE 'e%';
-- last_name LIKE 'e%e';
SELECT *
FROM employees
WHERE last_name LIKE '%e' AND last_name NOT LIKE 'e%';

-- Find all current or previous employees employees whose last name starts and ends with 'E'. 
-- Enter a comment with the number of employees whose last name starts and ends with E. 899
-- How many employees' last names end with E, regardless of whether they start with E? 24292

SELECT *
FROM employees
WHERE last_name LIKE 'e%' AND last_name LIKE '%e';

SELECT *
FROM employees
WHERE last_name LIKE '%e';
-- Find all current or previous employees hired in the 90s. 
-- Enter a comment with the number of employees returned.  135214
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- hire_date LIKE '199%';
-- Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned. 842 records
-- 
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';
-- Find all current or previous employees hired in the 90s and born on Christmas. 
-- Enter a comment with the number of employees returned. 362
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25';
-- Find all current or previous employees with a 'q' in their last name. 
-- Enter a comment with the number of records returned. 1873
SELECT *
FROM employees
WHERE last_name LIKE '%q%';
-- Find all current or previous employees with a 'q' in their last name but not 'qu'. 
-- How many employees are found? 547
SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
