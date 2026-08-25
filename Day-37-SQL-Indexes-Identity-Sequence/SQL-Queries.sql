-- ================================================================
-- SQL LEARNING JOURNEY - DAY 37
-- TOPICS: CLUSTERED INDEX, IDENTITY & SEQUENCE
-- ================================================================


-- ================================================================
-- 1. CLUSTERED INDEX
-- ================================================================

CREATE TABLE CUST
(
    CID INT,
    CNAME VARCHAR(10)
);

-- Create Clustered Index
CREATE CLUSTERED INDEX I10
ON CUST(CID);


-- Insert Sample Data
INSERT INTO CUST VALUES(10, 'A');
INSERT INTO CUST VALUES(80, 'B');
INSERT INTO CUST VALUES(40, 'C');
INSERT INTO CUST VALUES(60, 'D');


-- View Data
SELECT *
FROM CUST;


-- Search using Clustered Index
SELECT *
FROM CUST
WHERE CID = 60;


-- ================================================================
-- 2. CHECK INDEXES
-- ================================================================

EXEC SP_HELPINDEX 'CUST';


-- ================================================================
-- 3. DROP INDEX
-- ================================================================

-- DROP INDEX I10 ON CUST;


-- ================================================================
-- 4. IDENTITY
-- ================================================================

CREATE TABLE STUDENT
(
    SID INT IDENTITY(100,1),
    SNAME VARCHAR(10)
);


-- Insert Values
INSERT INTO STUDENT(SNAME) VALUES('A');
INSERT INTO STUDENT(SNAME) VALUES('B');
INSERT INTO STUDENT(SNAME) VALUES('C');
INSERT INTO STUDENT(SNAME) VALUES('D');
INSERT INTO STUDENT(SNAME) VALUES('E');


-- Display Student Data
SELECT *
FROM STUDENT;


-- Expected:
-- SID   SNAME
-- 100   A
-- 101   B
-- 102   C
-- 103   D
-- 104   E


-- ================================================================
-- 5. DELETE AND IDENTITY
-- ================================================================

DELETE FROM STUDENT;

-- Next Identity Value continues
INSERT INTO STUDENT(SNAME)
VALUES('K');

SELECT *
FROM STUDENT;

-- Expected:
-- SID   SNAME
-- 105   K


-- ================================================================
-- 6. TRUNCATE AND IDENTITY RESET
-- ================================================================

TRUNCATE TABLE STUDENT;

INSERT INTO STUDENT(SNAME)
VALUES('X');

SELECT *
FROM STUDENT;

-- Expected:
-- SID   SNAME
-- 100   X


-- ================================================================
-- 7. IDENTITY WITH DIFFERENT SEED & INCREMENT
-- ================================================================

CREATE TABLE EMP_IDENTITY
(
    EMPID INT IDENTITY(1000,10),
    ENAME VARCHAR(20)
);

INSERT INTO EMP_IDENTITY(ENAME)
VALUES('A');

INSERT INTO EMP_IDENTITY(ENAME)
VALUES('B');

INSERT INTO EMP_IDENTITY(ENAME)
VALUES('C');

SELECT *
FROM EMP_IDENTITY;

-- Expected:
-- EMPID   ENAME
-- 1000    A
-- 1010    B
-- 1020    C


-- ================================================================
-- 8. SEQUENCE
-- ================================================================

CREATE SEQUENCE S1
START WITH 1
INCREMENT BY 1;


-- Get Next Sequence Values
SELECT NEXT VALUE FOR S1 AS NEXT_NUMBER;

SELECT NEXT VALUE FOR S1 AS NEXT_NUMBER;

SELECT NEXT VALUE FOR S1 AS NEXT_NUMBER;


-- ================================================================
-- 9. USING SEQUENCE WITH TABLE
-- ================================================================

CREATE TABLE SEQ_STUDENT
(
    SID INT,
    SNAME VARCHAR(20)
);

INSERT INTO SEQ_STUDENT
VALUES(NEXT VALUE FOR S1, 'A');

INSERT INTO SEQ_STUDENT
VALUES(NEXT VALUE FOR S1, 'B');

INSERT INTO SEQ_STUDENT
VALUES(NEXT VALUE FOR S1, 'C');

SELECT *
FROM SEQ_STUDENT;


-- ================================================================
-- 10. RESTART SEQUENCE
-- ================================================================

ALTER SEQUENCE S1
RESTART WITH 1;

SELECT NEXT VALUE FOR S1 AS NEXT_NUMBER;


-- ================================================================
-- 11. DROP SEQUENCE
-- ================================================================

-- DROP SEQUENCE S1;


-- ================================================================
-- 12. IDENTITY vs SEQUENCE - PRACTICAL DEMO
-- ================================================================

-- IDENTITY is bound to a specific column
-- SEQUENCE is an independent database object

CREATE SEQUENCE ORDER_SEQ
START WITH 100
INCREMENT BY 1;

CREATE TABLE ORDERS
(
    ORDER_ID INT,
    CUSTOMER_NAME VARCHAR(30)
);

INSERT INTO ORDERS
VALUES(NEXT VALUE FOR ORDER_SEQ, 'CUSTOMER A');

INSERT INTO ORDERS
VALUES(NEXT VALUE FOR ORDER_SEQ, 'CUSTOMER B');

INSERT INTO ORDERS
VALUES(NEXT VALUE FOR ORDER_SEQ, 'CUSTOMER C');

SELECT *
FROM ORDERS;


-- ================================================================
-- 13. CLEANUP
-- ================================================================

-- DROP TABLE CUST;
-- DROP TABLE STUDENT;
-- DROP TABLE EMP_IDENTITY;
-- DROP TABLE SEQ_STUDENT;
-- DROP TABLE ORDERS;

-- DROP SEQUENCE S1;
-- DROP SEQUENCE ORDER_SEQ;


-- ================================================================
-- DAY 37 QUICK REVISION
-- ================================================================

-- CLUSTERED INDEX
-- -> Stores actual table data at leaf level
-- -> Only one clustered index per table

-- NON-CLUSTERED INDEX
-- -> Separate index structure
-- -> Stores row locators

-- IDENTITY
-- -> Automatically generates values for a column
-- -> IDENTITY(SEED, INCREMENT)

-- DELETE
-- -> Identity value continues

-- TRUNCATE
-- -> Identity resets to seed

-- SEQUENCE
-- -> Independent database object
-- -> Generates numeric values
-- -> Can be restarted

-- ================================================================
-- DAY 37 COMPLETE 🚀
-- ================================================================
