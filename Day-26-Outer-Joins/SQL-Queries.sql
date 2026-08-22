/* ============================================================
   SQL Learning Journey — Day 26
   Topic: SQL Server OUTER JOINs
   File: SQL-Queries.sql
   ============================================================ */


-- ============================================================
-- 1. CREATE DEPARTMENT TABLE
-- ============================================================

CREATE TABLE DEPT26
(
    deptno INT PRIMARY KEY,
    dname VARCHAR(20) NOT NULL,
    loc VARCHAR(30)
);


-- ============================================================
-- 2. CREATE EMPLOYEE TABLE
-- ============================================================

CREATE TABLE EMP26
(
    empno INT PRIMARY KEY,
    ename VARCHAR(20) NOT NULL,
    sal DECIMAL(10,2),
    deptno INT NULL
);


-- ============================================================
-- 3. INSERT DEPARTMENT DATA
-- ============================================================

INSERT INTO DEPT26 (deptno, dname, loc)
VALUES
(10, 'ACCOUNTS', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');


-- ============================================================
-- 4. INSERT EMPLOYEE DATA
-- ============================================================

INSERT INTO EMP26 (empno, ename, sal, deptno)
VALUES
(1, 'A', 3000, 10),
(2, 'B', 4000, 20),
(3, 'C', 5000, 30),
(4, 'D', 4000, 20),
(5, 'E', 3000, NULL);


-- ============================================================
-- 5. VIEW TABLE DATA
-- ============================================================

SELECT *
FROM EMP26;

SELECT *
FROM DEPT26;


-- ============================================================
-- 6. INNER JOIN
-- Returns only matching records
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP26 AS e
INNER JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 7. LEFT JOIN
-- All employees + matching departments
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP26 AS e
LEFT JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 8. RIGHT JOIN
-- All departments + matching employees
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP26 AS e
RIGHT JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 9. FULL JOIN
-- All records from both tables
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP26 AS e
FULL JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 10. LEFT JOIN WITH COMPLETE EMPLOYEE DETAILS
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.deptno,
    d.dname,
    d.loc
FROM EMP26 AS e
LEFT JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 11. RIGHT JOIN WITH COMPLETE DEPARTMENT DETAILS
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM EMP26 AS e
RIGHT JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 12. FULL JOIN WITH COMPLETE DETAILS
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.deptno AS EmployeeDeptNo,
    d.deptno AS DepartmentDeptNo,
    d.dname,
    d.loc
FROM EMP26 AS e
FULL JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 13. FIND UNMATCHED EMPLOYEES
-- Employees without a matching department
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.deptno
FROM EMP26 AS e
LEFT JOIN DEPT26 AS d
    ON e.deptno = d.deptno
WHERE d.deptno IS NULL;


-- ============================================================
-- 14. FIND UNMATCHED DEPARTMENTS
-- Departments without employees
-- ============================================================

SELECT
    d.deptno,
    d.dname,
    d.loc
FROM EMP26 AS e
RIGHT JOIN DEPT26 AS d
    ON e.deptno = d.deptno
WHERE e.empno IS NULL;


-- ============================================================
-- 15. FIND UNMATCHED RECORDS FROM BOTH TABLES
-- ============================================================

SELECT
    e.empno,
    e.ename,
    d.deptno,
    d.dname
FROM EMP26 AS e
FULL JOIN DEPT26 AS d
    ON e.deptno = d.deptno
WHERE e.empno IS NULL
   OR d.deptno IS NULL;


-- ============================================================
-- 16. LEFT JOIN + WHERE
-- Employees who are not assigned to any department
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP26 AS e
LEFT JOIN DEPT26 AS d
    ON e.deptno = d.deptno
WHERE d.dname IS NULL;


-- ============================================================
-- 17. RIGHT JOIN + WHERE
-- Departments where no employee is assigned
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP26 AS e
RIGHT JOIN DEPT26 AS d
    ON e.deptno = d.deptno
WHERE e.ename IS NULL;


-- ============================================================
-- 18. FULL JOIN + IS NULL
-- Unmatched records from both tables
-- ============================================================

SELECT
    e.ename,
    d.dname
FROM EMP26 AS e
FULL JOIN DEPT26 AS d
    ON e.deptno = d.deptno
WHERE e.ename IS NULL
   OR d.dname IS NULL;


-- ============================================================
-- 19. LEFT JOIN WITH SALARY FILTER
-- ============================================================

SELECT
    e.ename,
    e.sal,
    d.dname
FROM EMP26 AS e
LEFT JOIN DEPT26 AS d
    ON e.deptno = d.deptno
WHERE e.sal >= 4000;


-- ============================================================
-- 20. LEFT JOIN + ORDER BY
-- ============================================================

SELECT
    e.ename,
    e.sal,
    d.dname
FROM EMP26 AS e
LEFT JOIN DEPT26 AS d
    ON e.deptno = d.deptno
ORDER BY e.sal DESC;


-- ============================================================
-- 21. COUNT EMPLOYEES IN EACH DEPARTMENT
-- ============================================================

SELECT
    d.deptno,
    d.dname,
    COUNT(e.empno) AS EmployeeCount
FROM DEPT26 AS d
LEFT JOIN EMP26 AS e
    ON d.deptno = e.deptno
GROUP BY
    d.deptno,
    d.dname;


-- ============================================================
-- 22. DEPARTMENTS WITH NO EMPLOYEES
-- ============================================================

SELECT
    d.deptno,
    d.dname,
    COUNT(e.empno) AS EmployeeCount
FROM DEPT26 AS d
LEFT JOIN EMP26 AS e
    ON d.deptno = e.deptno
GROUP BY
    d.deptno,
    d.dname
HAVING COUNT(e.empno) = 0;


-- ============================================================
-- 23. CREATE PROJECTS TABLE
-- ============================================================

CREATE TABLE PROJECTS26
(
    projid INT PRIMARY KEY,
    pname VARCHAR(30) NOT NULL,
    duration VARCHAR(20)
);


-- ============================================================
-- 24. ADD PROJECT ID TO EMPLOYEE TABLE
-- ============================================================

ALTER TABLE EMP26
ADD projid INT NULL;


-- ============================================================
-- 25. INSERT PROJECT DATA
-- ============================================================

INSERT INTO PROJECTS26 (projid, pname, duration)
VALUES
(100, 'BANKING APP', '6 MONTHS'),
(101, 'E-COMMERCE', '4 MONTHS'),
(102, 'CRM SYSTEM', '5 MONTHS');


-- ============================================================
-- 26. ASSIGN PROJECTS TO EMPLOYEES
-- ============================================================

UPDATE EMP26
SET projid = 100
WHERE empno = 1;

UPDATE EMP26
SET projid = 101
WHERE empno = 2;

UPDATE EMP26
SET projid = NULL
WHERE empno = 3;

UPDATE EMP26
SET projid = 101
WHERE empno = 4;

UPDATE EMP26
SET projid = NULL
WHERE empno = 5;


-- ============================================================
-- 27. EMPLOYEE DETAILS WITH PROJECT DETAILS
-- INNER JOIN
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.projid,
    p.pname,
    p.duration
FROM EMP26 AS e
INNER JOIN PROJECTS26 AS p
    ON e.projid = p.projid;


-- ============================================================
-- 28. EMPLOYEES WITH PROJECT DETAILS
-- INCLUDING EMPLOYEES WITHOUT PROJECTS
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.sal,
    e.projid,
    p.pname,
    p.duration
FROM EMP26 AS e
LEFT JOIN PROJECTS26 AS p
    ON e.projid = p.projid;


-- ============================================================
-- 29. PROJECTS WHERE NO EMPLOYEE IS ASSIGNED
-- ============================================================

SELECT
    p.projid,
    p.pname,
    p.duration
FROM PROJECTS26 AS p
LEFT JOIN EMP26 AS e
    ON e.projid = p.projid
WHERE e.empno IS NULL;


-- ============================================================
-- 30. FULL JOIN BETWEEN EMPLOYEES AND PROJECTS
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.projid,
    p.projid AS ProjectID,
    p.pname,
    p.duration
FROM EMP26 AS e
FULL JOIN PROJECTS26 AS p
    ON e.projid = p.projid;


-- ============================================================
-- 31. UNMATCHED EMPLOYEES FROM PROJECTS
-- ============================================================

SELECT
    e.empno,
    e.ename,
    e.projid
FROM EMP26 AS e
LEFT JOIN PROJECTS26 AS p
    ON e.projid = p.projid
WHERE p.projid IS NULL;


-- ============================================================
-- 32. UNMATCHED PROJECTS
-- ============================================================

SELECT
    p.projid,
    p.pname,
    p.duration
FROM PROJECTS26 AS p
LEFT JOIN EMP26 AS e
    ON e.projid = p.projid
WHERE e.projid IS NULL;


-- ============================================================
-- 33. COMPARE JOIN TYPES
-- ============================================================

-- INNER JOIN
SELECT e.ename, d.dname
FROM EMP26 AS e
INNER JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- LEFT JOIN
SELECT e.ename, d.dname
FROM EMP26 AS e
LEFT JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- RIGHT JOIN
SELECT e.ename, d.dname
FROM EMP26 AS e
RIGHT JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- FULL JOIN
SELECT e.ename, d.dname
FROM EMP26 AS e
FULL JOIN DEPT26 AS d
    ON e.deptno = d.deptno;


-- ============================================================
-- 34. QUICK REVISION
-- ============================================================

/*

INNER JOIN
→ Matching Records Only

LEFT JOIN
→ All Left + Matching Right

RIGHT JOIN
→ All Right + Matching Left

FULL JOIN
→ All Records From Both

LEFT JOIN + IS NULL
→ Find Left-Side Unmatched Records

RIGHT JOIN + IS NULL
→ Find Right-Side Unmatched Records

FULL JOIN + IS NULL
→ Find Unmatched Records From Both

EMP + DEPT
→ Department Relationship

EMP + PROJECTS
→ Project Assignment Relationship

*/
