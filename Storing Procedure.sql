-------------------- Stored Procedures -----------------------
-- It stored the sql code so we can reuse again and again --   

SELECT * 
FROM employee_salary
WHERE SALARY >= 50000;


CREATE PROCEDURE LARGE_SALARIES()
SELECT * 
FROM employee_salary
WHERE SALARY >= 50000;

CALL LARGE_SALARIES();

DELIMITER $$
CREATE PROCEDURE LARGE_SALARIES3()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE SALARY >= 50000;
	SELECT * 
	FROM employee_salary
	WHERE SALARY >= 10000;
END $$ 
DELIMITER ;

CALL LARGE_SALARIES3();

 DELIMITER $$
CREATE PROCEDURE LARGE_SALARIES4(TEMP_ID int)
BEGIN
	SELECT SALARY
	FROM employee_salary
	WHERE EMPLOYEE_ID = TEMP_ID;
END $$ 
DELIMITER ;

CALL LARGE_SALARIES4(3);
