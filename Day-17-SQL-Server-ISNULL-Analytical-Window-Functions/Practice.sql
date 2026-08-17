-- ============================================================
-- Day 17 - SQL Server Special & Analytical / Window Functions
-- Topics:
-- ISNULL(), RANK(), DENSE_RANK(), PARTITION BY,
-- ROW_NUMBER(), LAG(), LEAD()
-- ============================================================


-- ============================================================
-- 1. ISNULL() - Handling NULL Values
-- ============================================================

-- Replace NULL with an alternative value
SELECT ISNULL(100, 200) AS RESULT;

SELECT ISNULL(NULL, 200) AS RESULT;


-- Display employee salary, bonus and total salary
-- Assumes EMP table contains SAL and BONUS columns
SELECT
    ENAME,
    SAL,
    BONUS,
    SAL + ISNULL(BONUS, 0) AS TOTSAL
FROM EMP;


-- Display "NO BONUS" when BONUS is NULL
SELECT
    ENAME,
    SAL,
    ISNULL(CAST(BONUS AS VARCHAR(20)), 'NO BONUS') AS BONUS
FROM EMP;


-- ============================================================
-- 2. RANK() - Employee Salary Ranking
-- ============================================================

-- Highest-paid employee gets Rank 1
SELECT
    EMPNO,
    ENAME,
    SAL,
    RANK() OVER (ORDER BY SAL DESC) AS RNK
FROM EMP;


-- Rank employees based on salary and hire date
-- Salary: Highest first
-- Hire date: Earliest first when salary is same
SELECT
    EMPNO,
    ENAME,
    HIREDATE,
    SAL,
    RANK() OVER (
        ORDER BY SAL DESC, HIREDATE ASC
    ) AS RNK
FROM EMP;


-- ============================================================
-- 3. DENSE_RANK() - Employee Salary Ranking
-- ============================================================

-- Dense ranking does not leave gaps after duplicate salaries
SELECT
    EMPNO,
    ENAME,
    SAL,
    DENSE_RANK() OVER (ORDER BY SAL DESC) AS DRNK
FROM EMP;


-- Compare RANK() and DENSE_RANK()
SELECT
    EMPNO,
    ENAME,
    SAL,
    RANK() OVER (ORDER BY SAL DESC) AS RNK,
    DENSE_RANK() OVER (ORDER BY SAL DESC) AS DRNK
FROM EMP;


-- ============================================================
-- 4. PARTITION BY - Department-wise Ranking
-- ============================================================

-- Rank employees within each department
SELECT
    EMPNO,
    ENAME,
    SAL,
    DEPTNO,
    DENSE_RANK() OVER (
        PARTITION BY DEPTNO
        ORDER BY SAL DESC
    ) AS RNK
FROM EMP;


-- Rank employees within each department using RANK()
SELECT
    EMPNO,
    ENAME,
    SAL,
    DEPTNO,
    RANK() OVER (
        PARTITION BY DEPTNO
        ORDER BY SAL DESC
    ) AS RNK
FROM EMP;


-- ============================================================
-- 5. ROW_NUMBER() - Sequential Row Number
-- ============================================================

-- Assign unique row numbers based on salary
SELECT
    EMPNO,
    ENAME,
    SAL,
    ROW_NUMBER() OVER (ORDER BY SAL DESC) AS RNO
FROM EMP;


-- Assign row numbers based on employee number
SELECT
    EMPNO,
    ENAME,
    SAL,
    ROW_NUMBER() OVER (ORDER BY EMPNO ASC) AS RNO
FROM EMP;


-- Row number within each department
SELECT
    EMPNO,
    ENAME,
    SAL,
    DEPTNO,
    ROW_NUMBER() OVER (
        PARTITION BY DEPTNO
        ORDER BY SAL DESC
    ) AS RNO
FROM EMP;


-- ============================================================
-- 6. RANK() vs DENSE_RANK() vs ROW_NUMBER()
-- ============================================================

SELECT
    EMPNO,
    ENAME,
    SAL,
    RANK() OVER (ORDER BY SAL DESC) AS RNK,
    DENSE_RANK() OVER (ORDER BY SAL DESC) AS DRNK,
    ROW_NUMBER() OVER (ORDER BY SAL DESC) AS RNO
FROM EMP;


-- ============================================================
-- 7. LAG() - Previous Row Value
-- ============================================================

-- Display previous employee salary
SELECT
    EMPNO,
    ENAME,
    SAL,
    LAG(SAL, 1) OVER (ORDER BY EMPNO ASC) AS PREV_SAL
FROM EMP;


