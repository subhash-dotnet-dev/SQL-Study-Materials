-- ============================================================
-- SQL Server — Day 41
-- Topic: Cursors & STRING_AGG()
-- ============================================================

-- ============================================================
-- 1. PRINT ALL EMPLOYEE NAMES AND SALARIES USING CURSOR
-- ============================================================

DECLARE C1 CURSOR
FOR
SELECT ENAME, SAL
FROM EMP;

DECLARE @name VARCHAR(10),
        @sal MONEY;

OPEN C1;

FETCH NEXT FROM C1
INTO @name, @sal;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @name + ' ' + CAST(@sal AS VARCHAR);

    FETCH NEXT FROM C1
    INTO @name, @sal;
END

CLOSE C1;
DEALLOCATE C1;


-- ============================================================
-- 2. CALCULATE TOTAL SALARY WITHOUT USING SUM()
-- ============================================================

DECLARE C2 CURSOR
FOR
SELECT SAL
FROM EMP;

DECLARE @sal2 MONEY,
        @total MONEY = 0;

OPEN C2;

FETCH NEXT FROM C2
INTO @sal2;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @total = @total + @sal2;

    FETCH NEXT FROM C2
    INTO @sal2;
END

PRINT 'TOTAL SALARY = ' + CAST(@total AS VARCHAR);

CLOSE C2;
DEALLOCATE C2;


-- ============================================================
-- 3. FIND MINIMUM SALARY WITHOUT USING MIN()
-- ============================================================

DECLARE C3 CURSOR
FOR
SELECT SAL
FROM EMP;

DECLARE @sal3 MONEY,
        @min MONEY = 5000;

OPEN C3;

FETCH NEXT FROM C3
INTO @sal3;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @sal3 < @min
        SET @min = @sal3;

    FETCH NEXT FROM C3
    INTO @sal3;
END

PRINT 'MINIMUM SALARY = ' + CAST(@min AS VARCHAR);

CLOSE C3;
DEALLOCATE C3;


-- ============================================================
-- 4. FIND MAXIMUM SALARY WITHOUT USING MAX()
-- ============================================================

DECLARE C4 CURSOR
FOR
SELECT SAL
FROM EMP;

DECLARE @sal4 MONEY,
        @max MONEY = 0;

OPEN C4;

FETCH NEXT FROM C4
INTO @sal4;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @sal4 > @max
        SET @max = @sal4;

    FETCH NEXT FROM C4
    INTO @sal4;
END

PRINT 'MAXIMUM SALARY = ' + CAST(@max AS VARCHAR);

CLOSE C4;
DEALLOCATE C4;


-- ============================================================
-- 5. FIND MAXIMUM SALARY USING ORDER BY
-- ============================================================

DECLARE C5 CURSOR
FOR
SELECT SAL
FROM EMP
ORDER BY SAL DESC;

DECLARE @max2 MONEY;

OPEN C5;

FETCH NEXT FROM C5
INTO @max2;

PRINT 'MAXIMUM SALARY = ' + CAST(@max2 AS VARCHAR);

CLOSE C5;
DEALLOCATE C5;


-- ============================================================
-- 6. PRINT EMPLOYEE NAMES IN COMMA-SEPARATED FORMAT
-- ============================================================

DECLARE C6 CURSOR
FOR
SELECT ENAME
FROM EMP;

DECLARE @name2 VARCHAR(10),
        @names VARCHAR(1000) = '';

OPEN C6;

FETCH NEXT FROM C6
INTO @name2;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @names = @names + @name2 + ',';

    FETCH NEXT FROM C6
    INTO @name2;
END

SET @names = STUFF(@names, LEN(@names), 1, '.');

PRINT @names;

CLOSE C6;
DEALLOCATE C6;


-- ============================================================
-- 7. STRING_AGG() - CONCATENATE EMPLOYEE NAMES
-- ============================================================

SELECT STRING_AGG(ENAME, ',') AS EMPLOYEE_NAMES
FROM EMP;


-- ============================================================
-- 8. STRING_AGG() - DEPARTMENT-WISE EMPLOYEE NAMES
-- ============================================================

SELECT DEPTNO,
       STRING_AGG(ENAME, ',') AS EMPLOYEE_NAMES
FROM EMP
GROUP BY DEPTNO;


-- ============================================================
-- 9. STRING_AGG() WITH ORDER BY
-- ============================================================

SELECT DEPTNO,
       STRING_AGG(ENAME, ',')
           WITHIN GROUP (ORDER BY ENAME) AS EMPLOYEE_NAMES
FROM EMP
GROUP BY DEPTNO;


-- ============================================================
-- 10. CREATE STUDENT TABLE
-- ============================================================

CREATE TABLE STUDENT
(
    SNO INT,
    SNAME VARCHAR(10),
    S1 TINYINT,
    S2 TINYINT,
    S3 TINYINT
);


-- ============================================================
-- 11. INSERT STUDENT DATA
-- ============================================================

INSERT INTO STUDENT
VALUES
(1, 'A', 80, 90, 70),
(2, 'B', 30, 60, 50);


-- ============================================================
-- 12. CREATE RESULT TABLE
-- ============================================================

CREATE TABLE RESULT
(
    SNO INT,
    TOTAL INT,
    AVG DECIMAL(5,2),
    RESULT CHAR(4)
);


-- ============================================================
-- 13. CALCULATE TOTAL, AVG AND RESULT USING CURSOR
-- ============================================================

DECLARE C7 CURSOR
FOR
SELECT SNO, S1, S2, S3
FROM STUDENT;

DECLARE @sno INT,
        @s1 TINYINT,
        @s2 TINYINT,
        @s3 TINYINT;

DECLARE @total2 INT,
        @avg DECIMAL(5,2),
        @res CHAR(4);

OPEN C7;

FETCH NEXT FROM C7
INTO @sno, @s1, @s2, @s3;

WHILE @@FETCH_STATUS = 0
BEGIN

    SET @total2 = @s1 + @s2 + @s3;

    SET @avg = @total2 / 3.0;

    IF @s1 >= 35
       AND @s2 >= 35
       AND @s3 >= 35
    BEGIN
        SET @res = 'PASS';
    END
    ELSE
    BEGIN
        SET @res = 'FAIL';
    END

    INSERT INTO RESULT
    VALUES
    (@sno, @total2, @avg, @res);

    FETCH NEXT FROM C7
    INTO @sno, @s1, @s2, @s3;

END

CLOSE C7;
DEALLOCATE C7;


-- ============================================================
-- 14. DISPLAY STUDENT RESULT
-- ============================================================

SELECT *
FROM RESULT;


-- ============================================================
-- 15. CLEANUP
-- ============================================================

-- DROP TABLE RESULT;
-- DROP TABLE STUDENT;


-- ============================================================
-- QUICK REVISION
-- ============================================================

-- DECLARE   → Define Cursor
-- OPEN      → Open Cursor
-- FETCH     → Fetch One Row
-- @@FETCH_STATUS = 0 → Fetch Successful
-- CLOSE     → Close Cursor
-- DEALLOCATE → Release Cursor
-- STRING_AGG() → Combine Multiple Row Values
