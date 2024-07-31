-------------------- CTE-> COMMON TABLE EXPRESSION -------------------- 

WITH CTE_EXAMPLE AS
(
SELECT gender, avg(salary) AVG_SAL, MAX(SALARY) MAX_SAL, MIN(SALARY) MIN_SAL, COUNT(SALARY) COUNT_SALARY
FROM employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
SELECT *
FROM CTE_EXAMPLE
;

----------------- USING SUBQUERY ---------------------- 
SELECT AVG(AVG_SAL) 
FROM (SELECT gender, avg(salary) AVG_SAL, MAX(SALARY) MAX_SAL, MIN(SALARY) MIN_SAL, COUNT(SALARY) COUNT_SALARY
FROM employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
) EXAMPLE_SUBQUERY
; 


WITH CTE_EXAMPLE AS
(
SELECT EMPLOYEE_ID, gender, BIRTH_DATE
FROM employee_demographics dem
WHERE BIRTH_DATE > '1985-01-01'
),
CTE_EXAMPLE2 AS
(
SELECT EMPLOYEE_ID, SALARY
FROM EMPLOYEE_SALARY
WHERE SALARY > 50000
)

SELECT *
FROM CTE_EXAMPLE
JOIN CTE_EXAMPLE2
	ON CTE_EXAMPLE.EMPLOYEE_ID = CTE_EXAMPLE2.EMPLOYEE_ID
;