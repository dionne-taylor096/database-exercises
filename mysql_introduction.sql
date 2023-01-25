-- INTRODUCTORY MYSQL COMMANDS
SHOW CREATE DATABASE chipotle;
USE chipotle;
SHOW tables;
SHOW CREATE TABLE orders;
SELECT DATABASE();
DESCRIBE orders;
SELECT id, id + 1 FROM orders;
SELECT id, id + 1 AS 'extra_id' FROM orders;
DESCRIBE fruits;
SELECT *
FROM fruits
ORDER BY quantity;