-- ============================================================
-- SQL SERVER — DAY 31
-- Topic: DERIVED TABLES & ROW_NUMBER()
-- ============================================================

-- ============================================================
-- 1. DERIVED TABLE
-- A sub-query written inside the FROM clause is called
-- a Derived Table.
-- ============================================================

SELECT *
FROM
(
    SELECT empno,
           ename,
           sal
    FROM emp
) AS E;


-- ============================================================
-- 2. QUERY EXECUTION ORDER
-- ============================================================

-- Logical execution order:
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY


-- ============================================================
-- 3. DENSE_RANK()
-- Rank employees based on salary.
-- Highest salary gets Rank 1.
-- Same salary gets the same rank.
-- ============================================================

SELECT empno,
       ename,
       sal,
       DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk
FROM emp;


-- ============================================================
-- 4. TOP 5 EMPLOYEES USING DENSE_RANK()
-- Directly using alias "rnk" in WHERE gives an error because
-- WHERE is logically processed before SELECT.
-- ============================================================

-- Incorrect:
-- SELECT empno,
--        ename,
--        sal,
--        DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk
-- FROM emp
-- WHERE rnk <= 5;


-- Correct: Use a Derived Table.

SELECT *
FROM
(
    SELECT empno,
           ename,
           sal,
           DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk
    FROM emp
) AS E
WHERE rnk <= 5;


-- ============================================================
-- 5. TOP 5 DISTINCT SALARIES
-- ============================================================

SELECT DISTINCT sal
FROM
(
    SELECT sal,
           DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk
    FROM emp
) AS E
WHERE rnk <= 5
ORDER BY sal DESC;


-- ============================================================
-- 6. 5TH HIGHEST SALARY
-- ============================================================

SELECT sal
FROM
(
    SELECT sal,
           DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk
    FROM emp
) AS E
WHERE rnk = 5;


-- ============================================================
-- 7. ROW_NUMBER()
-- Returns a unique sequential number based on sorting.
-- ============================================================

SELECT ROW_NUMBER() OVER (ORDER BY empno ASC) AS rno,
       empno,
       ename,
       sal
FROM emp;


-- ============================================================
-- 8. FIRST 5 ROWS
-- ============================================================

SELECT *
FROM
(
    SELECT ROW_NUMBER() OVER (ORDER BY empno ASC) AS rno,
           empno,
           ename,
           sal
    FROM emp
) AS E
WHERE rno <= 5;


-- ============================================================
-- 9. 5TH ROW
-- ============================================================

SELECT *
FROM
(
    SELECT ROW_NUMBER() OVER (ORDER BY empno ASC) AS rno,
           empno,
           ename,
           sal
    FROM emp
) AS E
WHERE rno = 5;


-- ============================================================
-- 10. 5TH AND 10TH ROW
-- ============================================================

SELECT *
FROM
(
    SELECT ROW_NUMBER() OVER (ORDER BY empno ASC) AS rno,
           empno,
           ename,
           sal
    FROM emp
) AS E
WHERE rno IN (5, 10);


-- ============================================================
-- 11. ROWS 5 TO 10
-- ============================================================

SELECT *
FROM
(
    SELECT ROW_NUMBER() OVER (ORDER BY empno ASC) AS rno,
           empno,
           ename,
           sal
    FROM emp
) AS E
WHERE rno BETWEEN 5 AND 10;


-- ============================================================
-- 12. EVEN ROWS
-- ============================================================

SELECT *
FROM
(
    SELECT ROW_NUMBER() OVER (ORDER BY empno ASC) AS rno,
           empno,
           ename,
           sal
    FROM emp
) AS E
WHERE rno % 2 = 0;


-- ============================================================
-- 13. LAST 3 ROWS
-- ============================================================

SELECT *
FROM
(
    SELECT empno,
           ename,
           sal,
           ROW_NUMBER() OVER (ORDER BY empno ASC) AS rno
    FROM emp
) AS E
WHERE rno >=
(
    SELECT COUNT(*) - 2
    FROM emp
);


-- ============================================================
-- 14. DERIVED TABLE — CONTROL EXECUTION ORDER
-- ============================================================

SELECT *
FROM
(
    SELECT empno,
           ename,
           sal,
           DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk
    FROM emp
) AS E
WHERE rnk <= 5;


-- ============================================================
-- 15. DERIVED TABLE — FILTER CALCULATED RESULTS
-- ============================================================

SELECT *
FROM
(
    SELECT empno,
           ename,
           sal,
           ROW_NUMBER() OVER (ORDER BY sal DESC) AS rno
    FROM emp
) AS E
WHERE rno <= 5;


-- ============================================================
-- 16. QUICK REVISION
-- ============================================================

-- Derived Table
-- -> Sub-query in FROM

-- DENSE_RANK()
-- -> Ranking values

-- ROW_NUMBER()
-- -> Unique sequential row number

-- rnk <= 5
-- -> Top 5 ranks

-- rno <= 5
-- -> First 5 rows

-- rnk = 5
-- -> 5th highest rank
