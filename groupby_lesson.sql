-- GROUPBY --

SELECT item_name, quantity
FROM orders
WHERE item_name LIKE '%chicken%'
GROUP BY item_name, quantity
ORDER BY item_name;


-- AGRREGATE FUNCTIONS --
SELECT item_name, MAX(quantity), COUNT(item_name)
FROM orders
WHERE item_name LIKE '%chicken%'
GROUP BY item_name;

SELECT distinct(item_name), id
FROM orders;


-- HAVING --
-- Find all order items that have been ordered over 100 times
-- Use HAVING after GROUP BY --
SELECT item_name, count(item_name) as count_items
FROM orders
where item_name LIKE '%chicken%'
GROUP BY item_name
having count_items > 100;
