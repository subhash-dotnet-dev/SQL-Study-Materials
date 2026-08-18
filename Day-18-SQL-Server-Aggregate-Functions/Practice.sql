/*
============================================================
 Day 18 — SQL Server Aggregate Functions
============================================================

Topics:
1. MAX()
2. MIN()
3. SUM()
4. AVG()
5. COUNT()
6. COUNT(*)

Note:
The queries below use the existing EMP table.
Make sure the EMP table is available before executing them.

============================================================
*/

-- ============================================================
-- 01. MAX() — Find Maximum Value
-- ============================================================

-- Find the highest salary
SELECT MAX(SAL) AS MAX_SALARY
FROM EMP;


-- Find the latest joining date
SELECT MAX(HIREDATE) AS LATEST_HIREDATE
FROM EMP;


-- ============================================================
-- 02. MIN() — Find Minimum Value
-- ============================================================

-- Find the lowest salary
SELECT MIN(SAL) AS MIN_SALARY
FROM EMP;


-- Find the earliest joining date
SELECT MIN(HIREDATE) AS EARLIEST_HIREDATE
FROM EMP;


-- ============================================================
-- 03. MAX() and MIN() Together
-- ============================================================

-- Find both highest and lowest salary
SELECT
    MAX(SAL) AS MAX_SALARY,
    MIN(SAL) AS MIN_SALARY
FROM EMP;


-- ============================================================
-- 04. SUM() — Calculate Total
-- ============================================================

-- Calculate total salary
SELECT SUM(SAL) AS TOTAL_SALARY
FROM EMP;


-- Calculate total salary of managers
SELECT SUM(SAL) AS MANAGER_TOTAL_SALARY
FROM EMP
WHERE JOB = 'MANAGER';


-- ============================================================
-- 05. SUM() with ROUND()
-- ============================================================

-- Round total salary to the nearest thousand
SELECT ROUND(SUM(SAL), -3) AS ROUNDED_TOTAL_SALARY
FROM EMP;


-- Display rounded total salary with thousand separator
SELECT CONVERT(VARCHAR, ROUND(SUM(SAL), -3), 1) AS TOTAL_SALARY
FROM EMP;


-- ============================================================
-- 06. SUM() with ISNULL()
-- ============================================================

-- Calculate total salary including commission
SELECT SUM(SAL + ISNULL(COMM, 0)) AS TOTAL_SALARY_WITH_COMM
FROM EMP;


-- ============================================================
-- 07. AVG() — Calculate Average
-- ============================================================

-- Calculate average salary
SELECT AVG(SAL) AS AVERAGE_SALARY
FROM EMP;


-- Round average salary upward
SELECT CEILING(AVG(SAL)) AS CEILING_AVERAGE_SALARY
FROM EMP;


-- Round average salary downward
SELECT FLOOR(AVG(SAL)) AS FLOOR_AVERAGE_SALARY
FROM EMP;


-- ============================================================
-- 08. COUNT(column) — Count Non-NULL Values
-- ============================================================

-- Count employee numbers
SELECT COUNT(EMPNO) AS EMPLOYEE_COUNT
FROM EMP;


-- Count employees having a commission value
SELECT COUNT(COMM) AS COMMISSION_COUNT
FROM EMP;


-- Count employees having a bonus value
SELECT COUNT(BONUS) AS BONUS_COUNT
FROM EMP;


-- ============================================================
-- 09. COUNT(*) — Count All Rows
-- ============================================================

-- Count all employees
SELECT COUNT(*) AS TOTAL_EMPLOYEES
FROM EMP;


-- ============================================================
-- 10. COUNT(column) vs COUNT(*)
-- ============================================================

-- COUNT(column) ignores NULL values
-- COUNT(*) counts every row

SELECT
    COUNT(COMM) AS NON_NULL_COMM_COUNT,
    COUNT(*) AS TOTAL_EMPLOYEE_COUNT
FROM EMP;


