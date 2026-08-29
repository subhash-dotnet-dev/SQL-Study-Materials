-- SQL Server — Day 48
-- TRIGGERS

-- =====================================================
-- 1. AFTER TRIGGER - Restrict DML on Sunday
-- =====================================================

CREATE OR ALTER TRIGGER T1
ON EMP
AFTER INSERT, UPDATE, DELETE
AS
IF DATENAME(DW, GETDATE()) = 'Sunday'
BEGIN
    ROLLBACK;
    RAISERROR('Sunday not allowed', 16, 1);
END;
GO


-- =====================================================
-- 2. AFTER TRIGGER - Working Hours Validation
-- =====================================================

CREATE OR ALTER TRIGGER T2
ON EMP
AFTER INSERT, UPDATE, DELETE
AS
IF DATEPART(DW, GETDATE()) BETWEEN 2 AND 6
BEGIN
    IF DATEPART(HH, GETDATE()) < 10
       OR DATEPART(HH, GETDATE()) >= 16
    BEGIN
        ROLLBACK;
        RAISERROR('Only between 10 AM and 4 PM', 16, 1);
    END
END
ELSE IF DATEPART(DW, GETDATE()) = 7
BEGIN
    IF DATEPART(HH, GETDATE()) < 10
       OR DATEPART(HH, GETDATE()) >= 14
    BEGIN
        ROLLBACK;
        RAISERROR('Only between 10 AM and 2 PM', 16, 1);
    END
END
ELSE
BEGIN
    ROLLBACK;
    RAISERROR('Sunday not allowed', 16, 1);
END;
GO


-- =====================================================
-- 3. Prevent EMPNO and HIREDATE Update
-- =====================================================

CREATE OR ALTER TRIGGER T3
ON EMP
AFTER UPDATE
AS
IF UPDATE(EMPNO) OR UPDATE(HIREDATE)
BEGIN
    ROLLBACK;
    RAISERROR('Cannot update empno and hiredate', 16, 1);
END;
GO


-- =====================================================
-- 4. Prevent Salary Decrement
--    INSERTED = New Values
--    DELETED  = Old Values
-- =====================================================

CREATE OR ALTER TRIGGER T4
ON EMP
AFTER UPDATE
AS
DECLARE @OLDSAL MONEY,
        @NEWSAL MONEY;

SELECT @OLDSAL = SAL
FROM DELETED;

SELECT @NEWSAL = SAL
FROM INSERTED;

IF @NEWSAL < @OLDSAL
BEGIN
    ROLLBACK;
    RAISERROR('Salary cannot be decremented', 16, 1);
END;
GO


-- =====================================================
-- 5. Employee Resignation Audit
-- =====================================================

CREATE TABLE EMP_RESIGN
(
    EMPNO INT,
    ENAME VARCHAR(10),
    JOB VARCHAR(10),
    SAL MONEY,
    HIREDATE DATE,
    DOR DATE
);
GO

CREATE OR ALTER TRIGGER T5
ON EMP
AFTER DELETE
AS
INSERT INTO EMP_RESIGN
SELECT EMPNO,
       ENAME,
       JOB,
       SAL,
       HIREDATE,
       GETDATE()
FROM DELETED;
GO


-- =====================================================
-- 6. Employee DML Auditing
-- =====================================================

CREATE TABLE EMP_AUDIT
(
    UNAME VARCHAR(10),
    OPERATION VARCHAR(10),
    ODATE DATETIME,
    NEW_ENO INT,
    NEW_ENAME VARCHAR(10),
    NEW_SAL MONEY,
    OLD_ENO INT,
    OLD_ENAME VARCHAR(10),
    OLD_SAL MONEY
);
GO

CREATE OR ALTER TRIGGER T6
ON EMP
AFTER INSERT, UPDATE, DELETE
AS
DECLARE @CNT1 INT,
        @CNT2 INT,
        @OP VARCHAR(10);

SELECT @CNT1 = COUNT(*)
FROM INSERTED;

SELECT @CNT2 = COUNT(*)
FROM DELETED;

IF @CNT1 > 0 AND @CNT2 = 0
    SET @OP = 'INSERT';
ELSE IF @CNT1 = 0 AND @CNT2 > 0
    SET @OP = 'DELETE';
ELSE
    SET @OP = 'UPDATE';

INSERT INTO EMP_AUDIT
SELECT USER_NAME(),
       @OP,
       GETDATE(),
       I.EMPNO,
       I.ENAME,
       I.SAL,
       D.EMPNO,
       D.ENAME,
       D.SAL
FROM INSERTED I
FULL OUTER JOIN DELETED D
ON I.EMPNO = D.EMPNO;
GO


-- =====================================================
-- 7. INSTEAD OF TRIGGER
--    Maximum 4 Employees per Department
-- =====================================================

CREATE OR ALTER TRIGGER T7
ON EMP44
INSTEAD OF INSERT
AS
DECLARE @ENO INT,
        @NAME VARCHAR(10),
        @DNO INT,
        @CNT INT;

SELECT @ENO = ENO,
       @NAME = ENAME,
       @DNO = DNO
FROM INSERTED;

SELECT @CNT = COUNT(*)
FROM EMP44
WHERE DNO = @DNO;

IF @CNT >= 4
    RAISERROR('Maximum 4 employees per department', 16, 1);
ELSE
    INSERT INTO EMP44
    VALUES (@ENO, @NAME, @DNO);
GO


-- =====================================================
-- 8. Testing Examples
-- =====================================================

-- UPDATE EMP
-- SET SAL = 1000
-- WHERE EMPNO = 7369;

-- UPDATE EMP
-- SET EMPNO = 9999
-- WHERE EMPNO = 7369;

-- DELETE FROM EMP
-- WHERE EMPNO = 7369;

-- SELECT * FROM EMP_RESIGN;

-- SELECT * FROM EMP_AUDIT;


-- =====================================================
-- 9. List User-Created Triggers
-- =====================================================

SELECT
    TR.NAME AS TRGNAME,
    TB.NAME AS TABNAME
FROM SYS.TRIGGERS AS TR
INNER JOIN SYS.TABLES AS TB
ON TR.PARENT_ID = TB.OBJECT_ID;
GO


-- =====================================================
-- 10. Drop Trigger
-- =====================================================

-- DROP TRIGGER T1;
