----------------- UNIONS -----------------  

----------------- UNIONS DISTINCT -----------------  
SELECT first_name, last_name 
FROM employee_demographics
UNION distinct
SELECT first_name, last_name
FROM employee_demographics;

----------------- UNIONS ALL -----------------  
SELECT first_name, last_name 
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_demographics;

----------------- MULTIPLE UNIONS -----------------  
 
SELECT first_name, last_name, 'OLD MAN' AS LABEL
FROM employee_demographics
WHERE AGE > 40 AND GENDER = 'MALE'
UNION 
SELECT first_name, last_name, 'OLD LADY' AS LABEL
FROM employee_demographics
WHERE AGE > 40 AND GENDER = 'FEMALE'
UNION
SELECT first_name, last_name, 'HIGHLY PAID EMPLOYEE' AS LABEL
FROM employee_SALARY
WHERE SALARY > 70000
ORDER BY first_name, last_name
;