-- ============================================================
-- SQL Server — Day 45
-- Stored Procedures & User-Defined Functions
-- ============================================================

-- ============================================================
-- 1. PROCEDURE WITHOUT PARAMETERS
-- ============================================================

CREATE OR ALTER PROCEDURE raise_all_salary
AS
BEGIN
    UPDATE emp
    SET sal = sal + 1000;
END;
GO

EXEC raise_all_salary;
GO


-- ============================================================
-- 2. PROCEDURE WITH INPUT PARAMETERS
-- ============================================================

CREATE OR ALTER PROCEDURE raise_salary
    @eno INT,
    @amt MONEY
AS
BEGIN
    UPDATE emp
    SET sal = sal + @amt
    WHERE empno = @eno;
END;
GO

-- Positional Association
EXEC raise_salary 7369, 1000;
GO

-- Named Association
EXEC raise_salary @eno = 7369, @amt = 1000;
GO


-- ============================================================
-- 3. PROCEDURE WITH OUTPUT PARAMETER
-- ============================================================

CREATE OR ALTER PROCEDURE raise_salary_output
    @eno INT,
    @amt MONEY,
    @newsal MONEY OUTPUT
AS
BEGIN
    UPDATE emp
    SET sal = sal + @amt
    WHERE empno = @eno;

    SELECT @newsal = sal
    FROM emp
    WHERE empno = @eno;
END;
GO

DECLARE @s MONEY;

EXEC raise_salary_output
    @eno = 104,
    @amt = 1000,
    @newsal = @s OUTPUT;

PRINT @s;
GO


-- ============================================================
-- 4. PROCEDURE WITH DEFAULT PARAMETER
-- ============================================================

CREATE OR ALTER PROCEDURE raise_salary_default
    @eno INT,
    @amt MONEY = 500,
    @newsal MONEY OUTPUT
AS
BEGIN
    UPDATE emp
    SET sal = sal + @amt
    WHERE empno = @eno;

    SELECT @newsal = sal
    FROM emp
    WHERE empno = @eno;
END;
GO

-- Using DEFAULT
DECLARE @s MONEY;

EXEC raise_salary_default
    100,
    DEFAULT,
    @s OUTPUT;

PRINT @s;
GO

-- Omitting default parameter
DECLARE @s MONEY;

EXEC raise_salary_default
    @eno = 100,
    @newsal = @s OUTPUT;

PRINT @s;
GO


-- ============================================================
-- 5. DEBIT / WITHDRAW PROCEDURE
-- ============================================================

CREATE OR ALTER PROCEDURE debit
    @acno INT,
    @amt MONEY,
    @newbal MONEY OUTPUT
AS
BEGIN
    DECLARE @bal MONEY;

    SELECT @bal = bal
    FROM accounts
    WHERE accno = @acno;

    IF @bal IS NULL
    BEGIN
        RAISERROR('Account does not exist', 16, 1);
        RETURN;
    END;

    IF @amt > @bal
    BEGIN
        RAISERROR('Insufficient balance', 16, 1);
        RETURN;
    END;

    UPDATE accounts
    SET bal = bal - @amt
    WHERE accno = @acno;

    INSERT INTO transactions(ttype, tdate, tamt, accno)
    VALUES ('W', GETDATE(), @amt, @acno);

    SELECT @newbal = bal
    FROM accounts
    WHERE accno = @acno;
END;
GO

DECLARE @newbal MONEY;

EXEC debit
    @acno = 100,
    @amt = 1000,
    @newbal = @newbal OUTPUT;

PRINT @newbal;
GO


-- ============================================================
-- 6. DEPOSIT PROCEDURE
-- ============================================================

CREATE OR ALTER PROCEDURE deposit
    @acno INT,
    @amt MONEY,
    @newbal MONEY OUTPUT
AS
BEGIN
    DECLARE @bal MONEY;

    SELECT @bal = bal
    FROM accounts
    WHERE accno = @acno;

    IF @bal IS NULL
    BEGIN
        RAISERROR('Account does not exist', 16, 1);
        RETURN;
    END;

    UPDATE accounts
    SET bal = bal + @amt
    WHERE accno = @acno;

    INSERT INTO transactions(ttype, tdate, tamt, accno)
    VALUES ('D', GETDATE(), @amt, @acno);

    SELECT @newbal = bal
    FROM accounts
    WHERE accno = @acno;
