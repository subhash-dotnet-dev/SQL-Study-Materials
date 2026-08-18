/* =========================================================
   SQL LEARNING JOURNEY — DAY 20
   Topics:
   1. ROLLUP()
   2. CUBE()
   3. GROUPING_ID()
   4. Range Grouping
   5. Duplicate Record Detection
   ========================================================= */


/* =========================================================
   1. ROLLUP()
   ========================================================= */

-- Department-wise and Job-wise total salary
-- Also display Department Subtotal and Grand Total

SELECT
    DEPTNO,
    JOB,
    SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;


-- Year-wise and Quarter-wise sales
-- Also display Year Subtotal and Grand Total

SELECT
    YEAR(DATEID) AS SALES_YEAR,
    DATEPART(QUARTER, DATEID) AS SALES_QUARTER,
    SUM(AMT) AS TOTAL_AMOUNT
FROM SALES
GROUP BY ROLLUP(
    YEAR(DATEID),
    DATEPART(QUARTER, DATEID)
)
ORDER BY SALES_YEAR, SALES_QUARTER;


/* =========================================================
   2. CUBE()
   ========================================================= */

-- Department + Job-wise salary
-- Department Subtotal + Job Subtotal + Grand Total

SELECT
    DEPTNO,
    JOB,
    SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;


-- State-wise and Gender-wise number of persons
-- Includes State Subtotal, Gender Subtotal and Grand Total

SELECT
    STATE,
    GENDER,
    COUNT(*) AS TOTAL_PERSONS
FROM PERSONS
GROUP BY CUBE(STATE, GENDER)
ORDER BY STATE, GENDER;


/* =========================================================
   3. GROUPING_ID()
   ========================================================= */

-- Identify Department Subtotal,
-- Job Subtotal and Grand Total

SELECT
    DEPTNO,
    JOB,
    SUM(SAL) AS TOTAL_SALARY,
    GROUPING_ID(DEPTNO, JOB) AS GID
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;


-- Display meaningful subtotal labels

SELECT
    DEPTNO,
    JOB,
    SUM(SAL) AS TOTAL_SALARY,
    CASE GROUPING_ID(DEPTNO, JOB)
        WHEN 1 THEN 'Dept Subtotal'
        WHEN 2 THEN 'Job Subtotal'
        WHEN 3 THEN 'Grand Total'
        ELSE 'Detail'
    END AS TOTAL_LEVEL
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;


/* =========================================================
   4. RANGE GROUPING USING CASE + GROUP BY
   ========================================================= */

-- Display number of employees in each salary range

SELECT
    CASE
        WHEN SAL BETWEEN 0 AND 2000
            THEN '0-2000'

        WHEN SAL BETWEEN 2001 AND 4000
            THEN '2001-4000'

        WHEN SAL > 4000
            THEN 'Above 4000'
    END AS SALARY_RANGE,

    COUNT(*) AS EMPLOYEE_COUNT

FROM EMP

GROUP BY
    CASE
        WHEN SAL BETWEEN 0 AND 2000
            THEN '0-2000'

        WHEN SAL BETWEEN 2001 AND 4000
            THEN '2001-4000'

        WHEN SAL > 4000
            THEN 'Above 4000'
    END

ORDER BY SALARY_RANGE;


/* =========================================================
   5. DUPLICATE RECORD DETECTION
   ========================================================= */

-- Find duplicate records

SELECT
    ENO,
    ENAME,
    SAL
FROM EMP44
GROUP BY
    ENO,
    ENAME,
    SAL
HAVING COUNT(*) > 1;


/* =========================================================
   6. PRACTICE QUESTIONS
   ========================================================= */

-- Q1. Display department-wise and job-wise total salary
--     with department subtotals and grand total.


-- Q2. Display state-wise and gender-wise number of persons
--     with subtotals and grand total using ROLLUP.


-- Q3. Display state-wise and gender-wise number of persons
--     with all possible subtotals using CUBE.


-- Q4. Display year-wise and quarter-wise total sales
--     with year subtotals and grand total.


-- Q5. Display department-wise salary totals and identify
--     subtotal rows using GROUPING_ID().


-- Q6. Display salary ranges:
--     0-2000
--     2001-4000
--     Above 4000
--     and count employees in each range.


-- Q7. Find duplicate records from EMP44
--     using GROUP BY and HAVING COUNT(*) > 1.


-- Q8. Display Department + Job salary totals using CUBE()
--     and label each row as Detail, Dept Subtotal,
--     Job Subtotal or Grand Total.


/* =========================================================
   DAY 20 PRACTICE CHECKLIST
   =========================================================

   [ ] ROLLUP()
   [ ] CUBE()
   [ ] GROUPING_ID()
   [ ] Subtotals
   [ ] Grand Total
   [ ] State-wise / Gender-wise grouping
   [ ] Year-wise / Quarter-wise grouping
   [ ] Range grouping using CASE
   [ ] Duplicate detection using GROUP BY + HAVING

   ========================================================= */
