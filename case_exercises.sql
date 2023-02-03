-- Write a query that returns all employees, their department number, 
-- their start date, their end date, and a new column 'is_current_employee' 
-- that is a 1 if the employee is still with the company and 0 if not.

SELECT dept_emp.emp_no, 
	   dept_no,
       hire_date AS start_date,
	   to_date,
       IF(to_date = '9999-1-1', True, False) AS is_current_employee
FROM dept_emp
JOIN employees USING (emp_no);

-- Write a query that returns all employee names (previous and current),
-- and a new column 'alpha_group' that returns 'A-H', 
-- 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT 
	last_name,
	CASE 
		WHEN substr(last_name, 1, 1) BETWEEN 'a' AND 'h' THEN 'A-H Group'
        WHEN substr(last_name, 1, 1) BETWEEN 'i' AND 'q' THEN 'I-Q Group'
        WHEN substr(last_name, 1, 1) BETWEEN 'r' AND 'z' THEN 'R-Z Group'
		ELSE 'Others'
	END AS alpha_group
FROM employees
ORDER BY last_name;
-- How many employees (current or previous) were born in each decade?

SELECT 
	birth_date, emp_no,
	COUNT(CASE WHEN birth_date BETWEEN '1950-1-1' AND '1960-1-1' THEN '50s' END) AS older_folks,
	COUNT(CASE WHEN birth_date BETWEEN '1960-1-1' AND '1970-1-1' THEN '60s' END) AS old_folks
FROM employees
GROUP BY emp_no
ORDER BY emp_no;

SELECT 
	COUNT(CASE WHEN birth_date BETWEEN '1950-1-1' AND '1960-1-1' THEN '50s' END) AS older_folks,
	COUNT(CASE WHEN birth_date BETWEEN '1960-1-1' AND '1970-1-1' THEN '60s' END) AS old_folks
FROM employees;

-- What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
