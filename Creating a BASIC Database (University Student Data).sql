----------------------- CREATING A DATABASE ------------------------------------

CREATE DATABASE UNIVERSITY;
USE UNIVERSITY;

CREATE TABLE STUDENT_DEMOGRAPHICS(
STUDENT_ID INT NOT NULL,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
AGE INT NOT NULL,
GENDER VARCHAR(50),
PRIMARY KEY (STUDENT_ID)
);

CREATE TABLE STUDENT_MARKS(
STUDENT_ID INT NOT NULL,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
ROLL_NO INT NOT NULL,
GRADE VARCHAR(50),
MARKS INT NOT NULL
);

INSERT INTO student_demographics(STUDENT_ID, FIRST_NAME, LAST_NAME, AGE, GENDER)
VALUES
(1,'Leslie', 'Knope', 44, 'Female'),
(3,'Tom', 'Haverford', 36, 'Male'),
(4, 'April', 'Ludgate', 29, 'Female'),
(5, 'Jerry', 'Gergich', 61, 'Male'),
(6, 'Donna', 'Meagle', 46, 'Female'),
(7, 'Ann', 'Perkins', 35, 'Female'),
(8, 'Chris', 'Traeger', 43, 'Male'),
(9, 'Ben', 'Wyatt', 38, 'Male'),
(10, 'Andy', 'Dwyer', 34, 'Male'),
(11, 'Mark', 'Brendanawicz', 40, 'Male'),
(12, 'Craig', 'Middlebrooks', 37, 'Male');

INSERT INTO student_marks(STUDENT_ID, FIRST_NAME, LAST_NAME, ROLL_NO, GRADE, MARKS)
VALUES
('1','Leslie', 'Knope', '10', 'B',75),
('2','Ron', 'Swanson', '20', 'C',65),
('3','Tom', 'Haverford', '30', 'A',90),
('4','April', 'Ludgate', '40', 'B',70),
('5','Jerry', 'Gergich', '50', 'D',50),
('6','Donna', 'Meagle', '60', 'C',65),
('7','Ann', 'Perkins', '70', 'F',40),
('8','Chris', 'Traeger', '80', 'A',90),
('9','Ben', 'Wyatt', '90', 'B',75),
('10','Andy', 'Dwyer', '100', 'D', 50),
('11','Mark','Brendanawicz', '110', 'C', 60),
('12','Craig','Middlebrooks', '120', 'F',49);

----------------------------- SELECT STATEMENT -----------------------

SELECT * 
FROM UNIVERSITY.STUDENT_DEMOGRAPHICS;

SELECT FIRST_NAME, GRADE 
FROM UNIVERSITY.STUDENT_MARKS;-- 

-------------------------- WHERE CLAUSE ---------------------------

SELECT *
FROM UNIVERSITY.STUDENT_MARKS
WHERE ROLL_NO > '10'
;

SELECT *
FROM UNIVERSITY.STUDENT_MARKS
WHERE MARKS >= '70'
;

SELECT *
FROM UNIVERSITY.STUDENT_MARKS
WHERE GRADE = 'B'
;

-------------------- WHERE CLAUSE WITH LOGICAL OPERATOR -----------------------------

SELECT *
FROM UNIVERSITY.STUDENT_MARKS
WHERE ROLL_NO > 10 AND MARKS > '70'
;

SELECT *
FROM UNIVERSITY.STUDENT_MARKS
WHERE (ROLL_NO > 10 AND MARKS > '70') OR GRADE = 'B'
;

----------------------- WHERE CLAUSE USING LIKE SATEMENT -----------------------------

SELECT *
FROM UNIVERSITY.STUDENT_MARKS
WHERE FIRST_NAME LIKE '%E%'
;

SELECT *
FROM UNIVERSITY.STUDENT_MARKS
WHERE LAST_NAME LIKE '%E___'
;

-------------------------- GROUP BY USING AGGREGATE FUNCTION -------------------------------

SELECT GRADE, AVG(MARKS), SUM(MARKS), MIN(MARKS), MAX(MARKS), COUNT(MARKS)
FROM UNIVERSITY.STUDENT_MARKS
GROUP BY GRADE
;

-------------------------- ORDER BY USING AGGREGATE FUNCTION -------------------------------

SELECT GRADE, ROLL_NO,  AVG(MARKS), SUM(MARKS), MIN(MARKS), MAX(MARKS), COUNT(MARKS)
FROM UNIVERSITY.STUDENT_MARKS
GROUP BY GRADE, ROLL_NO
ORDER BY GRADE, ROLL_NO DESC 
;

----------------------- HAVING CLAUSE ---------------------------

SELECT GRADE, AVG(MARKS), SUM(MARKS), MIN(MARKS), MAX(MARKS), COUNT(MARKS)
FROM UNIVERSITY.STUDENT_MARKS
GROUP BY GRADE
HAVING AVG(MARKS) > 70
;

SELECT LAST_NAME, AVG(MARKS), SUM(MARKS), MIN(MARKS), MAX(MARKS), COUNT(MARKS)
FROM UNIVERSITY.STUDENT_MARKS
WHERE LAST_NAME LIKE '%a%'
GROUP BY LAST_NAME
HAVING AVG(MARKS) > '70'
;

-------------------------- LIMIT & ALIASING ------------------------------------

