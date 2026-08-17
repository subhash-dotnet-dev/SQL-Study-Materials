-- ============================================================
-- Day 16 — SQL Server Numeric & Conversion Functions
-- Topics:
-- ROUND(), FLOOR(), CEILING(), CAST(), CONVERT()
-- ============================================================


-- ============================================================
-- 1. ROUND() — Basic Examples
-- ============================================================

-- Round to nearest integer
SELECT ROUND(38.45678, 0) AS Rounded_Value;

-- Round to 2 decimal places
SELECT ROUND(38.45678, 2) AS Rounded_Value;

-- Round to 4 decimal places
SELECT ROUND(38.45678, 4) AS Rounded_Value;

-- Round to nearest ten
SELECT ROUND(386, -1) AS Rounded_Value;

-- Round to nearest hundred
SELECT ROUND(386, -2) AS Rounded_Value;

-- Round to nearest thousand
SELECT ROUND(4567, -3) AS Rounded_Value;


-- ============================================================
-- 2. ROUND() — Employee Salary Examples
-- Requires existing EMP table with SAL column
-- ============================================================

-- Display original and rounded salary
SELECT ENAME,
       SAL,
       ROUND(SAL, -2) AS Rounded_Salary
FROM EMP;

-- Round salary to nearest hundred
-- Optional UPDATE: modifies the existing data
-- UPDATE EMP
-- SET SAL = ROUND(SAL, -2);


-- ============================================================
-- 3. FLOOR() — Basic Examples
-- ============================================================

-- Round down to the lowest integer
SELECT FLOOR(3.9) AS Floor_Value;

SELECT FLOOR(10.99) AS Floor_Value;

SELECT FLOOR(25.75) AS Floor_Value;


-- ============================================================
-- 4. FLOOR() — Employee Salary Example
-- Requires existing EMP table
-- ============================================================

SELECT ENAME,
       SAL,
       FLOOR(SAL) AS Floor_Salary
FROM EMP;


-- ============================================================
-- 5. CEILING() — Basic Examples
-- ============================================================

-- Round up to the highest integer
SELECT CEILING(3.1) AS Ceiling_Value;

SELECT CEILING(10.01) AS Ceiling_Value;

SELECT CEILING(25.25) AS Ceiling_Value;


-- ============================================================
-- 6. CEILING() — Employee Salary Example
-- Requires existing EMP table
-- ============================================================

SELECT ENAME,
       SAL,
       CEILING(SAL) AS Ceiling_Salary
FROM EMP;


-- ============================================================
-- 7. FLOOR() vs CEILING()
-- ============================================================

SELECT
    3.9 AS Original_Value,
    FLOOR(3.9) AS Floor_Value,
    CEILING(3.9) AS Ceiling_Value;


-- ============================================================
-- 8. CAST() — Basic Conversion
-- ============================================================

-- Convert DECIMAL value to INT
SELECT CAST(10.5 AS INT) AS Converted_Value;

-- Convert integer to VARCHAR
SELECT CAST(1000 AS VARCHAR(20)) AS Converted_Value;

-- Convert decimal to VARCHAR
SELECT CAST(1500.75 AS VARCHAR(20)) AS Converted_Value;


-- ============================================================
-- 9. CAST() — Employee Salary Conversion
-- Requires existing EMP table
-- ============================================================

-- Convert salary to text
SELECT ENAME,
       CAST(SAL AS VARCHAR(20)) AS Salary_Text
FROM EMP;


-- ============================================================
-- 10. CAST() — String Concatenation
-- Requires existing EMP table
-- ============================================================

-- Display employee name with salary
SELECT ENAME + ' earns ' + CAST(SAL AS VARCHAR(20)) AS Employee_Salary
FROM EMP;

-- Display employee name, job and hire date
SELECT ENAME
       + ' joined as '
       + JOB
       + ' on '
       + CAST(HIREDATE AS VARCHAR(30)) AS Employee_Details
FROM EMP;


