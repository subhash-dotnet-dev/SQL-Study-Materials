-- ============================================================
-- Day 19 — SQL Server CASE Statement & GROUP BY
-- Practice.sql
-- ============================================================

-- ============================================================
-- 1. SIMPLE CASE
-- ============================================================

-- Display ENAME and DNAME based on DEPTNO
-- 10 -> HR
-- 20 -> IT
-- 30 -> SALES
-- Others -> UNKNOWN

SELECT ENAME,
       DEPTNO,
       CASE DEPTNO
           WHEN 10 THEN 'HR'
           WHEN 20 THEN 'IT'
           WHEN 30 THEN 'SALES'
           ELSE 'UNKNOWN'
       END AS DNAME
FROM EMP;


-- Display employee job category using Simple CASE
-- CLERK     -> STAFF
-- SALESMAN  -> SALES
-- MANAGER   -> MANAGEMENT
-- Others    -> OTHER

SELECT ENAME,
       JOB,
       CASE JOB
           WHEN 'CLERK' THEN 'STAFF'
           WHEN 'SALESMAN' THEN 'SALES'
           WHEN 'MANAGER' THEN 'MANAGEMENT'
           ELSE 'OTHER'
       END AS JOB_CATEGORY
FROM EMP;


-- ============================================================
-- 2. SEARCHED CASE
-- ============================================================

-- Display salary range
-- SAL > 3000 -> HISAL
-- SAL < 3000 -> LOSAL
-- SAL = 3000 -> AVGSAL

SELECT ENAME,
       SAL,
       CASE
           WHEN SAL > 3000 THEN 'HISAL'
           WHEN SAL < 3000 THEN 'LOSAL'
           ELSE 'AVGSAL'
       END AS SALRANGE
FROM EMP;


-- Classify employees based on salary

SELECT ENAME,
       SAL,
       CASE
           WHEN SAL >= 4000 THEN 'VERY HIGH'
           WHEN SAL >= 3000 THEN 'HIGH'
           WHEN SAL >= 2000 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS SALARY_LEVEL
FROM EMP;


-- Display experience category based on hire date

SELECT ENAME,
       HIREDATE,
       CASE
           WHEN HIREDATE < '1981-01-01' THEN 'SENIOR'
           WHEN HIREDATE < '1983-01-01' THEN 'EXPERIENCED'
           ELSE 'RECENT'
       END AS EXPERIENCE_LEVEL
FROM EMP;


-- ============================================================
-- 3. CASE WITH AND / OR
-- ============================================================

-- Classify employees based on salary and job

SELECT ENAME,
       JOB,
       SAL,
       CASE
           WHEN JOB = 'MANAGER' AND SAL >= 2500
               THEN 'MANAGER - HIGH SALARY'
           WHEN SAL >= 3000
               THEN 'HIGH SALARY'
           WHEN SAL >= 1500
               THEN 'MEDIUM SALARY'
           ELSE 'LOW SALARY'
       END AS CATEGORY
FROM EMP;


-- ============================================================
-- 4. GROUP BY — BASIC PRACTICE
-- ============================================================

-- Display department-wise number of employees

SELECT DEPTNO,
       COUNT(*) AS EMPLOYEE_COUNT
FROM EMP
GROUP BY DEPTNO;


-- Display job-wise number of employees

SELECT JOB,
       COUNT(*) AS EMPLOYEE_COUNT
FROM EMP
GROUP BY JOB;


-- Display department-wise total salary

SELECT DEPTNO,
       SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY DEPTNO;


-- Display department-wise average salary

SELECT DEPTNO,
       AVG(SAL) AS AVG_SALARY
FROM EMP
GROUP BY DEPTNO;


-- Display department-wise minimum and maximum salary

SELECT DEPTNO,
       MIN(SAL) AS MIN_SALARY,
       MAX(SAL) AS MAX_SALARY
FROM EMP
GROUP BY DEPTNO;


-- ============================================================
-- 5. GROUP BY WITH MULTIPLE AGGREGATE FUNCTIONS
-- ============================================================

-- Display job-wise:
-- minimum salary
-- maximum salary
-- total salary
-- average salary
-- number of employees

SELECT JOB,
       MIN(SAL) AS MIN_SAL,
       MAX(SAL) AS MAX_SAL,
       SUM(SAL) AS TOTAL_SAL,
       AVG(SAL) AS AVG_SAL,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY JOB;


