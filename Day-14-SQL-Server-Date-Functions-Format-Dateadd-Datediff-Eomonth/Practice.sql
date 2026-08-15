-- ============================================================
-- DAY 14 - SQL SERVER DATE FUNCTIONS
-- FORMAT, DATEADD, DATEDIFF, EOMONTH
-- ============================================================


-- ============================================================
-- 1. FORMAT()
-- ============================================================

SELECT FORMAT(GETDATE(), 'dd-MM-yyyy');

SELECT FORMAT(GETDATE(), 'MM/dd/yyyy');

SELECT FORMAT(GETDATE(), 'dd-MM-yyyy hh:mm:ss');

SELECT FORMAT(GETDATE(), 'dd-MMM-yyyy');

SELECT FORMAT(GETDATE(), 'dd-MMMM-yyyy');

SELECT FORMAT(GETDATE(), 'ddd');

SELECT FORMAT(GETDATE(), 'dddd');


-- Display employee name and formatted joining date

SELECT ENAME,
       FORMAT(HIREDATE, 'dd-MMM-yyyy hh:mm:ss dddd') AS JOINING_DATE
FROM EMP;


-- ============================================================
-- 2. EMPLOYEES JOINED TODAY
-- ============================================================

SELECT *
FROM EMP
WHERE FORMAT(HIREDATE, 'yyyy-MM-dd')
      = FORMAT(GETDATE(), 'yyyy-MM-dd');


-- ============================================================
-- 3. TRANSACTIONS DONE TODAY
-- ============================================================

SELECT *
FROM TRANSACTIONS
WHERE ACCNO = 100
AND FORMAT(TDATE, 'yyyy-MM-dd')
    = FORMAT(GETDATE(), 'yyyy-MM-dd');


-- ============================================================
-- 4. DATEADD()
-- ============================================================

SELECT DATEADD(DD, 10, GETDATE());

SELECT DATEADD(MM, 2, GETDATE());

SELECT DATEADD(YY, 1, GETDATE());

SELECT DATEADD(MM, -2, GETDATE());


-- ============================================================
-- 5. EMPLOYEE RETIREMENT DATE
-- ============================================================

SELECT ENAME,
       HIREDATE,
       DATEADD(YY, 40, HIREDATE) AS DOR
FROM EMP;


-- ============================================================
-- 6. GOLD RATE - TODAY
-- ============================================================

SELECT *
FROM GOLD_RATES
WHERE DATEID =
      FORMAT(GETDATE(), 'yyyy-MM-dd');


-- ============================================================
-- 7. GOLD RATE - YESTERDAY
-- ============================================================

SELECT *
FROM GOLD_RATES
WHERE DATEID =
      FORMAT(DATEADD(DD, -1, GETDATE()), 'yyyy-MM-dd');


-- ============================================================
-- 8. GOLD RATE - LAST MONTH SAME DAY
-- ============================================================

SELECT *
FROM GOLD_RATES
WHERE DATEID =
      FORMAT(DATEADD(MM, -1, GETDATE()), 'yyyy-MM-dd');


-- ============================================================
-- 9. GOLD RATE - LAST YEAR SAME DAY
-- ============================================================

SELECT *
FROM GOLD_RATES
WHERE DATEID =
      FORMAT(DATEADD(YY, -1, GETDATE()), 'yyyy-MM-dd');


-- ============================================================
-- 10. GOLD RATES FOR LAST ONE MONTH
-- ============================================================

SELECT *
FROM GOLD_RATES
WHERE DATEID BETWEEN
      FORMAT(DATEADD(MM, -1, GETDATE()), 'yyyy-MM-dd')
      AND FORMAT(GETDATE(), 'yyyy-MM-dd');


-- ============================================================
-- 11. DATEDIFF()
-- ============================================================

SELECT DATEDIFF(YY, '2023-11-29', GETDATE());

SELECT DATEDIFF(MM, '2023-11-29', GETDATE());

SELECT DATEDIFF(DD, '2023-09-29', GETDATE());


-- ============================================================
-- 12. EMPLOYEE EXPERIENCE IN YEARS
-- ============================================================

SELECT ENAME,
       DATEDIFF(YY, HIREDATE, GETDATE()) AS EXPERIENCE
FROM EMP;


-- ============================================================
-- 13. EMPLOYEE EXPERIENCE IN YEARS AND MONTHS
-- ============================================================

SELECT ENAME,
       DATEDIFF(MM, HIREDATE, GETDATE()) / 12 AS YEARS,
       DATEDIFF(MM, HIREDATE, GETDATE()) % 12 AS MONTHS
FROM EMP;


-- ============================================================
-- 14. EOMONTH()
-- ============================================================

-- Current month last day
SELECT EOMONTH(GETDATE(), 0);


-- Next month last day
SELECT EOMONTH(GETDATE(), 1);


-- Previous month last day
SELECT EOMONTH(GETDATE(), -1);


-- ============================================================
-- 15. CURRENT MONTH FIRST DAY
-- ============================================================

SELECT DATEADD(DAY, 1, EOMONTH(GETDATE(), -1))
       AS FirstDayOfCurrentMonth;


-- ============================================================
-- 16. NEXT MONTH FIRST DAY
-- ============================================================

SELECT DATEADD(DAY, 1, EOMONTH(GETDATE(), 0))
       AS FirstDayOfNextMonth;


-- ============================================================
-- 17. CURRENT YEAR FIRST DAY
-- ============================================================

SELECT DATEADD(
           DAY,
           1,
           EOMONTH(GETDATE(), -MONTH(GETDATE()))
       ) AS FirstDayOfCurrentYear;


-- ============================================================
-- 18. NEXT YEAR FIRST DAY
-- ============================================================

SELECT DATEADD(
           DAY,
           1,
           EOMONTH(GETDATE(), 12 - MONTH(GETDATE()))
       ) AS FirstDayOfNextYear;
