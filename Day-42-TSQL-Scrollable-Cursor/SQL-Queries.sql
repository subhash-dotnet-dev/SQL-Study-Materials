-- ============================================================
-- SQL SERVER — DAY 42
-- TOPIC: SCROLLABLE CURSOR
-- ============================================================

-- ============================================================
-- 1. BASIC SCROLLABLE CURSOR
-- ============================================================

DECLARE C1 CURSOR SCROLL
FOR
SELECT ENAME
FROM EMP;

DECLARE @NAME VARCHAR(10);

OPEN C1;

-- FETCH FIRST
FETCH FIRST FROM C1 INTO @NAME;
PRINT 'FIRST: ' + @NAME;

-- FETCH ABSOLUTE 5
FETCH ABSOLUTE 5 FROM C1 INTO @NAME;
PRINT 'ABSOLUTE 5: ' + @NAME;

-- FETCH RELATIVE 5
FETCH RELATIVE 5 FROM C1 INTO @NAME;
PRINT 'RELATIVE 5: ' + @NAME;

-- FETCH LAST
FETCH LAST FROM C1 INTO @NAME;
PRINT 'LAST: ' + @NAME;

-- FETCH PRIOR
FETCH PRIOR FROM C1 INTO @NAME;
PRINT 'PRIOR: ' + @NAME;

CLOSE C1;
DEALLOCATE C1;


-- ============================================================
-- 2. PRINT EMPLOYEE NAMES FROM LAST TO FIRST
-- ============================================================

DECLARE C2 CURSOR SCROLL
FOR
SELECT ENAME
FROM EMP;

DECLARE @NAME2 VARCHAR(10);

OPEN C2;

FETCH LAST FROM C2 INTO @NAME2;

WHILE (@@FETCH_STATUS = 0)
BEGIN
    PRINT @NAME2;

    FETCH PRIOR FROM C2 INTO @NAME2;
END;

CLOSE C2;
DEALLOCATE C2;


-- ============================================================
-- 3. PRINT EVERY 5TH RECORD
-- ============================================================

DECLARE C3 CURSOR SCROLL
FOR
SELECT ENAME
FROM EMP;

DECLARE @NAME3 VARCHAR(10);

OPEN C3;

FETCH ABSOLUTE 5 FROM C3 INTO @NAME3;

WHILE (@@FETCH_STATUS = 0)
BEGIN
    PRINT @NAME3;

    FETCH RELATIVE 5 FROM C3 INTO @NAME3;
END;

CLOSE C3;
DEALLOCATE C3;


-- ============================================================
-- 4. FETCH FIRST RECORD
-- ============================================================

DECLARE C4 CURSOR SCROLL
FOR
SELECT ENAME
FROM EMP;

DECLARE @NAME4 VARCHAR(10);

OPEN C4;

FETCH FIRST FROM C4 INTO @NAME4;

PRINT 'FIRST EMPLOYEE: ' + @NAME4;

CLOSE C4;
DEALLOCATE C4;


-- ============================================================
-- 5. FETCH LAST RECORD
-- ============================================================

DECLARE C5 CURSOR SCROLL
FOR
SELECT ENAME
FROM EMP;

DECLARE @NAME5 VARCHAR(10);

OPEN C5;

FETCH LAST FROM C5 INTO @NAME5;

PRINT 'LAST EMPLOYEE: ' + @NAME5;

CLOSE C5;
DEALLOCATE C5;


-- ============================================================
-- 6. FETCH ABSOLUTE RECORD
-- ============================================================

DECLARE C6 CURSOR SCROLL
FOR
SELECT ENAME
FROM EMP;

DECLARE @NAME6 VARCHAR(10);

OPEN C6;

FETCH ABSOLUTE 5 FROM C6 INTO @NAME6;

PRINT '5TH EMPLOYEE: ' + @NAME6;

CLOSE C6;
DEALLOCATE C6;


-- ============================================================
-- 7. FETCH NEXT AND PRIOR
-- ============================================================

DECLARE C7 CURSOR SCROLL
FOR
SELECT ENAME
FROM EMP;

DECLARE @NAME7 VARCHAR(10);

OPEN C7;

FETCH FIRST FROM C7 INTO @NAME7;
PRINT 'FIRST: ' + @NAME7;

FETCH NEXT FROM C7 INTO @NAME7;
PRINT 'NEXT: ' + @NAME7;

FETCH NEXT FROM C7 INTO @NAME7;
PRINT 'NEXT: ' + @NAME7;

FETCH PRIOR FROM C7 INTO @NAME7;
PRINT 'PRIOR: ' + @NAME7;

CLOSE C7;
DEALLOCATE C7;


-- ============================================================
-- 8. FETCH RELATIVE
-- ============================================================

DECLARE C8 CURSOR SCROLL
FOR
SELECT ENAME
FROM EMP;

DECLARE @NAME8 VARCHAR(10);

OPEN C8;

FETCH FIRST FROM C8 INTO @NAME8;
PRINT 'FIRST: ' + @NAME8;

FETCH RELATIVE 3 FROM C8 INTO @NAME8;
PRINT '3 RECORDS FORWARD: ' + @NAME8;

FETCH RELATIVE -2 FROM C8 INTO @NAME8;
PRINT '2 RECORDS BACKWARD: ' + @NAME8;

CLOSE C8;
DEALLOCATE C8;


-- ============================================================
-- 9. DISPLAY EMPLOYEE NAME AND SALARY
-- ============================================================

DECLARE C9 CURSOR SCROLL
FOR
SELECT ENAME, SAL
FROM EMP;

DECLARE @ENAME VARCHAR(10);
DECLARE @SAL MONEY;

OPEN C9;

FETCH FIRST FROM C9 INTO @ENAME, @SAL;

PRINT @ENAME + ' ' + CAST(@SAL AS VARCHAR(20));

FETCH LAST FROM C9 INTO @ENAME, @SAL;

PRINT @ENAME + ' ' + CAST(@SAL AS VARCHAR(20));

CLOSE C9;
DEALLOCATE C9;


-- ============================================================
-- 10. SCROLL THROUGH EMPLOYEE RECORDS
-- ============================================================

DECLARE C10 CURSOR SCROLL
FOR
SELECT ENAME
FROM EMP;

DECLARE @ENAME10 VARCHAR(10);

OPEN C10;

FETCH FIRST FROM C10 INTO @ENAME10;

WHILE (@@FETCH_STATUS = 0)
BEGIN
    PRINT @ENAME10;

    FETCH NEXT FROM C10 INTO @ENAME10;
END;

CLOSE C10;
DEALLOCATE C10;


-- ============================================================
-- QUICK REFERENCE
-- ============================================================

-- FETCH FIRST
-- Fetches the first record.

-- FETCH NEXT
-- Fetches the next record.

-- FETCH PRIOR
-- Fetches the previous record.

-- FETCH LAST
-- Fetches the last record.

-- FETCH ABSOLUTE N
-- Fetches the Nth record from the first record.

-- FETCH RELATIVE N
-- Fetches N positions relative to the current cursor position.

-- @@FETCH_STATUS = 0
-- FETCH was successful.

-- SCROLL
-- Allows forward and backward cursor navigation.
