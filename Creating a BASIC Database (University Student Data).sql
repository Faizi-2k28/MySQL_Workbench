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

INSERT INTO student_marks(FIRST_NAME, LAST_NAME, ROLL_NO, GRADE, MARKS)
VALUES
('Leslie', 'Knope', '10', 'B',75),
('Ron', 'Swanson', '20', 'C',65),
('Tom', 'Haverford', '30', 'A',90),
('April', 'Ludgate', '40', 'B',70),
('Jerry', 'Gergich', '50', 'D',50),
('Donna', 'Meagle', '60', 'C',65),
('Ann', 'Perkins', '70', 'F',40),
('Chris', 'Traeger', '80', 'A',90),
('Ben', 'Wyatt', '90', 'B',75),
('Andy', 'Dwyer', '100', 'D', 50),
('Mark','Brendanawicz', '110', 'C', 60),
('Craig','Middlebrooks', '120', 'F',49);

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
