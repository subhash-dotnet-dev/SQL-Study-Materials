-- ============================================================
-- DAY 13 - SQL SERVER BUILT-IN FUNCTIONS
-- Topics: Functions, GETDATE, DATEPART, DATENAME, String Concatenation
-- ============================================================


-- ============================================================
-- 1. BUILT-IN FUNCTIONS
-- ============================================================

-- A function accepts input, performs a calculation,
-- and returns a value.

-- Types of Functions:
-- 1. Date Functions
-- 2. Character / String Functions
-- 3. Numeric / Mathematical Functions
-- 4. Conversion Functions
-- 5. Special Functions
-- 6. Analytical Functions
-- 7. Aggregate Functions


-- ============================================================
-- 2. GETDATE()
-- ============================================================

-- Returns the current date and time.

SELECT GETDATE();


-- ============================================================
-- 3. DATEPART()
-- ============================================================

-- Returns a specific part of a date.

-- Syntax:
-- DATEPART(interval, date)


-- Get current year
SELECT DATEPART(YY, GETDATE()) AS CURRENT_YEAR;


-- Get current month
SELECT DATEPART(MM, GETDATE()) AS CURRENT_MONTH;


-- Get current day
SELECT DATEPART(DD, GETDATE()) AS CURRENT_DAY;


-- Get day of week
SELECT DATEPART(DW, GETDATE()) AS DAY_OF_WEEK;


-- Get day of year
SELECT DATEPART(DY, GETDATE()) AS DAY_OF_YEAR;


-- Get hour
SELECT DATEPART(HH, GETDATE()) AS CURRENT_HOUR;


-- Get minute
SELECT DATEPART(MI, GETDATE()) AS CURRENT_MINUTE;


-- Get second
SELECT DATEPART(SS, GETDATE()) AS CURRENT_SECOND;


-- Get quarter
SELECT DATEPART(QQ, GETDATE()) AS CURRENT_QUARTER;


-- ============================================================
-- 4. DISPLAY EMPLOYEE NAME AND YEAR OF JOINING
-- ============================================================

SELECT ENAME,
       DATEPART(YY, HIREDATE) AS YEAR_OF_JOIN
FROM EMP;


-- ============================================================
-- 5. EMPLOYEES JOINED IN 1980, 1983 OR 1985
-- ============================================================

SELECT *
FROM EMP
WHERE DATEPART(YY, HIREDATE) IN (1980, 1983, 1985);


-- ============================================================
-- 6. EMPLOYEES JOINED IN A LEAP YEAR
-- ============================================================

SELECT *
FROM EMP
WHERE DATEPART(YY, HIREDATE) % 4 = 0;


-- ============================================================
-- 7. EMPLOYEES JOINED IN JANUARY, APRIL OR DECEMBER
-- ============================================================

SELECT *
FROM EMP
WHERE DATEPART(MM, HIREDATE) IN (1, 4, 12);


-- ============================================================
-- 8. EMPLOYEES JOINED IN 2ND QUARTER OF 1981
-- ============================================================

SELECT *
FROM EMP
WHERE DATEPART(QQ, HIREDATE) = 2
AND DATEPART(YY, HIREDATE) = 1981;


-- ============================================================
-- 9. DATENAME()
-- ============================================================

-- DATENAME returns the name of a specific date part.

-- Syntax:
-- DATENAME(interval, date)


-- Display employee name and day of joining
SELECT ENAME,
       DATENAME(DW, HIREDATE) AS DAY
FROM EMP;


-- ============================================================
-- 10. EMPLOYEES WHO JOINED ON SUNDAY
-- ============================================================

SELECT *
FROM EMP
WHERE DATENAME(DW, HIREDATE) = 'Sunday';


-- ============================================================
-- 11. DAY OF INDIAN INDEPENDENCE
-- ============================================================

SELECT DATENAME(DW, '1947-08-15') AS DAY_OF_INDEPENDENCE;


-- ============================================================
-- 12. STRING CONCATENATION
-- ============================================================

-- + is used as the string concatenation operator.

SELECT 'A' + 'B' AS RESULT;


SELECT 'A' + ' ' + 'B' AS RESULT;


-- ============================================================
-- 13. DISPLAY EMPLOYEE NAME WITH JOINING DAY
-- ============================================================

SELECT ENAME
       + ' JOINED ON '
       + DATENAME(DW, HIREDATE) AS EMPLOYEE_JOINING_DAY
FROM EMP;
