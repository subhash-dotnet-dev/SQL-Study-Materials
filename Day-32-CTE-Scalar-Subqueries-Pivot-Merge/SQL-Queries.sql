/*
============================================================
SQL LEARNING JOURNEY - DAY 32
CTE, SCALAR SUBQUERIES, STRING_SPLIT(), PIVOT & MERGE
============================================================

Topics Covered:
1. Common Table Expression (CTE)
2. CTE with SELECT / INSERT / UPDATE / DELETE
3. Delete First 3 Rows using CTE
4. Delete Duplicate Rows using CTE
5. Multiple CTEs
6. Scalar Subqueries
7. STRING_SPLIT()
8. STRING_SPLIT() with SUM / AVG
9. PIVOT Operator
10. SELECT INTO
11. INSERT INTO SELECT
12. MERGE Command
13. Source and Target Table Synchronization
============================================================
*/


/*
============================================================
1. COMMON TABLE EXPRESSION (CTE)
============================================================

CTE stands for Common Table Expression.

A CTE gives a name to the result of a query and allows
that result to be referenced by the outer query.

Syntax:

WITH CTE_Name AS
(
    SELECT ...
)
SELECT / INSERT / UPDATE / DELETE
FROM CTE_Name;
============================================================
*/


-- Example 1: Display Employees using CTE

WITH E AS
(
    SELECT EMPNO,
           ENAME,
           JOB,
           SAL,
           DEPTNO
    FROM EMP
)
SELECT *
FROM E;


/*
============================================================
2. DELETE FIRST 3 ROWS USING CTE
============================================================
*/

WITH E AS
(
    SELECT EMPNO,
           ENAME,
           SAL,
           ROW_NUMBER() OVER
           (
               ORDER BY EMPNO ASC
           ) AS RNO
    FROM EMP
)
DELETE FROM E
WHERE RNO <= 3;


/*
============================================================
3. UPDATE USING CTE
============================================================

CTE can also be used with UPDATE statements.
============================================================
*/

WITH E AS
(
    SELECT EMPNO,
           ENAME,
           SAL
    FROM EMP
)
UPDATE E
SET SAL = SAL + 500
WHERE EMPNO = 7369;


/*
============================================================
4. DELETE DUPLICATE ROWS USING CTE
============================================================

Assume EMP44 contains:

ENO | ENAME | SAL
------------------
1   | A     | 5000
2   | B     | 6000
3   | C     | 7000
1   | A     | 5000
2   | B     | 6000

ROW_NUMBER() generates a unique number within each
duplicate group.

RNO = 1  -> KEEP
RNO > 1  -> DELETE
============================================================
*/

WITH E AS
(
    SELECT ENO,
           ENAME,
           SAL,
           ROW_NUMBER() OVER
           (
               PARTITION BY ENO, ENAME, SAL
               ORDER BY ENO ASC
           ) AS RNO
    FROM EMP44
)
DELETE FROM E
WHERE RNO > 1;


/*
============================================================
5. CHECK DUPLICATES BEFORE DELETING
============================================================
*/

WITH E AS
(
    SELECT ENO,
           ENAME,
           SAL,
           ROW_NUMBER() OVER
           (
               PARTITION BY ENO, ENAME, SAL
               ORDER BY ENO ASC
           ) AS RNO
    FROM EMP44
)
SELECT *
FROM E
WHERE RNO > 1;


/*
============================================================
6. MULTIPLE CTEs
============================================================

Multiple CTEs can be defined using comma.

WITH CTE1 AS (...),
     CTE2 AS (...)
SELECT ...
============================================================
*/


/*
Example:
CRICKET

TEAMA       TEAMB          WINNER
-------------------------------------
ENGLAND     NEW ZEALAND    NEW ZEALAND

Required Output:

COUNTRY | PLAYED | WON | LOST
--------------------------------
...
*/


WITH P AS
(
    SELECT COUNTRY,
           COUNT(*) AS PLAYED
    FROM
    (
        SELECT TEAMA AS COUNTRY
        FROM CRICKET

        UNION ALL

        SELECT TEAMB AS COUNTRY
        FROM CRICKET
    ) AS E
    GROUP BY COUNTRY
),
W AS
(
    SELECT WINNER AS COUNTRY,
           COUNT(*) AS WON
    FROM CRICKET
    GROUP BY WINNER
)
SELECT P.COUNTRY,
       P.PLAYED,
       W.WON,
       P.PLAYED - W.WON AS LOST
