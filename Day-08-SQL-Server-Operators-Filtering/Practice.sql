
### 📄 `Practice.sql`

```sql
-- ==========================================
-- Day 08 - SQL Server Operators & Filtering
-- ==========================================

-- SELECT

SELECT ENAME, SAL
FROM EMP;

SELECT ENAME, JOB, HIREDATE
FROM EMP;

SELECT *
FROM EMP;


-- WHERE

SELECT *
FROM EMP
WHERE EMPID = 103;

SELECT *
FROM EMP
WHERE ENAME = 'kumar';

SELECT *
FROM EMP
WHERE SAL > 5000;

SELECT *
FROM EMP
WHERE HIREDATE > '2020-12-31';

SELECT *
FROM EMP
WHERE HIREDATE < '2020-01-01';

SELECT *
FROM EMP
WHERE DEPT <> 'hr';


-- OR

SELECT *
FROM EMP
WHERE JOB = 'clerk'
OR JOB = 'manager';

SELECT *
FROM EMP
WHERE EMPID = 100
OR EMPID = 103
OR EMPID = 105;


-- AND

SELECT *
FROM EMP
WHERE DEPT = 'hr'
AND JOB = 'clerk';

SELECT *
FROM EMP
WHERE SAL > 5000
AND SAL < 10000;


-- AND + OR with parentheses

SELECT *
FROM EMP
WHERE (JOB = 'clerk' OR JOB = 'manager')
AND SAL > 5000;


-- STUDENT

SELECT *
FROM STUDENT
WHERE S1 >= 35
AND S2 >= 35
AND S3 >= 35;

SELECT *
FROM STUDENT
WHERE S1 < 35
OR S2 < 35
OR S3 < 35;
