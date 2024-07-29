----------------------- Window Functions --------------------- 
-- It allows you to look at a partition or a group but they each keep their own unique rows inthe output.-- 

SELECT gender, avg(salary) AS avg_salary 
FROM employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender;


SELECT DEM.FIRST_NAME, DEM.last_name gender, avg(salary) OVER(PARTITION BY GENDER) 
FROM employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;
    

SELECT DEM.FIRST_NAME, DEM.last_name, gender, SALARY, 
SUM(salary) OVER(PARTITION BY GENDER ORDER BY DEM.employee_id) AS ROLLING_TOTAL
FROM employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;    
    
--------------------- ROW_NUMBER ------------------- 
 SELECT DEM.employee_id, DEM.FIRST_NAME, DEM.last_name, gender, SALARY, 
row_number() OVER(partition by GENDER ORDER BY SALARY DESC) AS ROW_NUM,

 --------------------- RANK ------------------- 
RANK() OVER(partition by GENDER ORDER BY SALARY DESC) RANK_NUM,

--------------------- DENSE_RANK ------------------- 
DENSE_RANK() OVER(partition by GENDER ORDER BY SALARY DESC)  DENSE_RANK_NUM
FROM employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;    