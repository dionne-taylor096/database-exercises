SELECT *
FROM employees;

-- Find all the current employees with the same hire date as employee 101010 using a subquery.

select *
from employees
where emp_no = '101010';

select *
from employees
	join dept_emp
		using (emp_no)
where to_date > now()
and hire_date = 
	(
    select hire_date
	from employees
	where emp_no = '101010'
	)
;

-- Find all the titles ever held by all current employees with the first name Aamod.

SELECT distinct g.first_name, titles.title
FROM
(
    SELECT *
    FROM employees
    WHERE first_name = 'Aamod'
) as g
JOIN titles USING (emp_no)
WHERE to_date > NOW();

select emp_no
from employees
where first_name = 'Aamod';

select title, count(*) as cnt
from dept_emp
	join titles
		using (emp_no)
where dept_emp.to_date > now()
and emp_no in 
	(
	select emp_no
	from employees
	where first_name = 'Aamod'
	)
group by title;

-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code. 240124

SELECT COUNT(emp_no)
FROM employees
WHERE emp_no NOT IN
(
    SELECT emp_no
    FROM dept_emp
    WHERE to_date > NOW()
);

select emp_no
from dept_emp 
where to_date > now();

select emp_no, max(to_date) as max_date
from employees
	join dept_emp
		using (emp_no)
where emp_no not in 
	(
    select emp_no
	from dept_emp 
	where to_date > now()
    )
group by emp_no
order by max_date desc
;

-- real answer: 59,900
select count(emp_no)
from employees
where emp_no not in 
	(
    select emp_no
	from dept_emp 
	where to_date > now()
    )
;

-- Find all the current department managers that are female. List their names in a comment in your code. Isamu, Karsten, Leon, Hilary

SELECT first_name, last_name, hire_date, to_date, gender
FROM
(
    SELECT *
    FROM employees
    WHERE gender = 'f'
) as j
JOIN dept_manager USING (emp_no)
WHERE to_date > NOW();

select emp_no
from dept_manager
where to_date > now();

select first_name, last_name, gender
from employees
where gender = 'F'
	and emp_no in 
		(
        select emp_no
		from dept_manager
		where to_date > now()
        )
;

-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT emp_no, salary
FROM salaries 
WHERE to_date = '9999-1-1' and salary > (SELECT round(avg(salary)) FROM salaries)
GROUP BY salary, emp_no;

select avg(salary)
from salaries;

select first_name, last_name, salary, to_date
from salaries
	join employees
		using (emp_no)
where to_date > now()
and salary > 
	(
    select avg(salary)
	from salaries
    )
order by salary
;

-- How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?


SELECT STD(salary) FROM salaries;

SELECT emp_no, salary, STDDEV(salary)
FROM salaries 
WHERE to_date = '9999-1-1' and salary > ((SELECT round(avg(salary), STDDEV(salary)) FROM salaries))
GROUP BY salary, emp_no;

SELECT MAX(salary) FROM salaries WHERE to_date > NOW(); -- 158220
SELECT STDDEV(salary) FROM salaries WHERE to_date > NOW(); -- 17309.95
SELECT (MAX(salary) - STDDEV(salary)) FROM salaries; -- 141315.17
SELECT STDDEV(salary) FROM salaries WHERE to_date > NOW();
SELECT COUNT(salary); -- 210 employees
 
SELECT salary
FROM salaries 
WHERE salary BETWEEN '141315.17' and  '158220';

select max(salary)
from salaries
where to_date > now();

select stddev(salary)
from salaries
where to_date > now();

select count(*)
from salaries
where to_date > now()
and salary > 
	(
	( -- max salary
    select max(salary)
	from salaries
	where to_date > now()
    )
    -
    ( -- one standard deviation 
    select stddev(salary)
	from salaries
	where to_date > now()
    )
    )
; -- 83 returned salaries

-- What percentage of all salaries is this?

select 
(
select count(*)
from salaries
where to_date > now()
and salary > 
	(
	( -- max salary
    select max(salary)
	from salaries
	where to_date > now()
    )
    -
    ( -- one standard deviation 
    select stddev(salary)
	from salaries
	where to_date > now()
    )
    )
)
/ 
(
select count(*) from salaries where to_date > now()
) * 100
;
