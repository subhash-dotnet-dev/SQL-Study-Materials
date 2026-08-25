-- ============================================================
-- SQL SERVER — DAY 34
-- Topic: LOGINS, USERS, PRIVILEGES & VIEWS
-- ============================================================


-- ============================================================
-- 1. LOGINS
-- Security at SERVER level
-- ============================================================

-- Execute in MASTER database

CREATE LOGIN NARESH
WITH PASSWORD = 'abc';


-- ============================================================
-- 2. USERS
-- Associate Login with Database User
-- Execute inside the required database
-- ============================================================

CREATE USER [VIJAY]
FOR LOGIN [NARESH];


-- ============================================================
-- 3. PRIVILEGES
-- GRANT permissions to a user
-- ============================================================

GRANT SELECT, INSERT, UPDATE, DELETE
ON EMP
TO VIJAY;


-- Read-only permission

GRANT SELECT
ON DEPT
TO KUMAR;


-- ============================================================
-- 4. REVOKE
-- Take back permissions from a user
-- ============================================================

REVOKE SELECT, INSERT, UPDATE, DELETE
ON EMP
FROM KUMAR;


-- ============================================================
-- 5. DATABASE OBJECTS
-- ============================================================

-- Main database objects:
-- TABLES
-- VIEWS
-- SYNONYMS
-- SEQUENCES
-- INDEXES


-- ============================================================
-- 6. SIMPLE VIEW
-- View based on a single table
-- ============================================================

CREATE VIEW V1
AS
SELECT EMPNO,
       ENAME,
       JOB,
       DEPTNO
FROM EMP;


-- Read data from View

SELECT *
FROM V1;


-- Grant permissions on View

GRANT SELECT, INSERT, UPDATE, DELETE
ON V1
TO VIJAY;


-- Example operations through View

SELECT *
FROM V1;

UPDATE V1
SET JOB = 'ANALYST'
WHERE EMPNO = 7369;

INSERT INTO V1
VALUES (8888, 'KKK', 'CLERK', 30);


-- ============================================================
-- 7. ROW-LEVEL SECURITY USING VIEW
-- ============================================================

CREATE VIEW V2
AS
SELECT EMPNO,
       ENAME,
       JOB,
       DEPTNO
FROM EMP
WHERE DEPTNO = 20;


-- View only Department 20 employees

SELECT *
FROM V2;


-- Grant permissions on View

GRANT SELECT, INSERT, UPDATE, DELETE
ON V2
TO VIJAY;


-- ============================================================
-- 8. COMPLEX VIEW
-- View using GROUP BY and aggregate functions
-- ============================================================

CREATE VIEW CV2
AS
SELECT DEPTNO,
       MIN(SAL) AS MINSAL,
       MAX(SAL) AS MAXSAL,
       SUM(SAL) AS TOTSAL,
       COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO;


-- Department-wise salary summary

SELECT *
FROM CV2;


-- ============================================================
-- 9. COMPLEX VIEW USING MULTIPLE TABLES
-- ============================================================

CREATE VIEW CV1
AS
SELECT E.EMPNO,
       E.ENAME,
       E.SAL,
       D.DEPTNO,
       D.DNAME
FROM EMP AS E
INNER JOIN DEPT AS D
    ON E.DEPTNO = D.DEPTNO;


-- Read data from Complex View

SELECT *
FROM CV1;


-- ============================================================
-- 10. INFORMATION_SCHEMA — LIST USER TABLES
-- ============================================================

SELECT *
FROM INFORMATION_SCHEMA.TABLES;


-- ============================================================
-- 11. INFORMATION_SCHEMA — LIST USER VIEWS
-- ============================================================

SELECT *
FROM INFORMATION_SCHEMA.VIEWS;


-- ============================================================
-- 12. LIST BASE TABLES
-- ============================================================

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


-- ============================================================
-- QUICK REVISION
-- ============================================================

-- LOGIN      → SERVER LEVEL
-- USER       → DATABASE LEVEL
-- PRIVILEGE  → TABLE LEVEL
-- VIEW       → ROW & COLUMN LEVEL
-- GRANT      → GIVE PERMISSION
-- REVOKE     → TAKE BACK PERMISSION
-- SIMPLE VIEW   → SINGLE TABLE
-- COMPLEX VIEW  → MULTIPLE TABLES / COMPLEX QUERY
