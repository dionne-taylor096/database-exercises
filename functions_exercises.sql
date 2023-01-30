SELECT UPPER (CONCAT(first_name,' ',last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

SELECT first_name, last_name, hire_date, DATEDIFF(hire_date,CURDATE())AS days_at_company
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

SELECT MIN(salary), MAX(salary)
FROM salaries
WHERE to_date = '9999-01-01';


SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_',SUBSTR(birth_date, 3, 7)))AS username, first_name, last_name, birth_date, lpad(month(birth_date), 2, 0)
FROM employees;
   
SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username, first_name, last_name, birth_date
FROM employees;

SELECT UPPER (CONCAT(first_name,' ',last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';