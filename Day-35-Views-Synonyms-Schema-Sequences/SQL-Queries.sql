-- ============================================================
-- DAY 35: VIEWS, SYNONYMS, SCHEMA & SEQUENCES
-- SQL Server Learning Journey
-- ============================================================


-- ============================================================
-- 1. DROP VIEW
-- ============================================================

-- Drop an existing view
DROP VIEW V1;


-- Check whether the view exists
SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'V1';


-- ============================================================
-- 2. SYNONYMS
-- ============================================================

-- Create a synonym for EMP table
CREATE SYNONYM E
FOR EMP;

-- Use synonym instead of table name
SELECT *
FROM E;

-- UPDATE using synonym
UPDATE E
SET SAL = 1000
WHERE EMPNO = 7369;

-- DELETE using synonym
DELETE FROM E
WHERE EMPNO = 7369;


-- List all synonyms
SELECT *
FROM SYS.SYNONYMS;


-- ============================================================
-- 3. DROP SYNONYM
-- ============================================================

DROP SYNONYM E;

-- Check synonyms
SELECT *
FROM SYS.SYNONYMS;


-- ============================================================
-- 4. SCHEMA
-- ============================================================

-- Create schema
CREATE SCHEMA SALES;


-- ============================================================
-- 5. CREATE TABLE INSIDE SCHEMA
-- ============================================================

CREATE TABLE SALES.CUST
(
    CID INT,
    CNAME VARCHAR(10),
    ADDR VARCHAR(20)
);


-- Insert data
INSERT INTO SALES.CUST
VALUES (10, 'A', 'HYD');

INSERT INTO SALES.CUST
VALUES (20, 'B', 'RANCHI');


-- Display data
SELECT *
FROM SALES.CUST;


-- ============================================================
-- 6. SYNONYM FOR SCHEMA TABLE
-- ============================================================

CREATE SYNONYM SCUST
FOR SALES.CUST;


-- Use synonym
SELECT *
FROM SCUST;


-- ============================================================
-- 7. SYNONYM vs ALIAS
-- ============================================================

-- Synonym: permanent database object
CREATE SYNONYM EMP_SHORT
FOR EMP;

SELECT *
FROM EMP_SHORT;


-- Alias: query-level name
SELECT
    E.EMPNO,
    E.ENAME,
    E.SAL
FROM EMP AS E;


-- ============================================================
-- 8. SEQUENCES
-- ============================================================

-- Create sequence
CREATE SEQUENCE S1
START WITH 1
INCREMENT BY 1
MAXVALUE 5;


-- Check next value
SELECT NEXT VALUE FOR S1;


-- ============================================================
-- 9. USING SEQUENCE WITH TABLE
-- ============================================================

CREATE TABLE STUDENT
(
    SID INT,
    SNAME VARCHAR(10)
);


-- Insert using sequence
INSERT INTO STUDENT
VALUES (NEXT VALUE FOR S1, 'A');

INSERT INTO STUDENT
VALUES (NEXT VALUE FOR S1, 'B');

INSERT INTO STUDENT
VALUES (NEXT VALUE FOR S1, 'C');

INSERT INTO STUDENT
VALUES (NEXT VALUE FOR S1, 'D');

INSERT INTO STUDENT
VALUES (NEXT VALUE FOR S1, 'E');


-- This will fail because MAXVALUE = 5
-- INSERT INTO STUDENT
-- VALUES (NEXT VALUE FOR S1, 'F');


-- Display students
SELECT *
FROM STUDENT;


-- ============================================================
-- 10. SEQUENCE LIMIT
-- ============================================================

CREATE SEQUENCE S2
START WITH 1
INCREMENT BY 1
MAXVALUE 5;


SELECT NEXT VALUE FOR S2;
SELECT NEXT VALUE FOR S2;
SELECT NEXT VALUE FOR S2;
SELECT NEXT VALUE FOR S2;
SELECT NEXT VALUE FOR S2;


