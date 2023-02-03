
-- JOIN/INNER JOIN --
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;
-- LEFT JOIN --
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
-- RIGHT JOIN --
SELECT name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
-- JOIN w/AGGREGATE FUNCTION --
SELECT COUNT(users.name) AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY role_name;

USE employees;

-- Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department, along with the name of the current manager for that department.

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ',last_name) AS 'Department Manager'
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE to_date = '9999-1-1'
ORDER BY dept_name;

-- Find the name of all departments currently managed by women.

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ',last_name) AS 'Department Manager'
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE to_date = '9999-1-1' AND gender = 'f'
ORDER BY dept_name;

-- Find the current titles of employees currently working in the Customer Service department.

USE employees;
SELECT distinct(title) AS 'Title', COUNT(title) AS 'Count'
FROM titles
JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE titles.to_date = '9999-1-1' AND dept_name = 'Customer Service'
GROUP BY title
ORDER BY title ASC;

-- Find the current salary of all current managers.

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ',last_name) AS 'Department Manager', salary AS 'Salary'
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN salaries ON dept_manager.emp_no = salaries.emp_no
WHERE salaries.to_date = '9999-1-1' AND dept_manager.to_date = '9999-1-1' 
ORDER BY dept_name;

-- USE employees;

-- Find the number of current employees in each department.
SELECT departments.dept_no, dept_name, count(emp_no) AS num_employees
FROM departments
RIGHT JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
WHERE to_date = '9999-1-1'
GROUP BY dept_no
ORDER BY dept_no;

-- Which department has the highest average salary? Hint: Use current not historic information.

SELECT distinct (dept_name), avg(salary) AS 'avg_salary'
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
WHERE salaries.to_date = '9999-1-1' AND dept_emp.to_date = '9999-1-1' 
GROUP BY dept_name
ORDER BY avg_salary DESC LIMIT 1;

-- Who is the highest paid employee in the Marketing department?

SELECT first_name, last_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
WHERE salaries.to_date = '9999-1-1' AND dept_emp.to_date = '9999-1-1' AND departments.dept_name = 'Marketing'
ORDER BY salary DESC LIMIT 1;

-- Which current department manager has the highest salary?

SELECT first_name, last_name, salary, dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
JOIN dept_manager ON dept_emp.emp_no = dept_manager.emp_no
WHERE salaries.to_date = '9999-1-1' AND dept_manager.to_date = '9999-1-1'
ORDER BY salary DESC LIMIT 1;

-- Determine the average salary for each department. Use all salary information and round your results.

SELECT dept_name, round(avg(salary)) AS 'avg_salary'
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
WHERE salaries.to_date = '9999-1-1' AND dept_emp.to_date = '9999-1-1' 
GROUP BY dept_name
ORDER BY avg_salary DESC;

-- BONUS: Find the names of all current employees, their department name, and their current manager's name.
SELECT * 
FROM employees
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
RIGHT JOIN dept_manager USING (emp_no)
RIGHT JOIN employees AS Dept_Mng ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date > NOW() and dept_emp.to_date > NOW()
ORDER BY employees.last_name LIMIT 1;