-- ============================================================
-- SQL SERVER — DAY 50
-- TOPIC: NORMALIZATION & TEMPORARY TABLES
-- SQL LEARNING JOURNEY — FINAL DAY
-- ============================================================

-- ============================================================
-- 1. NORMALIZATION
-- ============================================================

-- Normalization is the process of decomposing tables
-- with redundancy into well-structured tables.

-- Normal Forms:
-- 1NF  → Atomic Values / No Multi-Valued Attributes
-- 2NF  → 1NF + No Partial Dependency
-- 3NF  → 2NF + No Transitive Dependency
-- BCNF → Boyce-Codd Normal Form
-- 4NF  → Fourth Normal Form
-- 5NF  → Fifth Normal Form

-- ============================================================
-- 2. TEMPORARY TABLE
-- ============================================================

-- Method 1: Create Temporary Table

CREATE TABLE #TEMP
(
empno INT,
ename VARCHAR(10),
sal MONEY,
rnk INT
);

-- ============================================================
-- 3. INSERT DATA INTO TEMPORARY TABLE
-- ============================================================

INSERT INTO #TEMP
SELECT
EMPNO,
ENAME,
SAL,
DENSE_RANK() OVER (ORDER BY SAL DESC) AS RNK
FROM EMP;

-- ============================================================
-- 4. DISPLAY TEMPORARY TABLE
-- ============================================================

SELECT *
FROM #TEMP;

-- ============================================================
-- 5. DISPLAY TOP 5 EMPLOYEES
-- ============================================================

SELECT *
FROM #TEMP
WHERE RNK <= 5;

-- ============================================================
-- 6. CREATE TEMPORARY TABLE USING SELECT INTO
-- ============================================================

SELECT
EMPNO,
ENAME,
SAL,
DENSE_RANK() OVER (ORDER BY SAL DESC) AS RNK
INTO #TEMP2
FROM EMP;

-- Display #TEMP2

SELECT *
FROM #TEMP2;

-- ============================================================
-- 7. TOP 5 EMPLOYEES USING #TEMP2
-- ============================================================

SELECT *
FROM #TEMP2
WHERE RNK <= 5;

-- ============================================================
-- 8. CTE EXAMPLE
-- ============================================================

WITH EMP_CTE AS
(
SELECT
EMPNO,
ENAME,
SAL,
DENSE_RANK() OVER (ORDER BY SAL DESC) AS RNK
FROM EMP
)
SELECT *
FROM EMP_CTE
WHERE RNK <= 5;

-- ============================================================
-- 9. TEMPORARY DATA STORAGE METHODS
-- ============================================================

-- 1. CTE
--    Scope → Current Query

-- 2. Temporary Table
--    Scope → Current Session

-- 3. Cursor
--    Used for Row-by-Row Processing

-- ============================================================
-- 10. CTE vs TEMPORARY TABLE
-- ============================================================

-- CTE:
-- Scope is limited to the query immediately following the CTE.

WITH EMP_CTE AS
(
SELECT EMPNO, ENAME, SAL
FROM EMP
)
SELECT *
FROM EMP_CTE;

-- Temporary Table:
-- Can be referenced by multiple queries within the session.

CREATE TABLE #EMP_TEMP
(
EMPNO INT,
ENAME VARCHAR(10),
SAL MONEY
);

INSERT INTO #EMP_TEMP
SELECT EMPNO, ENAME, SAL
FROM EMP;

SELECT *
FROM #EMP_TEMP;

-- ============================================================
-- 11. DROP TEMPORARY TABLE
-- ============================================================

DROP TABLE #EMP_TEMP;

-- ============================================================
-- IMPORTANT NOTES
-- ============================================================

-- 1NF → Atomic values
-- 2NF → No partial dependency
-- 3NF → No transitive dependency

-- CTE → Query Scope
-- #TEMP → Session Scope
-- Cursor → Row-by-Row Processing

-- Temporary tables are automatically removed
-- when the session ends.

-- ============================================================
-- DAY 50 — SQL LEARNING JOURNEY COMPLETE 🏆
-- ============================================================
