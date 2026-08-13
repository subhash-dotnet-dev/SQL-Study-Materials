
---

## 💻 Practice.sql

```sql
-- =============================================
-- Day 10 - SQL Server LIKE & IS Operators
-- =============================================


-- =============================================
-- 1. LIKE OPERATOR
-- =============================================

-- Employees whose name starts with 's'
SELECT *
FROM EMP
WHERE ENAME LIKE 's%';


-- Employees whose name ends with 'd'
SELECT *
FROM EMP
WHERE ENAME LIKE '%d';


-- Employees whose name contains 'a'
SELECT *
FROM EMP
WHERE ENAME LIKE '%a%';


-- 'a' is the 4th character
SELECT *
FROM EMP
WHERE ENAME LIKE '___a%';


-- 'a' is the 4th character from last
SELECT *
FROM EMP
WHERE ENAME LIKE '%a___';


-- Names starting with vowels
SELECT *
FROM EMP
WHERE ENAME LIKE '[aeiou]%';


-- Names starting with consonants
SELECT *
FROM EMP
WHERE ENAME NOT LIKE '[aeiou]%';


-- Names starting between 'a' and 'p'
SELECT *
FROM EMP
WHERE ENAME LIKE '[a-p]%';


-- Employees joined in 2020
SELECT *
FROM EMP
WHERE HIREDATE LIKE '2020%';


-- Employees whose names start with a, k or v
SELECT *
FROM EMP
WHERE ENAME LIKE '[akv]%';


-- =============================================
-- 2. ESCAPE
-- =============================================

-- Customer name contains '_'
SELECT *
FROM CUST
WHERE CNAME LIKE '%\_%' ESCAPE '\';


-- Customer name contains '%'
SELECT *
FROM CUST
WHERE CNAME LIKE '%\%%' ESCAPE '\';


-- Customer name contains two '_'
SELECT *
FROM CUST
WHERE CNAME LIKE '%\_%\_%' ESCAPE '\';


-- =============================================
-- 3. IS OPERATOR
-- =============================================

-- Employees not earning salary
SELECT *
FROM EMP
WHERE SAL IS NULL;


-- Employees earning salary
SELECT *
FROM EMP
WHERE SAL IS NOT NULL;


-- =============================================
-- 4. STUDENT ABSENCE FILTERING
-- =============================================

-- All subjects absent
SELECT SNO, SNAME
FROM STUDENT
WHERE M IS NULL
AND P IS NULL
AND C IS NULL;


-- All subjects are not absent
SELECT SNO, SNAME
FROM STUDENT
WHERE M <> 'AB'
AND P <> 'AB'
AND C <> 'AB';


-- One subject absent
SELECT SNO, SNAME
FROM STUDENT
WHERE (M = 'AB' AND P <> 'AB' AND C <> 'AB')
   OR (P = 'AB' AND M <> 'AB' AND C <> 'AB')
   OR (C = 'AB' AND M <> 'AB' AND P <> 'AB');


-- Two subjects absent
SELECT SNO, SNAME
FROM STUDENT
WHERE (M = 'AB' AND P = 'AB' AND C <> 'AB')
   OR (M = 'AB' AND C = 'AB' AND P <> 'AB')
   OR (P = 'AB' AND C = 'AB' AND M <> 'AB');
