-------------------- Triggers & Events ----------------------- 

SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

DELIMITER $$
CREATE TRIGGER EMPLOYEE_INSERT
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (EMPLOYEE_ID, FIRST_NAME, LAST_NAME)
	VALUES(NEW.EMPLOYEE_ID, NEW.FIRST_NAME,NEW. LAST_NAME);
END $$
DELIMITER ;

INSERT INTO employee_salary (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, OCCUPATION, SALARY, DEPT_ID)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', '1000000', NULL);


-------------------- EVENTS ----------------------

SELECT *
FROM employee_demographics;

DELIMITER $$

CREATE EVENT DELETE_RETIREES
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
    DELETE
    FROM EMPLOYEE_DEMOGRAPHICS
    WHERE AGE >= 60;
END $$

DELIMITER ;

    