-------------------------- SUBQUERIES -----------------------------
-- A SUNQUERY BASICALLY A QUERY WITH IN ANOTHER QUERY --  

 -------------------- SUBQUERIES ON WHERE STATEMENT ------------------- 
SELECT * 
FROM employee_demographics
WHERE EMPLOYEE_ID IN 
				(SELECT EMPLOYEE_ID
					FROM EMPLOYEE_SALARY
                    WHERE DEPT_ID = 1)
;

-------------------- SUBQUERIES ON SELECT & FROM STATEMENT ------------------- 
SELECT first_name, SALARY, 
(SELECT avg(SALARY)
FROM EMPLOYEE_SALARY)
FROM employee_salary;

SELECT GENDER, AVG(AGE), MAX(AGE), MIN(AGE), COUNT(AGE)
FROM employee_demographics
GROUP BY GENDER;

SELECT AVG(MAX_AGE)
FROM
(SELECT GENDER, AVG(AGE) AS AVG_AGE, MAX(AGE) AS MAX_AGE, MIN(AGE) AS MIN_AGE, COUNT(AGE)
FROM employee_demographics
GROUP BY GENDER) AS AGG_TABLE;