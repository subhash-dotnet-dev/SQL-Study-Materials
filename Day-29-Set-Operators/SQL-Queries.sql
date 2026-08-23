-- ============================================================
-- DAY 29 — SQL SERVER SET OPERATORS
-- ============================================================
-- Topics:
-- 1. UNION
-- 2. UNION ALL
-- 3. INTERSECT
-- 4. EXCEPT
-- 5. UNION vs JOIN
-- ============================================================


-- ============================================================
-- 1. SET OPERATORS — BASIC EXAMPLE
-- ============================================================

-- A = 1, 2, 3, 4
-- B = 1, 2, 5, 6

-- UNION
-- Result: 1, 2, 3, 4, 5, 6

-- UNION ALL
-- Result: 1, 2, 3, 4, 1, 2, 5, 6

-- INTERSECT
-- Result: 1, 2

-- EXCEPT
-- Result: 3, 4

-- B EXCEPT A
-- Result: 5, 6


-- ============================================================
-- 2. UNION
-- ============================================================
-- Combines rows returned by two queries.
-- Duplicate records are eliminated.

SELECT JOB
FROM EMP
WHERE DEPTNO = 20

UNION

SELECT JOB
FROM EMP
WHERE DEPTNO = 30;


-- ============================================================
-- 3. UNION ALL
-- ============================================================
-- Combines rows returned by two queries.
-- Duplicate records are NOT eliminated.

SELECT JOB
FROM EMP
WHERE DEPTNO = 20

UNION ALL

SELECT JOB
FROM EMP
WHERE DEPTNO = 30;


-- ============================================================
-- 4. INTERSECT
-- ============================================================
-- Returns common records from both query results.

SELECT JOB
FROM EMP
WHERE DEPTNO = 20

INTERSECT

SELECT JOB
FROM EMP
WHERE DEPTNO = 30;


-- ============================================================
-- 5. EXCEPT
-- ============================================================
-- Returns records from the first query
-- that are not present in the second query.

SELECT JOB
FROM EMP
WHERE DEPTNO = 20

EXCEPT

SELECT JOB
FROM EMP
WHERE DEPTNO = 30;


-- ============================================================
-- 6. REVERSE EXCEPT
-- ============================================================
-- Returns records from the second query
-- that are not present in the first query.

SELECT JOB
FROM EMP
WHERE DEPTNO = 30

EXCEPT

SELECT JOB
FROM EMP
WHERE DEPTNO = 20;


-- ============================================================
-- 7. TOTAL EMPLOYEES FROM EMP_US AND EMP_IND
-- ============================================================
-- UNION removes duplicate rows.

SELECT *
FROM EMP_US

UNION

SELECT *
FROM EMP_IND;


-- ============================================================
-- 8. TOTAL EMPLOYEES USING UNION ALL
-- ============================================================
-- UNION ALL keeps duplicate rows.

SELECT *
FROM EMP_US

UNION ALL

SELECT *
FROM EMP_IND;


-- ============================================================
-- 9. EMPLOYEES WITH DEPARTMENT DETAILS — EMP_US
-- ============================================================

SELECT E.*, D.*
FROM EMP_US AS E
INNER JOIN DEPT AS D
ON E.DNO = D.DNO;


-- ============================================================
-- 10. TOTAL EMPLOYEES WITH DEPARTMENT DETAILS
-- ============================================================
-- Combines employee + department details
-- from EMP_US and EMP_IND.

SELECT E.*, D.*
FROM EMP_US AS E
INNER JOIN DEPT AS D
ON E.DNO = D.DNO

UNION

SELECT E.*, D.*
FROM EMP_IND AS E
INNER JOIN DEPT AS D
ON E.DNO = D.DNO;


-- ============================================================
-- 11. TOTAL EMPLOYEES WITH DEPARTMENT DETAILS — UNION ALL
-- ============================================================
-- Duplicate records are retained.

SELECT E.*, D.*
FROM EMP_US AS E
INNER JOIN DEPT AS D
ON E.DNO = D.DNO

UNION ALL

SELECT E.*, D.*
FROM EMP_IND AS E
INNER JOIN DEPT AS D
ON E.DNO = D.DNO;


-- ============================================================
-- 12. UNION vs JOIN — PRACTICE TABLES
-- ============================================================
-- T1
-- F1
-- 1
-- 2
-- 3
--
-- T2
-- C1
-- 10
-- 20
-- 30
--
-- UNION combines rows from query results.
-- JOIN combines columns from related tables.


-- ============================================================
-- 13. SET OPERATOR RULES
-- ============================================================
-- Rule 1:
-- Both queries must return the same number of columns.
--
-- Rule 2:
-- Corresponding columns must have compatible datatypes.


-- ============================================================
-- 14. QUICK PRACTICE — UNION
-- ============================================================

SELECT ENAME
FROM EMP
WHERE DEPTNO = 10

UNION

SELECT ENAME
FROM EMP
WHERE DEPTNO = 20;


-- ============================================================
-- 15. QUICK PRACTICE — UNION ALL
-- ============================================================

SELECT ENAME
FROM EMP
WHERE DEPTNO = 10

UNION ALL

SELECT ENAME
FROM EMP
WHERE DEPTNO = 20;


-- ============================================================
-- 16. QUICK PRACTICE — INTERSECT
-- ============================================================

SELECT JOB
FROM EMP
WHERE DEPTNO = 10

INTERSECT

SELECT JOB
FROM EMP
WHERE DEPTNO = 20;


-- ============================================================
-- 17. QUICK PRACTICE — EXCEPT
-- ============================================================

SELECT JOB
FROM EMP
WHERE DEPTNO = 10

EXCEPT

SELECT JOB
FROM EMP
WHERE DEPTNO = 20;


-- ============================================================
-- END OF DAY 29
-- ============================================================
-- SET OPERATORS
-- UNION
-- UNION ALL
-- INTERSECT
-- EXCEPT
-- UNION vs JOIN
-- UNION vs UNION ALL
-- ============================================================
