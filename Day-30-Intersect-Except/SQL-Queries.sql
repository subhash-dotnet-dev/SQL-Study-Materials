-- ============================================================
-- SQL LEARNING JOURNEY - DAY 30
-- TOPIC: INTERSECT & EXCEPT
-- ============================================================

-- ============================================================
-- 1. INTERSECT
-- Returns common values from both query results
-- ============================================================

SELECT job
FROM emp
WHERE deptno = 20
INTERSECT
SELECT job
FROM emp
WHERE deptno = 30;


-- ============================================================
-- 2. EXCEPT
-- Returns values present in the first query
-- but not present in the second query
-- ============================================================

SELECT job
FROM emp
WHERE deptno = 20
EXCEPT
SELECT job
FROM emp
WHERE deptno = 30;


-- ============================================================
-- 3. REVERSE EXCEPT
-- Values present in second query but not in first query
-- ============================================================

SELECT job
FROM emp
WHERE deptno = 30
EXCEPT
SELECT job
FROM emp
WHERE deptno = 20;


-- ============================================================
-- 4. INTERSECT WITH SAMPLE DATA
-- A = 1,2,3,4
-- B = 1,2,5,6
-- Common values = 1,2
-- ============================================================

SELECT 1 AS value
UNION
SELECT 2
UNION
SELECT 3
UNION
SELECT 4

INTERSECT

SELECT 1
UNION
SELECT 2
UNION
SELECT 5
UNION
SELECT 6;


-- ============================================================
-- 5. EXCEPT WITH SAMPLE DATA
-- A EXCEPT B = 3,4
-- ============================================================

SELECT 1 AS value
UNION
SELECT 2
UNION
SELECT 3
UNION
SELECT 4

EXCEPT

SELECT 1
UNION
SELECT 2
UNION
SELECT 5
UNION
SELECT 6;


-- ============================================================
-- 6. FIND NEW CUSTOMERS USING EXCEPT
-- Customers present in CUSTS but missing from CUSTT
-- ============================================================

SELECT *
FROM CUSTS
EXCEPT
SELECT *
FROM CUSTT;


-- ============================================================
-- 7. FIND NEW CUSTOMERS USING LEFT JOIN
-- ============================================================

SELECT S.*
FROM CUSTS AS S
LEFT JOIN CUSTT AS T
    ON S.CID = T.CID
WHERE T.CID IS NULL;


-- ============================================================
-- 8. COPY NEW CUSTOMER DATA INTO CUSTT
-- ============================================================

INSERT INTO CUSTT
SELECT *
FROM CUSTS
EXCEPT
SELECT *
FROM CUSTT;


-- ============================================================
-- 9. SET OPERATORS - UNION
-- Removes duplicate values
-- ============================================================

SELECT job
FROM emp
WHERE deptno = 20
UNION
SELECT job
FROM emp
WHERE deptno = 30;


-- ============================================================
-- 10. SET OPERATORS - UNION ALL
-- Keeps duplicate values
-- ============================================================

SELECT job
FROM emp
WHERE deptno = 20
UNION ALL
SELECT job
FROM emp
WHERE deptno = 30;


-- ============================================================
-- 11. INTERSECT
-- ============================================================

SELECT job
FROM emp
WHERE deptno = 20
INTERSECT
SELECT job
FROM emp
WHERE deptno = 30;


-- ============================================================
-- 12. EXCEPT
-- ============================================================

SELECT job
FROM emp
WHERE deptno = 20
EXCEPT
SELECT job
FROM emp
WHERE deptno = 30;


-- ============================================================
-- 13. JOIN RESULT PRACTICE
-- T1 and T2 example
-- ============================================================

SELECT T1.F1, T2.C1
FROM T1
INNER JOIN T2
    ON T1.F1 = T2.C1;


-- LEFT JOIN

SELECT T1.F1, T2.C1
FROM T1
LEFT JOIN T2
    ON T1.F1 = T2.C1;


-- RIGHT JOIN

SELECT T1.F1, T2.C1
FROM T1
RIGHT JOIN T2
    ON T1.F1 = T2.C1;


-- FULL JOIN

SELECT T1.F1, T2.C1
FROM T1
FULL JOIN T2
    ON T1.F1 = T2.C1;


-- ============================================================
-- 14. SET OPERATOR PRACTICE WITH T1 AND T2
-- ============================================================

-- UNION

SELECT F1
FROM T1
UNION
SELECT C1
FROM T2;


-- UNION ALL

SELECT F1
FROM T1
UNION ALL
SELECT C1
FROM T2;


-- INTERSECT

SELECT F1
FROM T1
INTERSECT
SELECT C1
FROM T2;


-- EXCEPT

SELECT F1
FROM T1
EXCEPT
SELECT C1
FROM T2;


-- ============================================================
-- 15. SET OPERATOR SUMMARY
-- ============================================================

-- UNION
-- A + B
-- Removes duplicates

-- UNION ALL
-- A + B
-- Keeps duplicates

-- INTERSECT
-- A ∩ B
-- Returns common values

-- EXCEPT
-- A - B
-- Returns values from A that are not in B

-- ============================================================
-- 16. IMPORTANT SET OPERATOR RULES
-- ============================================================

-- Rule 1:
-- Both SELECT statements must return
-- the same number of columns.

-- Rule 2:
-- Corresponding columns must have
-- compatible data types.

-- ============================================================
-- DAY 30 COMPLETE
-- INTERSECT = COMMON RECORDS
-- EXCEPT = FIRST QUERY - SECOND QUERY
-- ============================================================
