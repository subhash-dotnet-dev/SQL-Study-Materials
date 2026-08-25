/*
===========================================================
SQL LEARNING JOURNEY — DAY 36
Topic: SQL Server Indexes
===========================================================

Topics:
1. Index Basics
2. Simple Non-Clustered Index
3. Index Scan / Table Scan Examples
4. Composite Index
5. Leading Column
6. Unique Index
7. Enforcing Uniqueness
8. Clustered Index
9. Non-Clustered Index
10. DROP INDEX
===========================================================
*/


/*
===========================================================
1. CREATE SAMPLE TABLE
===========================================================
*/

CREATE TABLE EMP_INDEX
(
    EMPNO INT,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    SAL INT,
    DEPTNO INT
);


/*
===========================================================
2. INSERT SAMPLE DATA
===========================================================
*/

INSERT INTO EMP_INDEX (EMPNO, ENAME, JOB, SAL, DEPTNO)
VALUES
(7369, 'SMITH',  'CLERK',    800,  20),
(7499, 'ALLEN',  'SALESMAN', 1600, 30),
(7521, 'WARD',   'SALESMAN', 1250, 30),
(7566, 'JONES',  'MANAGER',  2975, 20),
(7654, 'MARTIN', 'SALESMAN', 1250, 30),
(7698, 'BLAKE',  'MANAGER',  2850, 30),
(7782, 'CLARK',  'MANAGER',  2450, 10),
(7788, 'SCOTT',  'ANALYST',  3000, 20),
(7839, 'KING',   'PRESIDENT',5000, 10),
(7844, 'TURNER', 'SALESMAN', 1500, 30),
(7876, 'ADAMS',  'CLERK',    1100, 20),
(7900, 'JAMES',  'CLERK',     950, 30),
(7902, 'FORD',   'ANALYST',  3000, 20),
(7934, 'MILLER', 'CLERK',    1300, 10);


/*
===========================================================
3. VIEW TABLE DATA
===========================================================
*/

SELECT *
FROM EMP_INDEX;


/*
===========================================================
4. SIMPLE NON-CLUSTERED INDEX
===========================================================

Index created on a single column = Simple Index

===========================================================
*/

CREATE INDEX IX_EMP_SAL
ON EMP_INDEX(SAL);


/*
===========================================================
5. SEARCH USING INDEXED COLUMN
===========================================================
*/

SELECT *
FROM EMP_INDEX
WHERE SAL = 3000;


SELECT *
FROM EMP_INDEX
WHERE SAL >= 3000;


SELECT *
FROM EMP_INDEX
WHERE SAL <= 3000;


/*
===========================================================
6. TABLE SCAN EXAMPLES
===========================================================

These examples use columns without an index or predicates
that may not efficiently use the available index.

===========================================================
*/

SELECT *
FROM EMP_INDEX
WHERE ENAME = 'BLAKE';


SELECT *
FROM EMP_INDEX;


/*
===========================================================
7. CHECK INDEXES
===========================================================
*/

EXEC sp_helpindex 'EMP_INDEX';


/*
===========================================================
8. COMPOSITE INDEX
===========================================================

Index created on multiple columns.

Leading column = DEPTNO

===========================================================
*/

CREATE INDEX IX_EMP_DEPT_JOB
ON EMP_INDEX(DEPTNO, JOB);


/*
===========================================================
9. COMPOSITE INDEX USING LEADING COLUMN
===========================================================
*/

SELECT *
FROM EMP_INDEX
WHERE DEPTNO = 20;


/*
===========================================================
10. COMPOSITE INDEX USING BOTH COLUMNS
===========================================================
*/

SELECT *
FROM EMP_INDEX
WHERE DEPTNO = 20
  AND JOB = 'CLERK';


/*
===========================================================
11. QUERY USING NON-LEADING COLUMN
===========================================================

JOB is not the leading column of
(DEPTNO, JOB).

===========================================================
*/

SELECT *
FROM EMP_INDEX
WHERE JOB = 'CLERK';


/*
===========================================================
12. UNIQUE INDEX
===========================================================

Unique Index does not allow duplicate values
in the indexed key.

===========================================================
*/

CREATE UNIQUE INDEX IX_EMP_EMPNO
ON EMP_INDEX(EMPNO);


/*
===========================================================
13. TEST UNIQUE INDEX
===========================================================

EMPNO 7369 already exists.

The following statement will generate
a duplicate key error.

===========================================================
*/

-- INSERT INTO EMP_INDEX
-- (EMPNO, ENAME, JOB, SAL, DEPTNO)
-- VALUES
-- (7369, 'TEST', 'CLERK', 2000, 20);


/*
===========================================================
14. UNIQUE INDEX ON ENAME
===========================================================

This can be created only when existing ENAME values
are unique.

===========================================================
*/

CREATE UNIQUE INDEX IX_EMP_ENAME
ON EMP_INDEX(ENAME);


/*
===========================================================
15. TEST UNIQUE INDEX ON ENAME
===========================================================

BLAKE already exists.

The following statement will generate
a duplicate key error.

===========================================================
*/

-- INSERT INTO EMP_INDEX
-- (EMPNO, ENAME, JOB, SAL, DEPTNO)
-- VALUES
-- (8888, 'BLAKE', 'CLERK', 3000, 30);


/*
===========================================================
16. CLUSTERED INDEX
===========================================================

Only one clustered index can exist on a table.

===========================================================
*/

CREATE CLUSTERED INDEX IX_EMP_CLUSTERED
ON EMP_INDEX(EMPNO);


/*
===========================================================
17. QUERY USING CLUSTERED INDEX KEY
===========================================================
*/

SELECT *
FROM EMP_INDEX
WHERE EMPNO = 7788;


/*
===========================================================
18. CHECK ALL INDEXES
===========================================================
*/

EXEC sp_helpindex 'EMP_INDEX';


/*
===========================================================
19. DROP NON-CLUSTERED INDEX
===========================================================
*/

DROP INDEX IX_EMP_SAL
ON EMP_INDEX;


/*
===========================================================
20. DROP COMPOSITE INDEX
===========================================================
*/

DROP INDEX IX_EMP_DEPT_JOB
ON EMP_INDEX;


/*
===========================================================
21. DROP UNIQUE INDEX
===========================================================
*/

DROP INDEX IX_EMP_ENAME
ON EMP_INDEX;


/*
===========================================================
22. DROP CLUSTERED INDEX
===========================================================
*/

DROP INDEX IX_EMP_CLUSTERED
ON EMP_INDEX;


/*
===========================================================
23. DROP UNIQUE EMPNO INDEX
===========================================================
*/

DROP INDEX IX_EMP_EMPNO
ON EMP_INDEX;


/*
===========================================================
24. DROP SAMPLE TABLE
===========================================================
*/

DROP TABLE EMP_INDEX;


/*
===========================================================
QUICK MEMORY

INDEX
    ↓
Improves Data Access Performance

SIMPLE INDEX
    ↓
Single Column

COMPOSITE INDEX
    ↓
Multiple Columns

UNIQUE INDEX
    ↓
No Duplicate Key Values

CLUSTERED INDEX
    ↓
Data Organized By Clustered Key

NON-CLUSTERED INDEX
    ↓
Separate Index Structure

B-TREE
    ↓
Balanced Tree Structure

LEADING COLUMN
    ↓
First Column In Composite Index

===========================================================
DAY 36 COMPLETE
===========================================================
*/ 
