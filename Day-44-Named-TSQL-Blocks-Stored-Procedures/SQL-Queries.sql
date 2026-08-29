-- ============================================================
-- SQL SERVER — DAY 44
-- NAMED T-SQL BLOCKS & STORED PROCEDURES
-- ============================================================

-- ============================================================
-- 1. PROCEDURE WITHOUT PARAMETERS
-- Increment all employee salaries by 1000
-- ============================================================

CREATE OR ALTER PROCEDURE raise_salary
AS
UPDATE emp
SET sal = sal + 1000;
GO

EXECUTE raise_salary;
GO


-- ============================================================
-- 2. PROCEDURE WITH INPUT PARAMETERS
-- Increment specific employee salary by specific amount
-- ============================================================

CREATE OR ALTER PROCEDURE raise_salary
@eno INT,
@amt MONEY
AS
UPDATE emp
SET sal = sal + @amt
WHERE empno = @eno;
GO

-- Positional Association
EXECUTE raise_salary 7369, 1000;
GO

-- Named Association
EXECUTE raise_salary
    @eno = 7369,
    @amt = 1000;
GO

-- Named Association in Different Order
EXECUTE raise_salary
    @amt = 1000,
    @eno = 104;
GO


-- ============================================================
-- 3. PROCEDURE WITH OUTPUT PARAMETER
-- Increment salary and return updated salary
-- ============================================================

CREATE OR ALTER PROCEDURE raise_salary
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

-- Positional Association with OUTPUT
DECLARE @s MONEY;

EXECUTE raise_salary
    104,
    1000,
    @s OUTPUT;

PRINT @s;
GO

-- Named Association with OUTPUT
DECLARE @s MONEY;

EXECUTE raise_salary
    @eno = 104,
    @amt = 1000,
    @newsal = @s OUTPUT;

PRINT @s;
GO


-- ============================================================
-- 4. PROCEDURE TO DISPLAY EMPLOYEE DETAILS
-- ============================================================

CREATE OR ALTER PROCEDURE get_employee
@eno INT
AS
BEGIN
    SELECT empno, ename, job, sal, deptno
    FROM emp
    WHERE empno = @eno;
END;
GO

EXECUTE get_employee 7369;
GO


-- ============================================================
-- 5. PROCEDURE TO INCREASE SALARY BY PERCENTAGE
-- ============================================================

CREATE OR ALTER PROCEDURE increase_salary
@eno INT,
@percent DECIMAL(5,2)
AS
BEGIN
    UPDATE emp
    SET sal = sal + (sal * @percent / 100)
    WHERE empno = @eno;
END;
GO

EXECUTE increase_salary 7369, 10;
GO


-- ============================================================
-- 6. PROCEDURE WITH MULTIPLE INPUT PARAMETERS
-- ============================================================

CREATE OR ALTER PROCEDURE get_employees_by_dept
@deptno INT,
@minsal MONEY
AS
BEGIN
    SELECT empno, ename, job, sal, deptno
    FROM emp
    WHERE deptno = @deptno
      AND sal >= @minsal;
END;
GO

EXECUTE get_employees_by_dept 10, 2000;
GO


-- ============================================================
-- 7. PROCEDURE WITH OUTPUT PARAMETER FOR SALARY
-- ============================================================

CREATE OR ALTER PROCEDURE get_salary
@eno INT,
@sal MONEY OUTPUT
AS
BEGIN
    SELECT @sal = sal
    FROM emp
    WHERE empno = @eno;
END;
GO

DECLARE @salary MONEY;

EXECUTE get_salary
    @eno = 7369,
    @sal = @salary OUTPUT;

PRINT @salary;
GO


-- ============================================================
-- 8. PROCEDURE TO COUNT EMPLOYEES
-- ============================================================

CREATE OR ALTER PROCEDURE employee_count
@deptno INT,
@cnt INT OUTPUT
AS
BEGIN
    SELECT @cnt = COUNT(*)
    FROM emp
    WHERE deptno = @deptno;
END;
GO

DECLARE @count INT;

EXECUTE employee_count
    @deptno = 10,
    @cnt = @count OUTPUT;

PRINT @count;
GO


-- ============================================================
-- 9. PROCEDURE FOR INSERT
-- ============================================================

CREATE OR ALTER PROCEDURE add_employee
@eno INT,
@ename VARCHAR(10),
@job VARCHAR(10),
@sal MONEY,
@deptno INT
AS
BEGIN
    INSERT INTO emp(empno, ename, job, sal, deptno)
    VALUES(@eno, @ename, @job, @sal, @deptno);
END;
GO


-- Example:
-- EXECUTE add_employee 8001, 'RAHUL', 'CLERK', 3000, 10;
-- GO


-- ============================================================
-- 10. PROCEDURE FOR UPDATE
-- ============================================================

CREATE OR ALTER PROCEDURE update_salary
@eno INT,
@sal MONEY
AS
BEGIN
    UPDATE emp
    SET sal = @sal
    WHERE empno = @eno;
END;
GO

-- Example:
-- EXECUTE update_salary 8001, 4000;
-- GO


-- ============================================================
-- 11. PROCEDURE FOR DELETE
-- ============================================================

CREATE OR ALTER PROCEDURE delete_employee
@eno INT
AS
BEGIN
    DELETE FROM emp
    WHERE empno = @eno;
END;
GO

-- Example:
-- EXECUTE delete_employee 8001;
-- GO


-- ============================================================
-- 12. PROCEDURE USING BEGIN...END
-- ============================================================

CREATE OR ALTER PROCEDURE employee_details
@eno INT
AS
BEGIN
    SELECT empno, ename, job
    FROM emp
    WHERE empno = @eno;

    SELECT sal, deptno
    FROM emp
    WHERE empno = @eno;
END;
GO

EXECUTE employee_details 7369;
GO


-- ============================================================
-- QUICK REVISION
-- ============================================================

-- CREATE OR ALTER PROCEDURE
-- → Creates or modifies a stored procedure

-- EXECUTE / EXEC
-- → Executes a stored procedure

-- INPUT PARAMETER
-- → Receives value

-- OUTPUT PARAMETER
-- → Sends value back

-- POSITIONAL ASSOCIATION
-- → Values are passed according to parameter order

-- NAMED ASSOCIATION
-- → Values are passed using parameter names

-- BEGIN...END
-- → Groups multiple statements