-- ============================================================
-- 11. CONVERT() — Basic Conversion
-- ============================================================

-- Convert decimal to integer
SELECT CONVERT(INT, 10.5) AS Converted_Value;

-- Convert integer to VARCHAR
SELECT CONVERT(VARCHAR(20), 1000) AS Converted_Value;

-- Convert decimal to VARCHAR
SELECT CONVERT(VARCHAR(20), 1500.75) AS Converted_Value;


-- ============================================================
-- 12. CONVERT() — Date Formatting
-- ============================================================

-- Style 101 → MM/DD/YYYY
SELECT CONVERT(VARCHAR, GETDATE(), 101) AS Formatted_Date;

-- Style 104 → DD.MM.YYYY
SELECT CONVERT(VARCHAR, GETDATE(), 104) AS Formatted_Date;

-- Style 110 → MM-DD-YYYY
SELECT CONVERT(VARCHAR, GETDATE(), 110) AS Formatted_Date;

-- Style 112 → YYYYMMDD
SELECT CONVERT(VARCHAR, GETDATE(), 112) AS Formatted_Date;

-- Style 114 → HH:MI:SS:MMM
SELECT CONVERT(VARCHAR, GETDATE(), 114) AS Formatted_Date;


-- ============================================================
-- 13. CONVERT() — Employee Hire Date Formatting
-- Requires existing EMP table with HIREDATE column
-- ============================================================

-- Display hire date as MM/DD/YYYY
SELECT ENAME,
       CONVERT(VARCHAR, HIREDATE, 101) AS Hire_Date
FROM EMP;

-- Display hire date as DD.MM.YYYY
SELECT ENAME,
       CONVERT(VARCHAR, HIREDATE, 104) AS Hire_Date
FROM EMP;

-- Display hire date as YYYYMMDD
SELECT ENAME,
       CONVERT(VARCHAR, HIREDATE, 112) AS Hire_Date
FROM EMP;


-- ============================================================
-- 14. CONVERT() — Salary Formatting
-- Style 1 displays comma separators and two decimal places
-- ============================================================

-- Display salary with thousand separators
SELECT ENAME,
       CONVERT(VARCHAR, CAST(SAL AS MONEY), 1) AS Formatted_Salary
FROM EMP;


-- ============================================================
-- 15. CAST() vs CONVERT() — Practical Comparison
-- ============================================================

SELECT
    ENAME,
    CAST(SAL AS VARCHAR(20)) AS Using_CAST,
    CONVERT(VARCHAR(20), SAL) AS Using_CONVERT
FROM EMP;


-- ============================================================
-- 16. Combined Numeric Functions
-- Requires existing EMP table
-- ============================================================

SELECT
    ENAME,
    SAL,
    ROUND(SAL, -2) AS Rounded_Salary,
    FLOOR(SAL) AS Floor_Salary,
    CEILING(SAL) AS Ceiling_Salary
FROM EMP;


-- ============================================================
-- 17. Practical Reporting Example
-- Requires existing EMP table
-- ============================================================

SELECT
    ENAME,
    CONVERT(VARCHAR, HIREDATE, 101) AS Hire_Date,
    CONVERT(VARCHAR, CAST(SAL AS MONEY), 1) AS Salary
FROM EMP;


-- ============================================================
-- 18. Practical Employee Information
-- Requires existing EMP table
-- ============================================================

SELECT
    ENAME
    + ' earns '
    + CONVERT(VARCHAR(20), SAL) AS Employee_Salary
FROM EMP;


-- ============================================================
-- 19. Salary Rounding + Conversion
-- Requires existing EMP table
-- ============================================================

SELECT
    ENAME,
    SAL,
    CONVERT(
        VARCHAR(20),
        CAST(ROUND(SAL, -2) AS MONEY),
        1
    ) AS Rounded_Salary
FROM EMP;


-- ============================================================
-- 20. Day 16 Practice Complete
-- LEARN → PRACTICE → DOCUMENT → IMPROVE
-- ============================================================
