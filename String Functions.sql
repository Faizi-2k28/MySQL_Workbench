-------------------- STRING FUNCTION --------------------- 

----------------------------- LENGTH ---------------------- 
SELECT LENGTH('SKYFALL');

SELECT FIRST_NAME, LENGTH(first_name) 
FROM recreate.employee_demographics
ORDER BY 2;

-------------------------- UPPER & LOWER -------------------------------- 
SELECT UPPER('SKY');
SELECT LOWER('SKY');

SELECT FIRST_NAME, UPPER(first_name) 
FROM employee_demographics;


----------------------------- TRIM ---------------------------------- 
SELECT RTRIM('                    SKY                   ');
SELECT LTRIM('                    SKY                   ');


----------------------------------- SUBSTRING -------------------------------- 
SELECT FIRST_NAME, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(FIRST_NAME,3,2),
BIRTH_DATE,
SUBSTRING(BIRTH_DATE,6,2) AS BIRTH_MONTH
FROM employee_demographics;


-------------------------- REPLACE ------------------------------ 
SELECT first_name, REPLACE(first_name, 'A', 'Z')
FROM employee_demographics;


----------------------------- LOCATE ----------------------------------- 
SELECT LOCATE('x', 'Alexander');

SELECT FIRST_NAME, LOCATE('An', First_name)
FROM employee_demographics;

-------------------------- CONCATINATE ------------------------- 
SELECT FIRST_NAME, Last_name,
CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME
FROM employee_demographics;