FROM P
INNER JOIN W
    ON P.COUNTRY = W.COUNTRY;


/*
============================================================
7. SCALAR SUBQUERIES
============================================================

A subquery written inside the SELECT clause is called
a Scalar Subquery.

The subquery output behaves like a column.

Syntax:

SELECT
    (SELECT ...)
FROM TableName;
============================================================
*/


-- Example 1: Employee and Department Counts

SELECT
    (SELECT COUNT(*)
     FROM EMP) AS EMP,

    (SELECT COUNT(*)
     FROM DEPT) AS DEPT;


/*
Expected Output:

EMP | DEPT
-----------
10  | 4
============================================================
*/


/*
============================================================
8. DEPARTMENT-WISE TOTAL SALARY
============================================================
*/

SELECT DEPTNO,
       SUM(SAL) AS DEPT_TOTSAL
FROM EMP
GROUP BY DEPTNO;


/*
============================================================
9. DEPARTMENT-WISE TOTAL SALARY + GRAND TOTAL
============================================================
*/

SELECT DEPTNO,
       SUM(SAL) AS DEPT_TOTSAL,

       (SELECT SUM(SAL)
        FROM EMP) AS TOTSAL

FROM EMP
GROUP BY DEPTNO;


/*
============================================================
10. DEPARTMENT-WISE SALARY PERCENTAGE
============================================================

Formula:

PCT = (DEPT_TOTSAL / TOTSAL) * 100
============================================================
*/

SELECT DEPTNO,

       SUM(SAL) AS DEPT_TOTSAL,

       (SELECT SUM(SAL)
        FROM EMP) AS TOTSAL,

       (SUM(SAL) /
        (SELECT SUM(SAL)
         FROM EMP)) * 100 AS PCT

FROM EMP
GROUP BY DEPTNO;


/*
============================================================
11. POSITIVE AND NEGATIVE VALUES USING CTE
============================================================

T1

AMT
----
1000
-200
3000
-500
4000
-600

Required:

POS   | NEG
------------
1000  | -200
3000  | -500
4000  | -600
============================================================
*/

WITH CTE AS
(
    SELECT
        CASE
            WHEN AMT > 0 THEN AMT
            ELSE NULL
        END AS POS,

        CASE
            WHEN AMT < 0 THEN AMT
            ELSE NULL
        END AS NEG

    FROM T1
)
SELECT POS,
       NEG
FROM CTE;


/*
============================================================
12. INNER JOIN USING CTE
============================================================
*/

WITH CTE AS
(
    SELECT T1.F1,
           T2.C1
    FROM T1
    INNER JOIN T2
        ON T1.F1 = T2.F1
)
SELECT *
FROM CTE;


/*
============================================================
13. STRING_SPLIT()
============================================================

STRING_SPLIT() is a Table-Valued Function.

It splits a string into rows based on a separator.

Syntax:

STRING_SPLIT(string, separator)
============================================================
*/


-- Example 1: Split comma-separated values

SELECT *
FROM STRING_SPLIT('a,b,c,d', ',');


/*
Output:

value
-----
a
b
c
d
*/


-- Example 2: Split a name using space

SELECT *
FROM STRING_SPLIT
(
    'sachin ramesh tendulkar',
    ' '
);


/*
Output:

sachin
ramesh
tendulkar
*/


/*
============================================================
14. STRING_SPLIT() WITH SUM AND AVG
============================================================

Assume:

STUDENT

SNO | SNAME | MARKS
-------------------------
1   | A     | 70,90,80,50,40
2   | B     | 60,70,50,40,80
3   | C     | 30,50,90,50,40

Required:

SNO | SNAME | MARKS | TOTAL | AVG
============================================================
*/


SELECT
    SNO,
    SNAME,
    MARKS,

    (
        SELECT SUM(CAST(value AS INT))
        FROM STRING_SPLIT(MARKS, ',')
    ) AS TOTAL,

    (
        SELECT AVG(CAST(value AS DECIMAL(10,2)))
        FROM STRING_SPLIT(MARKS, ',')
    ) AS AVG

FROM STUDENT;


/*
============================================================
15. PIVOT OPERATOR
============================================================

PIVOT converts rows into columns.

Used for:

- Matrix representation
- Cross-tabulation
- Reporting

Syntax:

SELECT *
FROM
(
    SELECT ...
) AS SourceTable
PIVOT
(
    AGGREGATE_FUNCTION(Column)
    FOR Column IN ([Value1], [Value2], [Value3])
) AS PivotTable;
============================================================
*/


