
### 2. `Practice.sql`

Is file mein **sirf practical queries** rakho:

```sql
-- ============================================
-- DAY 11 - ALIAS, ORDER BY, DISTINCT & TOP
-- ============================================


-- ============================================
-- 1. ALIAS
-- ============================================

SELECT ENAME, SAL * 12 AS ANNSAL
FROM EMP;


SELECT ENAME, SAL * 12 AS [ANNUAL SAL]
FROM EMP;


-- Employee salary details
-- HRA = 20% of SAL
-- DA  = 30% of SAL
-- TAX = 10% of SAL
-- TOTSAL = SAL + HRA + DA - TAX

SELECT
    ENAME,
    SAL,
    SAL * 0.20 AS HRA,
    SAL * 0.30 AS DA,
    SAL * 0.10 AS TAX,
    SAL + (SAL * 0.20) + (SAL * 0.30) - (SAL * 0.10) AS TOTSAL
FROM EMP;


-- ============================================
-- 2. ORDER BY
-- ============================================

-- Employee name wise ascending
SELECT *
FROM EMP
ORDER BY ENAME ASC;


-- Salary wise descending
SELECT *
FROM EMP
ORDER BY SAL DESC;


-- Hiredate wise ascending
SELECT *
FROM EMP
ORDER BY HIREDATE ASC;


-- Department wise ASC and salary wise DESC
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;


-- Department wise ASC and hiredate wise ASC
SELECT EMPNO, ENAME, HIREDATE, DEPTNO
FROM EMP
ORDER BY DEPTNO ASC, HIREDATE ASC;


-- ============================================
-- 3. ORDER BY WITH COLUMN NUMBER
-- ============================================

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY 3 DESC;


SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY 2 ASC;


-- ============================================
-- 4. WHERE + ORDER BY
-- ============================================

-- Employees working as CLERK or MANAGER
-- Salary wise descending

SELECT *
FROM EMP
WHERE JOB IN ('CLERK', 'MANAGER')
ORDER BY SAL DESC;


-- Employees joined in 1981
-- Name wise ascending

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE LIKE '1981%'
ORDER BY ENAME ASC;


-- ============================================
-- 5. DISTINCT
-- ============================================

SELECT DISTINCT JOB
FROM EMP;


SELECT DISTINCT DEPTNO
FROM EMP;


-- ============================================
-- 6. TOP
-- ============================================

-- First 5 rows
SELECT TOP 5 *
FROM EMP;


-- Top 5 highest paid employees
SELECT TOP 5 *
FROM EMP
ORDER BY SAL DESC;


-- Top 5 employees based on experience
SELECT TOP 5 *
FROM EMP
ORDER BY HIREDATE ASC;


-- Top 3 distinct salaries
SELECT DISTINCT TOP 3 SAL
FROM EMP
ORDER BY SAL DESC;
