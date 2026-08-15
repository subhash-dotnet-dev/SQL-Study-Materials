-- ============================================================
-- DAY 12 - SQL SERVER DML & DDL COMMANDS
-- Topics: UPDATE, DELETE, ALTER, DROP, TRUNCATE, SP_RENAME
-- ============================================================


-- ============================================================
-- 1. UPDATE COMMAND
-- ============================================================

-- Update commission of all employees to 500
UPDATE EMP
SET COMM = 500;


-- Update commission to 500 where commission is NULL
UPDATE EMP
SET COMM = 500
WHERE COMM IS NULL;


-- Update commission to NULL where commission is NOT NULL
UPDATE EMP
SET COMM = NULL
WHERE COMM IS NOT NULL;


-- Update salary and commission of employee 7369
UPDATE EMP
SET SAL = 1000,
    COMM = 500
WHERE EMPNO = 7369;


-- Increase salary by 10% and commission by 20%
-- for SALESMAN employees who joined in 1981
UPDATE EMP
SET SAL = SAL + (SAL * 0.10),
    COMM = COMM + (COMM * 0.20)
WHERE JOB = 'SALESMAN'
AND HIREDATE LIKE '1981%';


-- Transfer employees from department 10 to department 20
UPDATE EMP
SET DEPTNO = 20
WHERE DEPTNO = 10;


-- ============================================================
-- 2. UPDATE PRODUCT PRICE
-- ============================================================

-- Increase price by 10% for Samsung and Realme mobile phones
UPDATE PRODUCT
SET PRICE = PRICE + (PRICE * 0.10)
WHERE CATEGORY = 'MOBILE'
AND BRAND IN ('SAMSUNG', 'REALME');


-- ============================================================
-- 3. DELETE COMMAND
-- ============================================================

-- Delete all rows from EMP
-- WARNING: This deletes all employee records
DELETE FROM EMP;


-- Delete employees who joined in 1980
DELETE FROM EMP
WHERE HIREDATE LIKE '1980%';


-- Delete employees whose employee numbers are 7369 and 7499
DELETE FROM EMP
WHERE EMPNO IN (7369, 7499);


-- Delete employees who joined in the second quarter of 1981
DELETE FROM EMP
WHERE HIREDATE BETWEEN '1981-04-01' AND '1981-06-30';


-- ============================================================
-- 4. TRANSACTION / ROLLBACK EXAMPLE
-- ============================================================

-- Example table
CREATE TABLE A
(
    A INT
);

-- Save table creation
COMMIT;


-- Insert records
INSERT INTO A VALUES (10);
INSERT INTO A VALUES (20);
INSERT INTO A VALUES (30);
INSERT INTO A VALUES (40);


-- Cancel uncommitted changes
ROLLBACK;


-- Check data
SELECT * FROM A;


-- ============================================================
-- 5. ALTER TABLE - ADD COLUMN
-- ============================================================

-- Add GENDER column
ALTER TABLE EMP
ADD GENDER CHAR(1);


-- Update newly added column
UPDATE EMP
SET GENDER = 'M'
WHERE EMPNO = 7369;


-- ============================================================
-- 6. ALTER TABLE - DROP COLUMN
-- ============================================================

-- Drop GENDER column
ALTER TABLE EMP
DROP COLUMN GENDER;


-- ============================================================
-- 7. ALTER TABLE - MODIFY COLUMN
-- ============================================================

-- Change EMPNO datatype
ALTER TABLE EMP
ALTER COLUMN EMPNO INT;


-- Change COMM datatype
ALTER TABLE EMP
ALTER COLUMN COMM SMALLMONEY;


-- Increase ENAME size
ALTER TABLE EMP
ALTER COLUMN ENAME VARCHAR(20);


-- ============================================================
-- 8. DROP TABLE
-- ============================================================

-- Drop table completely
-- Removes both structure and data

-- DROP TABLE EMP;


-- ============================================================
-- 9. TRUNCATE TABLE
-- ============================================================

-- Removes all rows but keeps table structure
-- TRUNCATE TABLE STUDENT;


-- ============================================================
-- 10. DELETE vs TRUNCATE
-- ============================================================

-- DELETE can use WHERE
DELETE FROM STUDENT
WHERE SID = 1;


-- TRUNCATE cannot use WHERE
-- TRUNCATE TABLE STUDENT;


-- ============================================================
-- 11. SP_RENAME
-- ============================================================

-- Rename table
-- EXEC SP_RENAME 'EMP', 'EMPLOYEES';


-- Rename column
-- EXEC SP_RENAME 'EMPLOYEES.COMM', 'BONUS', 'COLUMN';


-- ============================================================
-- 12. ALIAS vs RENAME
-- ============================================================

-- Alias changes the output heading only
SELECT ENAME AS EMPLOYEE_NAME
FROM EMP;


-- Rename permanently changes the column name
-- EXEC SP_RENAME 'EMP.COMM', 'BONUS', 'COLUMN';


-- ============================================================
-- QUICK PRACTICE SUMMARY
-- ============================================================

-- UPDATE  -> Modify existing data
-- DELETE  -> Delete rows
-- ALTER   -> Modify table structure
-- DROP    -> Remove table completely
-- TRUNCATE -> Remove all rows and keep structure
-- SP_RENAME -> Rename table or column