/*
Example:

EMP

DEPTNO | JOB       | SAL
--------------------------
10     | ANALYST   | ...
10     | CLERK     | ...
20     | MANAGER   | ...
30     | SALESMAN  | ...

Required:

JOB       | 10 | 20 | 30
--------------------------
ANALYST   |    |    |
CLERK     |    |    |
MANAGER   |    |    |
SALESMAN  |    |    |
============================================================
*/

SELECT *
FROM
(
    SELECT DEPTNO,
           JOB,
           SAL
    FROM EMP
) AS E
PIVOT
(
    SUM(SAL)
    FOR DEPTNO IN ([10], [20], [30])
) AS PIVOT_TBL
ORDER BY JOB ASC;


/*
============================================================
16. PIVOT - QUARTER-WISE EMPLOYEE COUNT
============================================================

Display employee count based on:

YEAR | Q1 | Q2 | Q3 | Q4
============================================================
*/

SELECT *
FROM
(
    SELECT
        DATEPART(YEAR, HIREDATE) AS YEAR,
        DATEPART(QUARTER, HIREDATE) AS QRT,
        EMPNO
    FROM EMP
) AS E
PIVOT
(
    COUNT(EMPNO)
    FOR QRT IN ([1], [2], [3], [4])
) AS PIVOT_TBL
ORDER BY YEAR ASC;


/*
============================================================
17. PIVOT - STUDENT SUBJECT MARKS
============================================================

STUDENT

SNO | SNAME | SUBJECT | MARKS
------------------------------
1   | A     | MAT     | 80
1   | A     | PHY     | 60
1   | A     | CHE     | 70
2   | B     | MAT     | 70
2   | B     | PHY     | 60
2   | B     | CHE     | 50

Required:

SNO | SNAME | MAT | PHY | CHE
============================================================
*/


SELECT *
FROM
(
    SELECT SNO,
           SNAME,
           SUBJECT,
           MARKS
    FROM STUDENT
) AS S
PIVOT
(
    SUM(MARKS)
    FOR SUBJECT IN ([MAT], [PHY], [CHE])
) AS PIVOT_TBL
ORDER BY SNO;


/*
============================================================
18. SELECT INTO
============================================================

SELECT INTO creates a new table and copies the result
of a SELECT query into that table.

Syntax:

SELECT columns
INTO NewTable
FROM OldTable
[WHERE condition];
============================================================
*/


-- Example 1: Copy complete table

SELECT *
INTO EMP10
FROM EMP;


/*
============================================================
19. SELECT INTO - SPECIFIC COLUMNS AND ROWS
============================================================
*/

SELECT EMPNO,
       ENAME,
       JOB,
       SAL
INTO EMP11
FROM EMP
WHERE JOB IN ('CLERK', 'MANAGER');


/*
============================================================
20. SELECT INTO - COPY ONLY TABLE STRUCTURE
============================================================

WHERE 1 = 2 always evaluates to FALSE.

Therefore:
Columns are created.
Rows are not copied.
============================================================
*/

SELECT *
INTO EMP12
FROM EMP
WHERE 1 = 2;


/*
============================================================
21. COPY TABLE FROM ONE DATABASE TO ANOTHER
============================================================

Example:

Copy STUDENT table into DB9AM database.
============================================================
*/

SELECT *
INTO DB9AM.DBO.STUDENT
FROM STUDENT;


/*
============================================================
22. INSERT INTO SELECT
============================================================

Used to copy data from an existing table into another
existing table.

Syntax:

INSERT INTO TargetTable
SELECT columns
FROM SourceTable
[WHERE condition];
============================================================
*/


-- Copy all data

INSERT INTO EMP12
SELECT *
FROM EMP;


/*
============================================================
23. INSERT SELECT - SPECIFIC COLUMNS
============================================================
*/

INSERT INTO EMP12
(
    EMPNO,
    ENAME,
    JOB,
    SAL
)
SELECT
    EMPNO,
    ENAME,
    JOB,
    SAL
FROM EMP
WHERE JOB = 'CLERK';


