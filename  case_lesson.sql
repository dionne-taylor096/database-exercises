-- use chipotle;
SELECT *
FROM orders 
LIMIT 10;

SELECT item_name
FROM orders
LIMIT 10;

DESCRIBE orders;
DESCRIBE field(item_name);

SELECT item_name
FROM orders
LIMIT 200;

SELECT item_name
FROM orders
WHERE item_name LIKE '%chicken%';


-- IF (<truth_condition>, <value if case if true>, <value if case is false>) AS alias
SELECT item_name, IF(item_name LIKE '%chicken%', 1, 0) AS chicken_type
FROM orders
LIMIT 25;

SELECT IF(item_name LIKE '%steak%', 'steak thing', 'not steak') AS steak_col
FROM orders
LIMIT 10;

SELECT IF(item_name LIKE '%steak%',
IF(item_name LIKE '%bowl%', 'steak bowl', 'other steak item'),
'not steak') AS steal_col
FROM orders;

-- STRUCTURE OF a CASE STATEMENT:

SELECT item_name, quantity,
CASE item_name
	WHEN 'chicken bowl' THEN 1
    ELSE 0
END AS chicken_bowls
FROM orders;

SELECT item_name, quantity,
CASE item_name
	WHEN 'chicken bowl' THEN 'bowl'
    WHEN 'chicken burrito' THEN 'burrito'
    ELSE 'not chicken or pollo'
END AS chicken_bowls
FROM orders;

-- CASE STATEMENTS EXAMPLE SYNTAX --
/* SELECT
    CASE column_a
        WHEN condition_a THEN value_1
        WHEN condition_b THEN value_2
        ELSE value_3
    END AS new_column_name
FROM table_a; */


SELECT item_name, quantity,
CASE
	WHEN item_name LIKE '%chicken%' THEN 'chicken type'
    WHEN item_name LIKE '%steak%' THEN 'steak type'
    ELSE 'other thing'
END AS 'meat check'
FROM orders;

SELECT *
FROM users;

SELECT role_id;
use employees;
SELECT
    dept_name,
    COUNT(CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END) AS 'Senior Engineer',
    COUNT(CASE WHEN title = 'Staff' THEN title ELSE NULL END) AS 'Staff',
    COUNT(CASE WHEN title = 'Engineer' THEN title ELSE NULL END) AS 'Engineer',
    COUNT(CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END) AS 'Senior Staff',
    COUNT(CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END) AS 'Assistant Engineer',
    COUNT(CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END) AS 'Technique Leader',
    COUNT(CASE WHEN title = 'Manager' THEN title ELSE NULL END) AS 'Manager'
FROM departments
JOIN dept_emp
    ON departments.dept_no = dept_emp.dept_no AND dept_emp.to_date > CURDATE()
JOIN titles
    ON dept_emp.emp_no = titles.emp_no AND titles.to_date > CURDATE()
GROUP BY dept_name
ORDER BY dept_name;