SELECT LAST_NAME, AVG(MARKS) AS avg_marks
FROM UNIVERSITY.STUDENT_MARKS
WHERE LAST_NAME LIKE '%a%'
GROUP BY LAST_NAME
HAVING avg_marks
LIMIT 4,3
;

-------------------------- JOINS ----------------------------------
----------------------------- INNER JOIN -------------------------

SELECT * 
FROM STUDENT_DEMOGRAPHICS;

SELECT * 
FROM STUDENT_MARKS AS STM
INNER JOIN STUDENT_DEMOGRAPHICS AS STD
	ON STM.FIRST_NAME = STD.FIRST_NAME
;

----------------------- OUTER JOIN -----------------------------
----------------------- LEFT JOIN ---------------------------- 
SELECT * 
FROM STUDENT_DEMOGRAPHICS;

SELECT * 
FROM STUDENT_MARKS AS STM
LEFT JOIN STUDENT_DEMOGRAPHICS AS STD
	ON STM.FIRST_NAME = STD.FIRST_NAME
;
  
----------------------- RIGHT JOIN ----------------------------
SELECT * 
FROM STUDENT_DEMOGRAPHICS;

SELECT * 
FROM STUDENT_MARKS AS STM
RIGHT JOIN STUDENT_DEMOGRAPHICS AS STD
	ON STM.FIRST_NAME = STD.FIRST_NAME
;

----------------------- SELF JOIN ------------------------
SELECT SM1.STUDENT_ID AS SM_EXTRA,
SM1.FIRST_NAME AS FIRST_NAME_EXTRA,
SM1.LAST_NAME AS LAST_NAME_EXTRA,
SM2.FIRST_NAME AS FIRST_NAME_SM,
SM2.LAST_NAME AS LAST_NAME_SM,
SM2.STUDENT_ID AS STUDENT_ID_SM
FROM STUDENT_MARKS AS SM1
JOIN STUDENT_MARKS AS SM2
	ON SM1.STUDENT_ID + 1 = SM2.STUDENT_ID
;
     
-------------------- UNIONS ------------------------
-------------------- UNION DISTINCT ------------------------
SELECT FIRST_NAME, LAST_NAME
FROM STUDENT_MARKS
UNION DISTINCT
SELECT FIRST_NAME, LAST_NAME
FROM STUDENT_MARKS
;

-------------------- UNION ALL ------------------------
SELECT FIRST_NAME, LAST_NAME, STUDENT_ID
FROM STUDENT_MARKS
UNION ALL
SELECT FIRST_NAME, LAST_NAME, STUDENT_ID
FROM STUDENT_MARKS
;

-------------------- MULTIPLE UNION  ------------------------
SELECT FIRST_NAME, LAST_NAME, GRADE, 'GOOD MARKS' AS LABEL
FROM STUDENT_MARKS
WHERE MARKS > 70 AND GRADE = 'A'
UNION 
SELECT FIRST_NAME, LAST_NAME, GRADE, 'BAD MARKS' AS LABEL
FROM STUDENT_MARKS
WHERE MARKS < 70 AND GRADE = 'C'
UNION 
SELECT  FIRST_NAME, LAST_NAME, GRADE, 'HIGH ACHIEVER' AS LABEL
FROM STUDENT_MARKS
WHERE GRADE = 'A'
;

-------------------------- STRING FUNCTIONS ------------------------
-------------------------- LENGTH --------------------------------
SELECT LENGTH('HELLO'); 

SELECT FIRST_NAME, LAST_NAME, LENGTH(FIRST_NAME), LENGTH(LAST_NAME)
FROM STUDENT_MARKS;

----------------------- UPPER & LOWER -----------------
SELECT LOWER ('HELLO'); 
SELECT UPPER ('hello');

SELECT FIRST_NAME, UPPER(FIRST_NAME), LAST_NAME, LOWER(LAST_NAME)
FROM STUDENT_MARKS;

-------------------------- TRIM ------------------------
SELECT TRIM('                 HELLO                       ');
SELECT LTRIM('                HELLO                       ');
SELECT RTRIM('                HELLO                       ');

-------------------------- SUBSTRING ----------------------
SELECT FIRST_NAME, 
LEFT(first_name, 4),
RIGHT(FIRST_NAME, 3),
SUBSTRING(FIRST_NAME, 3,2)
FROM STUDENT_MARKS;

----------------------- REPLACE -------------------------
SELECT FIRST_NAME, REPLACE( FIRST_NAME,'A', 'Z'), LAST_NAME, REPLACE(LAST_NAME, 'e', 'c')
FROM STUDENT_MARKS; 

----------------------- LOCATE ----------------------------
SELECT LOCATE('e', 'HELLO');

SELECT FIRST_NAME, LOCATE('s', FIRST_NAME)
FROM STUDENT_MARKS;  

-------------------------- CONCATENATE ------------------------
SELECT FIRST_NAME, LAST_NAME, MARKS, GRADE,
CONCAT(FIRST_NAME,' ', LAST_NAME), 
CONCAT(MARKS,' ', GRADE)
FROM STUDENT_MARKS; 

----------------------------- CASE STATEMENT -----------------------

SELECT FIRST_NAME,
LAST_NAME,
MARKS,
GRADE,
CASE	
    WHEN MARKS > 70 THEN 'EXCELLENT MARKS'
    WHEN GRADE = 'A' THEN 'GOOD GRADE'
END AS 'FINAL REMARKS'
FROM STUDENT_MARKS;
