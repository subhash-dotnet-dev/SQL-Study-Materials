-- ============================================================
-- SQL LEARNING JOURNEY - DAY 28
-- CROSS / CARTESIAN JOIN
-- ============================================================


-- ============================================================
-- 1. BASIC CROSS JOIN
-- ============================================================

-- CROSS JOIN returns the Cartesian Product
-- Every row from the first table is combined
-- with every row from the second table.

SELECT e.ename,
       d.dname
FROM emp AS e
CROSS JOIN dept AS d;


-- ============================================================
-- 2. EMP × DEPT
-- ============================================================

-- EMP = 14 rows
-- DEPT = 4 rows
-- Result = 14 × 4 = 56 rows

SELECT e.ename,
       d.dname
FROM emp AS e
CROSS JOIN dept AS d;


-- ============================================================
-- 3. DISPLAY ALL EMPLOYEE AND DEPARTMENT COMBINATIONS
-- ============================================================

SELECT e.empno,
       e.ename,
       e.sal,
       d.deptno,
       d.dname,
       d.loc
FROM emp AS e
CROSS JOIN dept AS d;


-- ============================================================
-- 4. FOOD AND DRINK TABLES
-- ============================================================

-- Create FOOD table

CREATE TABLE F
(
    NAME  VARCHAR(20),
    PRICE INT
);


-- Insert FOOD data

INSERT INTO F
VALUES
('BURGER', 120),
('PIZZA', 150);


-- Create DRINK table

CREATE TABLE D
(
    NAME  VARCHAR(20),
    PRICE INT
);


-- Insert DRINK data

INSERT INTO D
VALUES
('THUMSUP', 20),
('JUICE', 60);


-- ============================================================
-- 5. CROSS JOIN FOOD AND DRINK
-- ============================================================

SELECT F.NAME,
       F.PRICE,
       D.NAME,
       D.PRICE
FROM F
CROSS JOIN D;


-- ============================================================
-- 6. FOOD + DRINK COMBINATIONS
-- ============================================================

SELECT F.NAME + ' + ' + D.NAME AS COMBINATION
FROM F
CROSS JOIN D;


-- ============================================================
-- 7. CALCULATE TOTAL PRICE
-- ============================================================

SELECT F.NAME + ' + ' + D.NAME AS COMBINATION,
       F.PRICE + D.PRICE AS TOTAL
FROM F
CROSS JOIN D;


-- ============================================================
-- 8. DISPLAY FOOD, DRINK AND TOTAL PRICE
-- ============================================================

SELECT F.NAME AS FOOD,
       F.PRICE AS FOOD_PRICE,
       D.NAME AS DRINK,
       D.PRICE AS DRINK_PRICE,
       F.PRICE + D.PRICE AS TOTAL
FROM F
CROSS JOIN D;


-- ============================================================
-- 9. DISPLAY ONLY COMBINATION AND TOTAL
-- ============================================================

SELECT F.NAME + ' + ' + D.NAME AS COMBINATION,
       F.PRICE + D.PRICE AS TOTAL
FROM F
CROSS JOIN D;


-- ============================================================
-- EXPECTED OUTPUT
-- ============================================================

-- BURGER + THUMSUP    140
-- BURGER + JUICE      180
-- PIZZA + THUMSUP     170
-- PIZZA + JUICE       210


-- ============================================================
-- 10. RESULT COUNT EXAMPLES
-- ============================================================

-- If Table A has 2 rows
-- and Table B has 2 rows:

-- 2 × 2 = 4 rows


-- EMP = 14 rows
-- DEPT = 4 rows

-- 14 × 4 = 56 rows


-- ============================================================
-- 11. CROSS JOIN WITH SELECTED COLUMNS
-- ============================================================

SELECT e.ename,
       d.dname,
       d.loc
FROM emp AS e
CROSS JOIN dept AS d;


-- ============================================================
-- 12. CROSS JOIN WITHOUT TABLE ALIASES
-- ============================================================

SELECT emp.ename,
       dept.dname
FROM emp
CROSS JOIN dept;


-- ============================================================
-- 13. CROSS JOIN RESULT COUNT
-- ============================================================

-- Count EMP rows

SELECT COUNT(*) AS EMP_COUNT
FROM emp;


-- Count DEPT rows

SELECT COUNT(*) AS DEPT_COUNT
FROM dept;


-- CROSS JOIN row count

SELECT COUNT(*) AS TOTAL_ROWS
FROM emp
CROSS JOIN dept;


-- ============================================================
-- 14. PRACTICAL COMBINATION EXAMPLE
-- ============================================================

-- Generate every possible Food + Drink combination

SELECT F.NAME + ' + ' + D.NAME AS COMBINATION
FROM F
CROSS JOIN D;


-- ============================================================
-- 15. CROSS JOIN WITH CALCULATED TOTAL
-- ============================================================

SELECT F.NAME + ' + ' + D.NAME AS COMBINATION,
       F.PRICE + D.PRICE AS TOTAL
FROM F
CROSS JOIN D;


-- ============================================================
-- QUICK REVISION
-- ============================================================

-- CROSS JOIN
--     ↓
-- CARTESIAN PRODUCT
--
-- EVERY ROW × EVERY ROW
--     ↓
-- ALL POSSIBLE COMBINATIONS
--
-- NO ON CONDITION
--     ↓
-- CROSS JOIN
--
-- m × n
--     ↓
-- RESULT ROWS
--
-- Example:
-- 14 × 4 = 56