-- Next value causes error because NOCYCLE is default
-- SELECT NEXT VALUE FOR S2;


-- ============================================================
-- 11. CYCLE SEQUENCE
-- ============================================================

CREATE SEQUENCE S3
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 5
CYCLE;


-- Test CYCLE behavior
SELECT NEXT VALUE FOR S3;
SELECT NEXT VALUE FOR S3;
SELECT NEXT VALUE FOR S3;
SELECT NEXT VALUE FOR S3;
SELECT NEXT VALUE FOR S3;
SELECT NEXT VALUE FOR S3;
SELECT NEXT VALUE FOR S3;


-- Expected sequence:
-- 1
-- 2
-- 3
-- 4
-- 5
-- 1
-- 2


-- ============================================================
-- 12. ALTER SEQUENCE
-- ============================================================

-- Restart sequence manually
ALTER SEQUENCE S1
RESTART WITH 1;


-- Check sequence after restart
SELECT NEXT VALUE FOR S1;


-- ============================================================
-- 13. REAL-WORLD BILL NUMBER
-- ============================================================

CREATE TABLE BILL
(
    BILLNO VARCHAR(20),
    BDATE DATETIME,
    BAMT DECIMAL(10,2)
);


-- Sequence for bill number
CREATE SEQUENCE BILL_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;


-- Insert bill numbers
INSERT INTO BILL
VALUES
(
    'DM/' +
    FORMAT(GETDATE(), 'MMyy') +
    '/' +
    CAST(NEXT VALUE FOR BILL_SEQ AS VARCHAR),
    GETDATE(),
    2000
);


INSERT INTO BILL
VALUES
(
    'DM/' +
    FORMAT(GETDATE(), 'MMyy') +
    '/' +
    CAST(NEXT VALUE FOR BILL_SEQ AS VARCHAR),
    GETDATE(),
    3500
);


INSERT INTO BILL
VALUES
(
    'DM/' +
    FORMAT(GETDATE(), 'MMyy') +
    '/' +
    CAST(NEXT VALUE FOR BILL_SEQ AS VARCHAR),
    GETDATE(),
    5000
);


-- Display bills
SELECT *
FROM BILL;


-- ============================================================
-- 14. INFORMATION_SCHEMA
-- ============================================================

-- List all tables
SELECT *
FROM INFORMATION_SCHEMA.TABLES;


-- List only base tables
SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


-- List all views
SELECT *
FROM INFORMATION_SCHEMA.VIEWS;


-- List all sequences
SELECT *
FROM INFORMATION_SCHEMA.SEQUENCES;


-- ============================================================
-- 15. DROP SEQUENCE
-- ============================================================

DROP SEQUENCE S1;


-- Drop other sequences when required
-- DROP SEQUENCE S2;
-- DROP SEQUENCE S3;
-- DROP SEQUENCE BILL_SEQ;


-- ============================================================
-- 16. CLEANUP
-- ============================================================

-- Drop synonym
-- DROP SYNONYM SCUST;

-- Drop schema table
-- DROP TABLE SALES.CUST;

-- Drop schema
-- DROP SCHEMA SALES;

-- Drop student table
-- DROP TABLE STUDENT;

-- Drop bill table
-- DROP TABLE BILL;


-- ============================================================
-- QUICK MEMORY
-- ============================================================

-- VIEW
-- → Virtual Table

-- SYNONYM
-- → Alternative Name

-- SCHEMA
-- → Group Related Objects

-- SEQUENCE
-- → Number Generator

-- NEXT VALUE FOR
-- → Get Next Sequence Number

-- NOCYCLE
-- → Stops at MAXVALUE

-- CYCLE
-- → Restarts from MINVALUE

-- ALTER SEQUENCE
-- → Manual Restart

-- DROP SEQUENCE
-- → Delete Sequence Object
