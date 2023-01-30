SELECT distinct title
FROM titles;

SELECT DISTINCT last_name, first_name
FROM employees
WHERE last_name LIKE 'e%e'
AND first_name LIKE 'e%e';

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;


SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT COUNT(*), gender
FROM employees
WHERE first_name IN('Irena','Vidya','Maya')
GROUP BY gender;

SELECT COUNT(*) AS user_count, LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username
FROM employees
GROUP BY username;

SELECT COUNT(*) AS user_count, LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username
FROM employees
GROUP by username
HAVING user_count > 2;

SELECT emp_no AS employees, round(avg(salary)) AS hist_salary
FROM salaries
GROUP BY employees;

SELECT COUNT(emp_no) AS employee_count, dept_no AS Department
FROM dept_emp
GROUP BY dept_no;

SELECT COUNT(salary), min(salary), max(salary), round(std(salary)) AS stand_dev, emp_no AS employees, round(avg(salary)) AS salary_avg
FROM salaries
GROUP BY employees;

SELECT COUNT(salary), min(salary), max(salary) AS max_salary, round(std(salary)) AS stand_dev, emp_no AS employees, round(avg(salary)) AS salary_avg
FROM salaries
GROUP BY employees
HAVING max_salary > 150000;

SELECT COUNT(salary), min(salary), max(salary) AS max_salary, round(std(salary)) AS stand_dev, emp_no AS employees, round(avg(salary)) AS salary_avg
FROM salaries
GROUP BY employees
HAVING salary_avg BETWEEN 80000 AND 90000