-- ============================================================
-- 6. MULTIPLE-COLUMN GROUP BY
-- ============================================================

-- Department-wise and job-wise employee count

SELECT DEPTNO,
       JOB,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;


-- Department-wise and job-wise total salary

SELECT DEPTNO,
       JOB,
       SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;


-- Department-wise and job-wise average salary

SELECT DEPTNO,
       JOB,
       AVG(SAL) AS AVG_SALARY
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;


-- ============================================================
-- 7. WHERE + GROUP BY
-- ============================================================

-- Display employee count for CLERK and MANAGER jobs

SELECT JOB,
       COUNT(*) AS EMP_COUNT
FROM EMP
WHERE JOB IN ('CLERK', 'MANAGER')
GROUP BY JOB;


-- Display department-wise employee count for employees
-- earning more than 1000

SELECT DEPTNO,
       COUNT(*) AS EMP_COUNT
FROM EMP
WHERE SAL > 1000
GROUP BY DEPTNO;


-- Display job-wise total salary for employees
-- earning more than 1000

SELECT JOB,
       SUM(SAL) AS TOTAL_SALARY
FROM EMP
WHERE SAL > 1000
GROUP BY JOB;


-- ============================================================
-- 8. HAVING PRACTICE
-- ============================================================

-- Find departments having more than 3 employees

SELECT DEPTNO,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3;


-- Find jobs having more than 2 employees

SELECT JOB,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY JOB
HAVING COUNT(*) > 2;


-- Find departments where total salary is greater than 9000

SELECT DEPTNO,
       SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) > 9000;


-- Find jobs where average salary is greater than 2000

SELECT JOB,
       AVG(SAL) AS AVG_SALARY
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) > 2000;


-- ============================================================
-- 9. WHERE + GROUP BY + HAVING
-- ============================================================

-- Display CLERK and MANAGER jobs
-- having more than 3 employees

SELECT JOB,
       COUNT(*) AS EMP_COUNT
FROM EMP
WHERE JOB IN ('CLERK', 'MANAGER')
GROUP BY JOB
HAVING COUNT(*) > 3;


-- Find departments with employees earning above 1000
-- and total filtered salary greater than 5000

SELECT DEPTNO,
       SUM(SAL) AS TOTAL_SALARY
FROM EMP
WHERE SAL > 1000
GROUP BY DEPTNO
HAVING SUM(SAL) > 5000;


-- ============================================================
-- 10. YEAR-WISE GROUPING
-- ============================================================

-- Display year-wise number of employees joined

SELECT DATEPART(YY, HIREDATE) AS YEAR,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DATEPART(YY, HIREDATE)
ORDER BY YEAR;


-- ============================================================
-- 11. MONTH-WISE GROUPING
-- ============================================================

-- Display month-wise number of employees joined

SELECT DATENAME(MM, HIREDATE) AS MONTH,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DATENAME(MM, HIREDATE);


-- Month-wise employees joined in 1981

SELECT DATENAME(MM, HIREDATE) AS MONTH,
       COUNT(*) AS EMP_COUNT
FROM EMP
WHERE DATEPART(YY, HIREDATE) = 1981
GROUP BY DATENAME(MM, HIREDATE);


-- ============================================================
-- 12. DAY-WISE GROUPING
-- ============================================================

-- Display day-wise number of employees joined

SELECT DATENAME(DW, HIREDATE) AS DAY,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DATENAME(DW, HIREDATE);


-- ============================================================
-- 13. QUARTER-WISE GROUPING
-- ============================================================

-- Display quarter-wise number of employees joined

SELECT DATEPART(QQ, HIREDATE) AS QUARTER,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DATEPART(QQ, HIREDATE)
ORDER BY QUARTER;


-- ============================================================
-- 14. YEAR-WISE + QUARTER-WISE GROUPING
-- ============================================================

SELECT DATEPART(YY, HIREDATE) AS YEAR,
       DATEPART(QQ, HIREDATE) AS QUARTER,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DATEPART(YY, HIREDATE),
         DATEPART(QQ, HIREDATE)
ORDER BY YEAR, QUARTER;


-- ============================================================
-- 15. YEAR-WISE + MONTH-WISE GROUPING
-- ============================================================

