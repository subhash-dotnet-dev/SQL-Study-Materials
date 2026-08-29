-- ============================================================
-- SQL SERVER — DAY 46
-- TOPIC: FUNCTIONS, TVF & BANKING TRANSACTIONS
-- ============================================================

-- ============================================================
-- 1. SCALAR VALUED FUNCTION
-- Calculate Total Amount of a Particular Order
-- ============================================================

CREATE OR ALTER FUNCTION getOrdAmt(@ordid INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @amt MONEY = 0;

    SELECT @amt = SUM(o.qty * p.price)
    FROM orders AS o
    INNER JOIN products AS p
        ON o.prodid = p.prodid
    WHERE o.ordid = @ordid;

    RETURN ISNULL(@amt, 0);
END;
GO

-- Execution
SELECT dbo.getOrdAmt(1000) AS TotalAmount;
GO


-- ============================================================
-- 2. TABLE VALUED FUNCTION
-- Return Employees Working in Particular Department
-- ============================================================

CREATE OR ALTER FUNCTION getEmpList(@dno INT)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM emp
    WHERE deptno = @dno
);
GO

-- Execution
SELECT *
FROM dbo.getEmpList(20);
GO


-- ============================================================
-- 3. TABLE VALUED FUNCTION
-- Return Top N Employees Based on Salary
-- ============================================================

CREATE OR ALTER FUNCTION getTopN(@n INT)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM
    (
        SELECT
            empno,
            ename,
            sal,
            DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk
        FROM emp
    ) AS E
    WHERE rnk <= @n
);
GO

-- Execution
SELECT *
FROM dbo.getTopN(5);
GO


-- ============================================================
-- 4. PROCEDURE RETURNING RECORDS USING CURSOR
-- ============================================================

CREATE OR ALTER PROCEDURE getDeptEmpList
    @dno INT,
    @empcur CURSOR VARYING OUTPUT
AS
BEGIN
    SET @empcur = CURSOR FOR
        SELECT empno, ename, sal
        FROM emp
        WHERE deptno = @dno;

    OPEN @empcur;
END;
GO

-- Execution
DECLARE @C1 CURSOR;
DECLARE @eno INT,
        @name VARCHAR(10),
        @sal MONEY;

EXEC getDeptEmpList 20, @C1 OUTPUT;

FETCH NEXT FROM @C1 INTO @eno, @name, @sal;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @name + ' ' + CAST(@sal AS VARCHAR(20));

    FETCH NEXT FROM @C1 INTO @eno, @name, @sal;
END;

CLOSE @C1;
DEALLOCATE @C1;
GO


-- ============================================================
-- BANKING TRANSACTION SYSTEM
-- ============================================================

-- Sample Tables

CREATE TABLE ACCOUNTS
(
    ACCNO INT PRIMARY KEY,
    ACTYPE CHAR(1),
    BAL MONEY
);
GO

CREATE TABLE TRANSACTIONS
(
    TRID INT PRIMARY KEY,
    TTYPE CHAR(2),
    TDATE DATETIME,
    TAMT MONEY,
    ACCNO INT
);
GO

CREATE SEQUENCE S10
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;
GO


-- ============================================================
-- 5. ACCOUNT OPENING
-- ============================================================

CREATE OR ALTER PROCEDURE OPEN_ACCOUNT
    @ACCNO INT,
    @ACTYPE CHAR(1),
    @BAL MONEY
AS
BEGIN
    INSERT INTO ACCOUNTS (ACCNO, ACTYPE, BAL)
    VALUES (@ACCNO, @ACTYPE, @BAL);

    PRINT 'Account Opened Successfully';
END;
GO

-- Execution
EXEC OPEN_ACCOUNT 102, 'S', 5000;
GO


-- ============================================================
-- 6. ACCOUNT CLOSING
-- ============================================================

CREATE OR ALTER PROCEDURE CLOSE_ACCOUNT
    @ACCNO INT
AS
BEGIN
    DELETE FROM ACCOUNTS
    WHERE ACCNO = @ACCNO;

    PRINT 'Account Closed Successfully';
END;
GO

-- Execution
-- EXEC CLOSE_ACCOUNT 102;
GO


-- ============================================================
-- 7. BALANCE ENQUIRY — SCALAR VALUED FUNCTION
-- ============================================================

