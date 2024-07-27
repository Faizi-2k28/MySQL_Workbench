----------------------- CASE STATEMENTS --------------------------------
----- A Case statement allows you to add logic in your select statement sort of like if-else statement. ----  

SELECT FIRST_NAME,
LAST_NAME,
AGE,
CASE
	WHEN AGE <= 30 THEN 'YOUNG'
    WHEN AGE BETWEEN 31 AND 50 THEN 'OLD'
    WHEN AGE>=50 THEN "ON DEATH'S DOOR"
END AS AGE_BRACKET
FROM employee_demographics;

-- PAY INCREASE AND BONUS
-- < 50000 = 5% 
-- > 50000 = 7%
-- FINANCE = 10% BONUS

SELECT FIRST_NAME,LAST_NAME, SALARY,
CASE
	WHEN SALARY < 50000 THEN SALARY + (SALARY * 0.05)
    WHEN SALARY > 50000 THEN SALARY + (SALARY * 0.07)
    END AS NEW_SALARY, 
CASE
	WHEN DEPT_ID = 6 THEN SALARY * .10  
END AS BONUS
FROM EMPLOYEE_SALARY;


SELECT *
FROM employee_salary;

SELECT *
FROM parks_department;