SELECT DATEPART(YY, HIREDATE) AS YEAR,
       DATENAME(MM, HIREDATE) AS MONTH,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DATEPART(YY, HIREDATE),
         DATENAME(MM, HIREDATE)
ORDER BY YEAR;


-- ============================================================
-- 16. CASE + GROUP BY
-- ============================================================

-- Create salary categories and count employees

SELECT
    CASE
        WHEN SAL >= 3000 THEN 'HIGH'
        WHEN SAL >= 1500 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS SALARY_CATEGORY,
    COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY
    CASE
        WHEN SAL >= 3000 THEN 'HIGH'
        WHEN SAL >= 1500 THEN 'MEDIUM'
        ELSE 'LOW'
    END;


-- ============================================================
-- 17. CASE + AGGREGATE
-- ============================================================

-- Department-wise count of high salary employees

SELECT DEPTNO,
       SUM(
           CASE
               WHEN SAL >= 3000 THEN 1
               ELSE 0
           END
       ) AS HIGH_SALARY_EMPLOYEES
FROM EMP
GROUP BY DEPTNO;


-- ============================================================
-- 18. ORDER BY WITH GROUP BY
-- ============================================================

-- Display departments by highest employee count

SELECT DEPTNO,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DEPTNO
ORDER BY EMP_COUNT DESC;


-- Display jobs by highest total salary

SELECT JOB,
       SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY JOB
ORDER BY TOTAL_SALARY DESC;


-- ============================================================
-- 19. INTERVIEW PRACTICE
-- ============================================================

-- Q1. Find the department having the highest number of employees.

SELECT TOP 1
       DEPTNO,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DEPTNO
ORDER BY EMP_COUNT DESC;


-- Q2. Find the job having the highest total salary.

SELECT TOP 1
       JOB,
       SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY JOB
ORDER BY TOTAL_SALARY DESC;


-- Q3. Find departments having average salary greater than 2000.

SELECT DEPTNO,
       AVG(SAL) AS AVG_SALARY
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) > 2000;


-- Q4. Find jobs having minimum salary greater than 1000.

SELECT JOB,
       MIN(SAL) AS MIN_SALARY
FROM EMP
GROUP BY JOB
HAVING MIN(SAL) > 1000;


-- Q5. Display department-wise employee count
-- only for departments 10, 20 and 30.

SELECT DEPTNO,
       COUNT(*) AS EMP_COUNT
FROM EMP
WHERE DEPTNO IN (10, 20, 30)
GROUP BY DEPTNO
ORDER BY DEPTNO;


-- ============================================================
-- 20. WHERE vs HAVING — PRACTICE
-- ============================================================

-- WHERE filters rows BEFORE GROUP BY

SELECT DEPTNO,
       COUNT(*) AS EMP_COUNT
FROM EMP
WHERE SAL > 2000
GROUP BY DEPTNO;


-- HAVING filters groups AFTER GROUP BY

SELECT DEPTNO,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3;


-- WHERE + HAVING together

SELECT DEPTNO,
       COUNT(*) AS EMP_COUNT
FROM EMP
WHERE SAL > 1000
GROUP BY DEPTNO
HAVING COUNT(*) > 2;


-- ============================================================
-- 21. COLUMN ALIAS — GROUP BY vs ORDER BY
-- ============================================================

-- Alias cannot normally be used in GROUP BY

SELECT DATEPART(YY, HIREDATE) AS YEAR,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DATEPART(YY, HIREDATE);


-- Alias can be used in ORDER BY

SELECT DATEPART(YY, HIREDATE) AS YEAR,
       COUNT(*) AS EMP_COUNT
FROM EMP
GROUP BY DATEPART(YY, HIREDATE)
ORDER BY YEAR;


-- ============================================================
-- 22. SQL EXECUTION ORDER
-- ============================================================

-- Logical execution order:
--
-- FROM
--   ↓
-- WHERE
--   ↓
-- GROUP BY
--   ↓
-- HAVING
--   ↓
-- SELECT
--   ↓
-- ORDER BY


-- ============================================================
-- DAY 19 PRACTICE COMPLETE
-- ============================================================

-- LEARN → PRACTICE → DOCUMENT → IMPROVE
-- SQL Learning Journey — Day 19