CREATE OR ALTER FUNCTION GET_BALANCE(@ACCNO INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @BAL MONEY;

    SELECT @BAL = BAL
    FROM ACCOUNTS
    WHERE ACCNO = @ACCNO;

    RETURN @BAL;
END;
GO

-- Execution
SELECT dbo.GET_BALANCE(102) AS Balance;
GO


-- ============================================================
-- 8. MONEY DEPOSIT
-- ============================================================

CREATE OR ALTER PROCEDURE DEPOSIT_MONEY
    @ACCNO INT,
    @AMT MONEY
AS
BEGIN
    UPDATE ACCOUNTS
    SET BAL = BAL + @AMT
    WHERE ACCNO = @ACCNO;

    INSERT INTO TRANSACTIONS
        (TRID, TTYPE, TDATE, TAMT, ACCNO)
    VALUES
        (NEXT VALUE FOR S10, 'D', GETDATE(), @AMT, @ACCNO);

    PRINT 'Deposit Successful';
END;
GO

-- Execution
EXEC DEPOSIT_MONEY 102, 3000;

SELECT dbo.GET_BALANCE(102) AS BalanceAfterDeposit;
GO


-- ============================================================
-- 9. MONEY WITHDRAWAL
-- ============================================================

CREATE OR ALTER PROCEDURE WITHDRAW_MONEY
    @ACCNO INT,
    @AMT MONEY
AS
BEGIN
    IF (SELECT BAL FROM ACCOUNTS WHERE ACCNO = @ACCNO) >= @AMT
    BEGIN
        UPDATE ACCOUNTS
        SET BAL = BAL - @AMT
        WHERE ACCNO = @ACCNO;

        INSERT INTO TRANSACTIONS
            (TRID, TTYPE, TDATE, TAMT, ACCNO)
        VALUES
            (NEXT VALUE FOR S10, 'W', GETDATE(), @AMT, @ACCNO);

        PRINT 'Withdrawal Successful';
    END
    ELSE
    BEGIN
        PRINT 'Insufficient Balance';
    END
END;
GO

-- Execution
EXEC WITHDRAW_MONEY 102, 2000;

SELECT dbo.GET_BALANCE(102) AS BalanceAfterWithdrawal;
GO


-- ============================================================
-- 10. MONEY TRANSFER
-- ============================================================

CREATE OR ALTER PROCEDURE TRANSFER_MONEY
    @ACCNO_FROM INT,
    @ACCNO_TO INT,
    @AMT MONEY
AS
BEGIN
    IF (SELECT BAL FROM ACCOUNTS WHERE ACCNO = @ACCNO_FROM) >= @AMT
    BEGIN
        BEGIN TRANSACTION;

        UPDATE ACCOUNTS
        SET BAL = BAL - @AMT
        WHERE ACCNO = @ACCNO_FROM;

        INSERT INTO TRANSACTIONS
            (TRID, TTYPE, TDATE, TAMT, ACCNO)
        VALUES
            (NEXT VALUE FOR S10, 'T', GETDATE(), -@AMT, @ACCNO_FROM);

        UPDATE ACCOUNTS
        SET BAL = BAL + @AMT
        WHERE ACCNO = @ACCNO_TO;

        INSERT INTO TRANSACTIONS
            (TRID, TTYPE, TDATE, TAMT, ACCNO)
        VALUES
            (NEXT VALUE FOR S10, 'T', GETDATE(), @AMT, @ACCNO_TO);

        COMMIT TRANSACTION;

        PRINT 'Transfer Successful';
    END
    ELSE
    BEGIN
        PRINT 'Insufficient Balance';
    END
END;
GO

-- Execution
EXEC TRANSFER_MONEY 102, 103, 1000;

SELECT
    dbo.GET_BALANCE(102) AS SenderBalance,
    dbo.GET_BALANCE(103) AS ReceiverBalance;
GO


-- ============================================================
-- 11. STATEMENT BETWEEN TWO GIVEN DATES — TVF
-- ============================================================

CREATE OR ALTER FUNCTION GET_STATEMENT
(
    @ACCNO INT,
    @STARTDATE DATE,
    @ENDDATE DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM TRANSACTIONS
    WHERE ACCNO = @ACCNO
      AND TDATE >= @STARTDATE
      AND TDATE < DATEADD(DAY, 1, @ENDDATE)
);
GO

-- Execution
SELECT *
FROM dbo.GET_STATEMENT(102, '2024-01-01', '2024-12-31');
GO


-- ============================================================
-- 12. LATEST N TRANSACTIONS — TVF
-- ============================================================

CREATE OR ALTER FUNCTION GET_LATEST_TRANSACTIONS
(
    @ACCNO INT,
    @N INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP (@N) *
    FROM TRANSACTIONS
    WHERE ACCNO = @ACCNO
    ORDER BY TDATE DESC, TRID DESC
);
GO

-- Execution
SELECT *
FROM dbo.GET_LATEST_TRANSACTIONS(102, 5);
GO


-- ============================================================
-- QUICK REVISION
-- ============================================================
-- SVF  → Returns one value
-- TVF  → Returns table/records
-- PROC → Performs actions and may return values/records
-- CURSOR OUTPUT → Procedure can return records row-by-row
-- DEPOSIT → Increase balance
-- WITHDRAW → Decrease balance
-- TRANSFER → Debit sender + Credit receiver
-- GET_BALANCE() → Current account balance
-- GET_STATEMENT() → Transactions between dates
-- GET_LATEST_TRANSACTIONS() → Latest N transactions
-- ============================================================
