
---

## 📄 `Practice.sql`

```sql
-- ============================================
-- DAY 09 — IN & BETWEEN OPERATORS
-- SQL Server Practice
-- ============================================


-- ============================================
-- 1. IN OPERATOR
-- ============================================

-- Employees whose ID is 100, 103 or 105

SELECT *
FROM EMP
WHERE EMPID IN (100,103,105);


-- Employees working as clerk or manager

SELECT *
FROM EMP
WHERE JOB IN ('clerk','manager');


-- ============================================
-- 2. NOT IN OPERATOR
-- ============================================

-- Employees not working in IT or Sales

SELECT *
FROM EMP
WHERE DEPT NOT IN ('it','sales');


-- ============================================
-- 3. BETWEEN OPERATOR
-- ============================================

-- Employees earning between 5000 and 10000

SELECT *
FROM EMP
WHERE SAL BETWEEN 5000 AND 10000;


-- Employees joined in 2020

SELECT *
FROM EMP
WHERE HIREDATE BETWEEN '2020-01-01'
AND '2020-12-31';


-- ============================================
-- 4. NOT BETWEEN
-- ============================================

-- Employees not joined in 2020

SELECT *
FROM EMP
WHERE HIREDATE NOT BETWEEN '2020-01-01'
AND '2020-12-31';


-- ============================================
-- 5. COMBINED FILTERING
-- ============================================

SELECT *
FROM EMP
WHERE JOB IN ('clerk','manager')
AND SAL BETWEEN 5000 AND 10000
AND HIREDATE NOT BETWEEN '2020-01-01'
AND '2020-12-31'
AND DEPT NOT IN ('hr','sales');


-- ============================================
-- 6. PRODUCT FILTERING
-- ============================================

SELECT *
FROM PRODUCTS
WHERE BRAND IN ('samsung','redmi','realme')
AND CATEGORY = 'mobiles'
AND PRICE BETWEEN 10000 AND 20000;


-- ============================================
-- 7. CUSTOMER FILTERING
-- ============================================

SELECT *
FROM CUST
WHERE GENDER = 'M'
AND CITY IN ('hyd','mum','blr')
AND AGE BETWEEN 20 AND 40;
