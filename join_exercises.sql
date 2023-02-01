USE employees;
describe employees;
describe departments;
describe dept_emp;
describe salaries;
describe dept_manager;
describe titles;

USE join_example_db;
describe roles;
describe users;

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

SELECT departments.dept_no AS Department_Name, dept_manager.dept_no AS Department_Manager
FROM employees;
-- RIGHT JOIN departments ON dept_manager.dept_no = dept_emp.emp_no

USE employees;
-- SELECT departments.dept_no AS Department_Name, dept_manager.emp_no AS Manager
SELECT *
FROM departments
JOIN dept_manager ON employees.last_name = dept_manager.emp_no;

SELECT first_name, last_name
FROM employees
JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no;

SELECT * 
FROM dept_emp
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no;

SELECT dept_name AS Department_Name, COUNTCONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND gender = 'f';
-- GROUP BY 

SELECT DISTINCT dept_name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
-- GROUP BY Department_Manager


