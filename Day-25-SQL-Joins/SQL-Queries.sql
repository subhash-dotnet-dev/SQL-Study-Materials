/* ============================================================
   SQL Learning Journey — Day 25
   Topic: SQL Server JOINs
   File: SQL-Queries.sql
   ============================================================ */

-- ============================================================
-- 1. CREATE TABLES
-- ============================================================

CREATE TABLE DEPT99
(
    deptno INT PRIMARY KEY,
    dname VARCHAR(20) NOT NULL,
    locid INT
);

CREATE TABLE EMP99
(
    empno INT PRIMARY KEY,
    ename VARCHAR(20) NOT NULL,
    sal DECIMAL(10,2),
    deptno INT
);

CREATE TABLE LOCATIONS99
(
    locid INT PRIMARY KEY,
    city VARCHAR(30),
    state VARCHAR(30),
    country_id INT
);

CREATE TABLE COUNTRIES99
(
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50)
);


-- ============================================================
-- 2. INSERT SAMPLE DATA
-- ============================================================

INSERT INTO DEPT99 (deptno, dname, locid)
VALUES
(10, 'ACCOUNTING', 1),
(20, 'RESEARCH',   2),
(30, 'SALES',      3),
(40, 'OPERATIONS', 4);

INSERT INTO EMP99 (empno, ename, sal, deptno)
VALUES
(101, 'A', 5000, 10),
(102, 'B', 4000, 20),
(103, 'C', 3500, 30),
(104, 'D', 4500, 20),
(105, 'E', 3000, NULL);

INSERT INTO LOCATIONS99 (locid, city, state, country_id)
VALUES
(1, 'NEW YORK', 'NEW YORK', 1),
(2, 'DALLAS', 'TEXAS', 1),
(3, 'CHICAGO', 'ILLINOIS', 1),
(4, 'HYDERABAD', 'TELANGANA', 2);

INSERT INTO COUNTRIES99 (country_id, country_name)
VALUES
(1, 'UNITED STATES'),
(2, 'INDIA');


-- ============================================================
-- 3. INNER JOIN
-- Returns only matching records from both tables
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP99 AS e
INNER JOIN DEPT99 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 4. INNER JOIN WITH MULTIPLE COLUMNS
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname
FROM EMP99 AS e
INNER JOIN DEPT99 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 5. LEFT JOIN
-- Returns all records from the left table
-- ============================================================

SELECT
    e.empno,
    e.ename,
    d.dname
FROM EMP99 AS e
LEFT JOIN DEPT99 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 6. RIGHT JOIN
-- Returns all records from the right table
-- ============================================================

SELECT
    e.empno,
    e.ename,
    d.dname
FROM EMP99 AS e
RIGHT JOIN DEPT99 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 7. FULL OUTER JOIN
-- Returns matching and non-matching records from both tables
-- ============================================================

SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname
FROM EMP99 AS e
FULL OUTER JOIN DEPT99 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 8. CROSS JOIN
-- Returns every possible combination
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP99 AS e
CROSS JOIN DEPT99 AS d;


-- ============================================================
-- 9. MULTIPLE TABLE INNER JOIN
-- EMP → DEPT → LOCATIONS → COUNTRIES
-- ============================================================

SELECT
    e.ename,
    d.dname,
    l.city,
    l.state,
    c.country_name
FROM EMP99 AS e
INNER JOIN DEPT99 AS d
    ON e.deptno = d.deptno
INNER JOIN LOCATIONS99 AS l
    ON d.locid = l.locid
INNER JOIN COUNTRIES99 AS c
    ON l.country_id = c.country_id;


-- ============================================================
-- 10. MULTIPLE TABLE JOIN WITH ALIASES
-- ============================================================

SELECT
    e.ename AS EmployeeName,
    d.dname AS DepartmentName,
    l.city AS City,
    c.country_name AS Country
FROM EMP99 AS e
JOIN DEPT99 AS d
    ON e.deptno = d.deptno
JOIN LOCATIONS99 AS l
    ON d.locid = l.locid
JOIN COUNTRIES99 AS c
    ON l.country_id = c.country_id;


-- ============================================================
-- 11. LEFT JOIN WITH WHERE
-- Find employees who do not belong to any department
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.deptno
FROM EMP99 AS e
LEFT JOIN DEPT99 AS d
    ON e.deptno = d.deptno
WHERE d.deptno IS NULL;


-- ============================================================
-- 12. Find departments with no employees
-- ============================================================

SELECT
    d.deptno,
    d.dname
FROM DEPT99 AS d
LEFT JOIN EMP99 AS e
    ON d.deptno = e.deptno
WHERE e.empno IS NULL;


-- ============================================================
-- 13. JOIN + WHERE
-- Find employees earning more than 4000
-- ============================================================

SELECT
    e.ename,
    e.sal,
    d.dname
FROM EMP99 AS e
INNER JOIN DEPT99 AS d
    ON e.deptno = d.deptno
WHERE e.sal > 4000;


-- ============================================================
-- 14. JOIN + WHERE + ORDER BY
-- ============================================================

SELECT
    e.ename,
    e.sal,
    d.dname
FROM EMP99 AS e
INNER JOIN DEPT99 AS d
    ON e.deptno = d.deptno