/*
============================================================
24. MERGE COMMAND
============================================================

MERGE is used to synchronize a target table with a
source table.

MERGE can perform:

1. UPDATE
2. INSERT
3. DELETE

Main conditions:

WHEN MATCHED
    -> UPDATE

WHEN NOT MATCHED
    -> INSERT

WHEN NOT MATCHED BY SOURCE
    -> DELETE
============================================================
*/


/*
============================================================
25. CREATE SOURCE TABLE FOR MERGE
============================================================
*/

CREATE TABLE CUSTS
(
    CID INT,
    CNAME VARCHAR(10),
    ADDR VARCHAR(10)
);


/*
============================================================
26. INSERT DATA INTO SOURCE TABLE
============================================================
*/

INSERT INTO CUSTS
VALUES
    (10, 'A', 'HYD'),
    (11, 'B', 'MUM');


/*
============================================================
27. CREATE REPLICA / TARGET TABLE
============================================================
*/

SELECT *
INTO CUSTT
FROM CUSTS;


/*
============================================================
28. MODIFY SOURCE TABLE
============================================================
*/

-- Insert new customer

INSERT INTO CUSTS
VALUES
    (12, 'C', 'DEL');


-- Update existing customer

UPDATE CUSTS
SET ADDR = 'BLR'
WHERE CID = 10;


/*
============================================================
29. MERGE SOURCE INTO TARGET
============================================================
*/

MERGE INTO CUSTT AS T
USING CUSTS AS S
    ON S.CID = T.CID

WHEN MATCHED THEN
    UPDATE
    SET
        T.CNAME = S.CNAME,
        T.ADDR = S.ADDR

WHEN NOT MATCHED THEN
    INSERT
    (
        CID,
        CNAME,
        ADDR
    )
    VALUES
    (
        S.CID,
        S.CNAME,
        S.ADDR
    )

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;


/*
============================================================
30. CHECK TARGET TABLE AFTER MERGE
============================================================
*/

SELECT *
FROM CUSTT;


/*
============================================================
31. MERGE LOGIC
============================================================

SOURCE                 TARGET
  |                       |
  |                       |
  +-------- MERGE --------+
             |
     +-------+-------+
     |       |       |
 UPDATE    INSERT   DELETE
 MATCHED   NOT       NOT MATCHED
           MATCHED   BY SOURCE
============================================================
*/


/*
============================================================
32. CTE - PRACTICE QUESTION
============================================================

Question:
Delete the first 3 employees based on EMPNO.
============================================================
*/

WITH E AS
(
    SELECT EMPNO,
           ENAME,
           SAL,
           ROW_NUMBER() OVER
           (
               ORDER BY EMPNO
           ) AS RNO
    FROM EMP
)
DELETE FROM E
WHERE RNO <= 3;


/*
============================================================
33. CTE - PRACTICE QUESTION
============================================================

Question:
Delete duplicate records while keeping the first row.
============================================================
*/

WITH E AS
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY ENO, ENAME, SAL
               ORDER BY ENO
           ) AS RNO
    FROM EMP44
)
DELETE FROM E
WHERE RNO > 1;


/*
============================================================
34. SCALAR SUBQUERY - PRACTICE
============================================================

Question:
Display:

DEPTNO
DEPT_TOTSAL
TOTSAL
PCT
============================================================
*/

SELECT
    DEPTNO,

    SUM(SAL) AS DEPT_TOTSAL,

    (SELECT SUM(SAL)
     FROM EMP) AS TOTSAL,

    CAST
    (
        (
            SUM(SAL) * 100.0
        )
        /
        NULLIF
        (
            (SELECT SUM(SAL)
             FROM EMP),
            0
        )
        AS DECIMAL(10,2)
    ) AS PCT

FROM EMP
GROUP BY DEPTNO;


/*
============================================================
35. FINAL QUICK REFERENCE
============================================================

CTE
    -> Named query result

Scalar Subquery
    -> Subquery inside SELECT
    -> Output behaves like a column

STRING_SPLIT()
    -> String into rows

PIVOT
    -> Rows into columns

SELECT INTO
    -> Creates new table + copies data

INSERT INTO SELECT
    -> Copies data into an existing table

MERGE
    -> UPDATE + INSERT + DELETE
    -> Synchronizes source and target

ROW_NUMBER()
    -> Assigns unique sequential numbers

PARTITION BY
    -> Creates groups for window functions
============================================================
*/


/*
============================================================
END OF DAY 32
SQL LEARNING JOURNEY
============================================================
*/
