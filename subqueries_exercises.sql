SELECT *
FROM employees;

-- Find all the current employees with the same hire date as employee 101010 using a subquery.

SELECT first_name, last_name, hire_date
FROM employees
WHERE employees.hire_date IN 
(
    SELECT employees.hire_date
    FROM employees
    WHERE employees.emp_no = '101010'
);
-- Find all the titles ever held by all current employees with the first name Aamod.

SELECT title
FROM titles
WHERE emp_no = (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);

SELECT g.first_name, titles.title
FROM
(
    SELECT *
    FROM employees
    WHERE first_name = 'Aamod'
) as g
JOIN titles USING (emp_no)
WHERE to_date > NOW()