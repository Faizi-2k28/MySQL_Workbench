----------------------- JOINS ----------------------------------
# ############### INNER JOIN ####################
----------------------- INNER JOINS RETURNS THE ROWS THAT ARE SAME IN BOTH COLUMNS ---------------------------------
SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    ;

------------------------------ OUTER JOIN ------------------------------------
-- THERE ARE TWO OUTER JOINS:
-- 1- LEFT JOIN AND IT IS GOING TO TAKE EVERYTHING FROM THE LEFT TABLE EVEN IF THERE IS NO MATCH IN THE JOIN AND 
-- MATCHES FROM THE RIGHT TABLE.

SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    ;

-- 2- RIGHT JOIN AND IT IS GOING TO TAKE EVERYTHING FROM THE RIGHT TABLE EVEN IF THERE IS NO MATCH IN THE JOIN AND 
-- ONLY MATCHES TO THE LEFT TABLE.

SELECT *
FROM employee_demographics AS dem
RIGHT  JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    ;
    
-------------------------- SELF JOIN --------------------------------
-------- SELF JOIN IS WHEN YOU TIE THE TABLE TO ITSELF --------------------

SELECT emp1.employee_id AS EMP_SECRET,
emp1.first_name AS first_name_secret,
emp1.last_name AS last_name_secret,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp1.last_name AS last_name_emp
FROM employee_salary EMP1
JOIN employee_salary EMP2
	ON EMP1.employee_id + 1  = EMP2.employee_id
;

----------------------- JOINING MULTIPLE TABLES TOGETHER -------------------- 

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_department pd
	ON sal.dept_id = pd.department_id
;