-- Compare current salary with previous salary
SELECT
    EMPNO,
    ENAME,
    SAL,
    LAG(SAL, 1) OVER (ORDER BY EMPNO ASC) AS PREV_SAL,
    SAL - LAG(SAL, 1) OVER (ORDER BY EMPNO ASC) AS SALARY_DIFFERENCE
FROM EMP;


-- Display previous employee hire date
SELECT
    ENAME,
    HIREDATE,
    LAG(HIREDATE, 1) OVER (ORDER BY HIREDATE ASC) AS PREV_HIREDATE
FROM EMP;


-- ============================================================
-- 8. LEAD() - Next Row Value
-- ============================================================

-- Display next employee salary
SELECT
    EMPNO,
    ENAME,
    SAL,
    LEAD(SAL, 1) OVER (ORDER BY EMPNO ASC) AS NEXT_SAL
FROM EMP;


-- Compare current salary with next salary
SELECT
    EMPNO,
    ENAME,
    SAL,
    LEAD(SAL, 1) OVER (ORDER BY EMPNO ASC) AS NEXT_SAL,
    LEAD(SAL, 1) OVER (ORDER BY EMPNO ASC) - SAL AS NEXT_SAL_DIFFERENCE
FROM EMP;


-- ============================================================
-- 9. LAG() & LEAD() Together
-- ============================================================

SELECT
    EMPNO,
    ENAME,
    SAL,
    LAG(SAL, 1) OVER (ORDER BY EMPNO ASC) AS PREV_SAL,
    LEAD(SAL, 1) OVER (ORDER BY EMPNO ASC) AS NEXT_SAL
FROM EMP;


-- ============================================================
-- 10. Practical Sales Growth Scenario
-- ============================================================

-- Create a temporary sales table for practice
CREATE TABLE SALES_2025
(
    QTR INT,
    AMT DECIMAL(10,2)
);


-- Insert sample quarterly sales
INSERT INTO SALES_2025 (QTR, AMT)
VALUES
(1, 300),
(2, 180),
(3, 450),
(4, 280);


-- Display current and previous quarter sales
SELECT
    QTR,
    AMT,
    LAG(AMT, 1) OVER (ORDER BY QTR ASC) AS PREV_QTR
FROM SALES_2025;


-- Calculate sales growth compared with previous quarter
SELECT
    QTR,
    AMT,
    LAG(AMT, 1) OVER (ORDER BY QTR ASC) AS PREV_QTR,
    AMT - LAG(AMT, 1) OVER (ORDER BY QTR ASC) AS GROWTH
FROM SALES_2025;


-- ============================================================
-- 11. Population Growth Analysis
-- ============================================================

-- Create population table
CREATE TABLE POPULATION
(
    YEAR INT,
    POPULATION NUMERIC(18,0)
);


-- Insert sample population data
INSERT INTO POPULATION (YEAR, POPULATION)
VALUES
(2015, 1328024498),
(2020, 1402617695),
(2022, 1425423212),
(2023, 1438069596),
(2024, 1450935791);


-- Display population growth compared with previous year
SELECT
    YEAR,
    POPULATION,
    LAG(POPULATION, 1) OVER (ORDER BY YEAR ASC) AS PREV_POPULATION,
    POPULATION
        - LAG(POPULATION, 1) OVER (ORDER BY YEAR ASC) AS GROWTH
FROM POPULATION;


-- Calculate population growth percentage
SELECT
    YEAR,
    POPULATION,
    LAG(POPULATION, 1) OVER (ORDER BY YEAR ASC) AS PREV_POPULATION,
    CAST(
        (
            (POPULATION - LAG(POPULATION, 1) OVER (ORDER BY YEAR ASC))
            * 100.0
        )
        / NULLIF(LAG(POPULATION, 1) OVER (ORDER BY YEAR ASC), 0)
        AS DECIMAL(10,2)
    ) AS GROWTH_PERCENT
FROM POPULATION;


-- ============================================================
-- 12. Practical Department-wise Analysis
-- ============================================================

-- Find the highest-paid employees in each department
SELECT
    EMPNO,
    ENAME,
    DEPTNO,
    SAL,
    DENSE_RANK() OVER (
        PARTITION BY DEPTNO
        ORDER BY SAL DESC
    ) AS DEPT_RANK
FROM EMP;


-- Assign unique row numbers to employees within each department
SELECT
    EMPNO,
    ENAME,
    DEPTNO,
    SAL,
    ROW_NUMBER() OVER (
        PARTITION BY DEPTNO
        ORDER BY SAL DESC
    ) AS DEPT_ROW_NUMBER
FROM EMP;


-- ============================================================
-- Day 17 Practice Complete
-- LEARN -> PRACTICE -> DOCUMENT -> IMPROVE
-- ============================================================
