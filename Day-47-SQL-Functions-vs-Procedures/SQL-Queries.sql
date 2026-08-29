-- SQL Server — Day 47
-- Functions vs Procedures

-- =====================================================
-- 1. SCALAR-VALUED FUNCTION (SVF)
-- =====================================================

CREATE OR ALTER FUNCTION GET_BALANCE
(
    @ACCNO INT
)
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
SELECT DBO.GET_BALANCE(102) AS Balance;
GO


-- =====================================================
-- 2. TABLE-VALUED FUNCTION (TVF)
-- =====================================================

CREATE OR ALTER FUNCTION GET_EMPLIST
(
    @DNO INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM EMP
    WHERE DEPTNO = @DNO
);
GO

-- Execution
SELECT *
FROM DBO.GET_EMPLIST(20);
GO


-- =====================================================
-- 3. PROCEDURE EXAMPLE
-- =====================================================

CREATE OR ALTER PROCEDURE UPDATE_BALANCE
    @ACCNO INT,
    @AMT MONEY
AS
BEGIN
    UPDATE ACCOUNTS
    SET BAL = BAL + @AMT
    WHERE ACCNO = @ACCNO;
END;
GO

-- Execution
EXEC UPDATE_BALANCE 102, 1000;
GO


-- =====================================================
-- 4. FUNCTION vs PROCEDURE
-- =====================================================

-- Function: Called using SELECT
SELECT DBO.GET_BALANCE(102) AS Balance;
GO

-- Procedure: Called using EXEC
EXEC UPDATE_BALANCE 102, 500;
GO


-- =====================================================
-- 5. LIST USER-CREATED PROCEDURES & FUNCTIONS
-- =====================================================

SELECT
    ROUTINE_NAME,
    ROUTINE_TYPE,
    ROUTINE_DEFINITION
FROM INFORMATION_SCHEMA.ROUTINES;
GO


-- =====================================================
-- 6. DROP PROCEDURE
-- =====================================================

-- DROP PROCEDURE UPDATE_BALANCE;


-- =====================================================
-- 7. DROP FUNCTION
-- =====================================================

-- DROP FUNCTION GET_BALANCE;
-- DROP FUNCTION GET_EMPLIST;


-- =====================================================
-- QUICK MEMORY
-- =====================================================

-- SVF       -> One Value -> SELECT
-- TVF       -> Records   -> FROM
-- PROCEDURE -> Action
-- FUNCTION  -> Value
-- PROCEDURE -> OUTPUT Parameter
-- FUNCTION  -> RETURN Statement