-- ============================================================
-- 11. COUNT() with WHERE
-- ============================================================

-- Count employees who joined in 1981
SELECT COUNT(*) AS EMPLOYEES_JOINED_1981
FROM EMP
WHERE DATEPART(YEAR, HIREDATE) = 1981;


-- Count employees who joined on Sunday
SELECT COUNT(*) AS EMPLOYEES_JOINED_SUNDAY
FROM EMP
WHERE DATENAME(WEEKDAY, HIREDATE) = 'Sunday';


-- Count employees who joined in the second quarter of 1981
SELECT COUNT(*) AS EMPLOYEES_Q2_1981
FROM EMP
WHERE DATEPART(QUARTER, HIREDATE) = 2
  AND DATEPART(YEAR, HIREDATE) = 1981;


-- ============================================================
-- 12. Aggregate Functions with Conditions
-- ============================================================

-- Find highest salary among managers
SELECT MAX(SAL) AS MAX_MANAGER_SALARY
FROM EMP
WHERE JOB = 'MANAGER';


-- Find lowest salary among managers
SELECT MIN(SAL) AS MIN_MANAGER_SALARY
FROM EMP
WHERE JOB = 'MANAGER';


-- Find average salary among managers
SELECT AVG(SAL) AS AVG_MANAGER_SALARY
FROM EMP
WHERE JOB = 'MANAGER';


-- Count managers
SELECT COUNT(*) AS MANAGER_COUNT
FROM EMP
WHERE JOB = 'MANAGER';


-- ============================================================
-- 13. Multiple Aggregate Functions
-- ============================================================

SELECT
    COUNT(*) AS TOTAL_EMPLOYEES,
    MIN(SAL) AS MIN_SALARY,
    MAX(SAL) AS MAX_SALARY,
    SUM(SAL) AS TOTAL_SALARY,
    AVG(SAL) AS AVERAGE_SALARY
FROM EMP;


-- ============================================================
-- 14. Practical Salary Analysis
-- ============================================================

-- Complete salary analysis
SELECT
    MIN(SAL) AS LOWEST_SALARY,
    MAX(SAL) AS HIGHEST_SALARY,
    SUM(SAL) AS TOTAL_SALARY,
    AVG(SAL) AS AVERAGE_SALARY,
    COUNT(SAL) AS SALARY_VALUES
FROM EMP;


-- ============================================================
-- 15. Practical Employee Reporting
-- ============================================================

-- Count employees by job
SELECT
    JOB,
    COUNT(*) AS EMPLOYEE_COUNT
FROM EMP
GROUP BY JOB;


-- Calculate salary total by job
SELECT
    JOB,
    SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY JOB;


-- Calculate average salary by job
SELECT
    JOB,
    AVG(SAL) AS AVERAGE_SALARY
FROM EMP
GROUP BY JOB;


-- ============================================================
-- 16. Important: Aggregate Functions and WHERE
-- ============================================================

-- ❌ Incorrect:
-- Aggregate functions cannot be directly used in WHERE.

-- SELECT ENAME
-- FROM EMP
-- WHERE SAL = MAX(SAL);


-- ❌ Incorrect:
-- SELECT DEPTNO
-- FROM EMP
-- WHERE COUNT(*) > 3;


-- ============================================================
-- 17. Practice Challenge
-- ============================================================

-- 1. Find the highest salary in EMP.
-- 2. Find the lowest salary in EMP.
-- 3. Find the total salary.
-- 4. Find the average salary.
-- 5. Count all employees.
-- 6. Count employees having commission.
-- 7. Find the total salary of managers.
-- 8. Find the highest salary among managers.
-- 9. Find employees who joined in 1981.
-- 10. Display complete salary analysis using MAX, MIN,
--     SUM, AVG and COUNT.


-- ============================================================
-- Day 18 Practice Complete
-- LEARN → PRACTICE → DOCUMENT → IMPROVE
-- ============================================================