END;
GO

DECLARE @newbal MONEY;

EXEC deposit
    @acno = 100,
    @amt = 2000,
    @newbal = @newbal OUTPUT;

PRINT @newbal;
GO


-- ============================================================
-- 7. MONEY TRANSFER PROCEDURE
-- ============================================================

CREATE OR ALTER PROCEDURE transfer_money
    @from_acno INT,
    @to_acno INT,
    @amt MONEY,
    @status VARCHAR(50) OUTPUT
AS
BEGIN
    DECLARE @from_bal MONEY,
            @to_bal MONEY;

    SELECT @from_bal = bal
    FROM accounts
    WHERE accno = @from_acno;

    SELECT @to_bal = bal
    FROM accounts
    WHERE accno = @to_acno;

    IF @from_bal IS NULL
    BEGIN
        SET @status = 'Source account does not exist';
        RAISERROR('Source account does not exist', 16, 1);
        RETURN;
    END;

    IF @to_bal IS NULL
    BEGIN
        SET @status = 'Target account does not exist';
        RAISERROR('Target account does not exist', 16, 1);
        RETURN;
    END;

    IF @amt > @from_bal
    BEGIN
        SET @status = 'Insufficient balance';
        RAISERROR('Insufficient balance', 16, 1);
        RETURN;
    END;

    BEGIN TRANSACTION;

    BEGIN TRY

        UPDATE accounts
        SET bal = bal - @amt
        WHERE accno = @from_acno;

        UPDATE accounts
        SET bal = bal + @amt
        WHERE accno = @to_acno;

        INSERT INTO transactions(ttype, tdate, tamt, accno)
        VALUES ('T-', GETDATE(), @amt, @from_acno);

        INSERT INTO transactions(ttype, tdate, tamt, accno)
        VALUES ('T+', GETDATE(), @amt, @to_acno);

        COMMIT TRANSACTION;

        SET @status = 'Transfer successful';

    END TRY

    BEGIN CATCH

        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        SET @status = ERROR_MESSAGE();
        RAISERROR(@status, 16, 1);

    END CATCH;
END;
GO

DECLARE @status VARCHAR(50);

EXEC transfer_money
    @from_acno = 100,
    @to_acno = 101,
    @amt = 1000,
    @status = @status OUTPUT;

PRINT @status;
GO


-- ============================================================
-- 8. USER-DEFINED FUNCTION
-- SCALAR VALUED FUNCTION
-- ============================================================

CREATE OR ALTER FUNCTION dbo.CALC
(
    @a INT,
    @b INT,
    @op CHAR(1)
)
RETURNS INT
AS
BEGIN
    DECLARE @c INT;

    IF @op = '+'
        SET @c = @a + @b;

    ELSE IF @op = '-'
        SET @c = @a - @b;

    ELSE IF @op = '*'
        SET @c = @a * @b;

    ELSE IF @op = '/'
        SET @c = @a / @b;

    ELSE
        SET @c = NULL;

    RETURN @c;
END;
GO


-- ============================================================
-- 9. EXECUTE SCALAR FUNCTION
-- ============================================================

SELECT dbo.CALC(10, 20, '+') AS Result;
SELECT dbo.CALC(10, 20, '-') AS Result;
SELECT dbo.CALC(10, 20, '*') AS Result;
SELECT dbo.CALC(20, 10, '/') AS Result;
GO


-- ============================================================
-- 10. FUNCTION WITH EMPLOYEE SALARY
-- ============================================================

CREATE OR ALTER FUNCTION dbo.GetAnnualSalary
(
    @monthlySalary MONEY
)
RETURNS MONEY
AS
BEGIN
    RETURN @monthlySalary * 12;
END;
GO

SELECT
    empno,
    ename,
    sal,
    dbo.GetAnnualSalary(sal) AS AnnualSalary
FROM emp;
GO


-- ============================================================
-- QUICK REVISION
-- ============================================================

-- PROCEDURE
-- → Performs database operations

-- INPUT PARAMETER
-- → Receives value

-- OUTPUT PARAMETER
-- → Sends value back to caller

-- DEFAULT PARAMETER
-- → Uses default value when value is not supplied

-- SCALAR FUNCTION
-- → Returns one scalar value

-- DEBIT
-- → Withdraw money

-- DEPOSIT
-- → Add money

-- TRANSFER
-- → Move money between accounts