WHERE e.sal >= 3500
ORDER BY e.sal DESC;


-- ============================================================
-- 15. SELF JOIN
-- Employee → Manager
-- ============================================================

CREATE TABLE EMP_MANAGER99
(
    empno INT PRIMARY KEY,
    ename VARCHAR(20),
    mgr INT
);

INSERT INTO EMP_MANAGER99
VALUES
(1, 'A', NULL),
(2, 'B', 1),
(3, 'C', 1),
(4, 'D', 2),
(5, 'E', 2);

SELECT
    e.ename AS Employee,
    m.ename AS Manager
FROM EMP_MANAGER99 AS e
LEFT JOIN EMP_MANAGER99 AS m
    ON e.mgr = m.empno;


-- ============================================================
-- 16. SELF JOIN WITH EMPLOYEE AND MANAGER IDs
-- ============================================================

SELECT
    e.empno AS EmployeeID,
    e.ename AS Employee,
    m.empno AS ManagerID,
    m.ename AS Manager
FROM EMP_MANAGER99 AS e
LEFT JOIN EMP_MANAGER99 AS m
    ON e.mgr = m.empno;


-- ============================================================
-- 17. EQUI JOIN
-- JOIN using the = operator
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP99 AS e
INNER JOIN DEPT99 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 18. NON-EQUI JOIN
-- JOIN using BETWEEN
-- ============================================================

CREATE TABLE SALGRADE99
(
    grade INT PRIMARY KEY,
    losal DECIMAL(10,2),
    hisal DECIMAL(10,2)
);

INSERT INTO SALGRADE99
VALUES
(1, 0, 2999),
(2, 3000, 3999),
(3, 4000, 4999),
(4, 5000, 9999);

SELECT
    e.ename,
    e.sal,
    s.grade
FROM EMP99 AS e
INNER JOIN SALGRADE99 AS s
    ON e.sal BETWEEN s.losal AND s.hisal;


-- ============================================================
-- 19. NON-EQUI JOIN USING >=
-- ============================================================

SELECT
    e.ename,
    e.sal,
    s.grade
FROM EMP99 AS e
INNER JOIN SALGRADE99 AS s
    ON e.sal >= s.losal
   AND e.sal <= s.hisal;


-- ============================================================
-- 20. LEFT JOIN ACROSS MULTIPLE TABLES
-- ============================================================

SELECT
    e.ename,
    d.dname,
    l.city,
    c.country_name
FROM EMP99 AS e
LEFT JOIN DEPT99 AS d
    ON e.deptno = d.deptno
LEFT JOIN LOCATIONS99 AS l
    ON d.locid = l.locid
LEFT JOIN COUNTRIES99 AS c
    ON l.country_id = c.country_id;


-- ============================================================
-- 21. JOIN + GROUP BY
-- Count employees in each department
-- ============================================================

SELECT
    d.dname,
    COUNT(e.empno) AS EmployeeCount
FROM DEPT99 AS d
LEFT JOIN EMP99 AS e
    ON d.deptno = e.deptno
GROUP BY
    d.dname;


-- ============================================================
-- 22. JOIN + GROUP BY + HAVING
-- Departments having more than one employee
-- ============================================================

SELECT
    d.dname,
    COUNT(e.empno) AS EmployeeCount
FROM DEPT99 AS d
INNER JOIN EMP99 AS e
    ON d.deptno = e.deptno
GROUP BY
    d.dname
HAVING COUNT(e.empno) > 1;


-- ============================================================
-- 23. JOIN + AGGREGATE FUNCTION
-- Average salary by department
-- ============================================================

SELECT
    d.dname,
    AVG(e.sal) AS AverageSalary
FROM DEPT99 AS d
INNER JOIN EMP99 AS e
    ON d.deptno = e.deptno
GROUP BY
    d.dname;


-- ============================================================
-- 24. FIND HIGHEST SALARY EMPLOYEE WITH DEPARTMENT
-- ============================================================

SELECT TOP 1
    e.ename,
    e.sal,
    d.dname
FROM EMP99 AS e
INNER JOIN DEPT99 AS d
    ON e.deptno = d.deptno
ORDER BY e.sal DESC;


-- ============================================================
-- 25. COMPLETE JOIN FLOW
-- EMP → DEPT → LOCATIONS → COUNTRIES
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname,
    l.locid,
    l.city,
    l.state,
    c.country_id,
    c.country_name
FROM EMP99 AS e
INNER JOIN DEPT99 AS d
    ON e.deptno = d.deptno
INNER JOIN LOCATIONS99 AS l
    ON d.locid = l.locid
INNER JOIN COUNTRIES99 AS c
    ON l.country_id = c.country_id;


-- ============================================================
-- QUICK REVISION
-- ============================================================

/*
INNER JOIN
→ Matching records only

LEFT JOIN
→ All left + matching right

RIGHT JOIN
→ All right + matching left

FULL OUTER JOIN
→ All records from both tables

CROSS JOIN
→ Cartesian product

SELF JOIN
→ Table joined with itself

EQUI JOIN
→ Uses =

NON-EQUI JOIN
→ Uses <, >, <=, >=, BETWEEN, etc.

ON
→ Defines JOIN condition

WHERE
→ Filters result

N TABLES
→ N - 1 JOIN CONDITIONS
*/
