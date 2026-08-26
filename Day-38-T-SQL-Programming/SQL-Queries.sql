/*
===========================================================
SQL LEARNING JOURNEY — DAY 38
Topic: T-SQL Programming (Transact-SQL)
===========================================================

Topics Covered:
1. T-SQL Programming
2. Anonymous Blocks
3. DECLARE
4. SET
5. PRINT
6. Basic Calculations
7. Date Functions
8. SELECT Into Variables
9. DML / DQL / TCL with T-SQL
10. Practical T-SQL Programs
===========================================================
*/


/* =========================================================
   1. DECLARE VARIABLES
   ========================================================= */

DECLARE @x INT;

DECLARE @s VARCHAR(10);

DECLARE @d DATE;


/* Multiple Variables */

DECLARE @a INT,
        @b INT,
        @c INT;


/* =========================================================
   2. SET — ASSIGN VALUES
   ========================================================= */

SET @x = 100;

SET @s = 'Hello';

SET @d = GETDATE();


/* =========================================================
   3. PRINT — DISPLAY VALUES
   ========================================================= */

PRINT @x;

PRINT @s;

PRINT @d;


/* =========================================================
   4. BASIC PROGRAM — ADD TWO NUMBERS
   ========================================================= */

DECLARE @a1 INT,
        @b1 INT,
        @c1 INT;

SET @a1 = 100;

SET @b1 = 200;

SET @c1 = @a1 + @b1;

PRINT @c1;


/* =========================================================
   5. ADD TWO NUMBERS — USING PRINT MESSAGE
   ========================================================= */

DECLARE @num1 INT,
        @num2 INT,
        @result INT;

SET @num1 = 100;

SET @num2 = 200;

SET @result = @num1 + @num2;

PRINT 'Sum = ' + CAST(@result AS VARCHAR);


/* =========================================================
   6. INPUT DATE AND PRINT DAY OF WEEK
   ========================================================= */

DECLARE @date1 DATE;

SET @date1 = '2025-01-01';

PRINT DATENAME(DW, @date1);


/* =========================================================
   7. CURRENT DATE
   ========================================================= */

DECLARE @today DATE;

SET @today = GETDATE();

PRINT @today;


/* =========================================================
   8. SELECT DATA INTO VARIABLES
   ========================================================= */

DECLARE @eno INT,
        @name VARCHAR(10),
        @sal MONEY;

SET @eno = 7369;

SELECT @name = ENAME,
       @sal = SAL
FROM EMP
WHERE EMPNO = @eno;

PRINT @name + ' ' + CAST(@sal AS VARCHAR);


/* =========================================================
   9. SELECT MULTIPLE VALUES INTO VARIABLES
   ========================================================= */

DECLARE @empno INT,
        @ename VARCHAR(10),
        @salary MONEY;

SET @empno = 7566;

SELECT @ename = ENAME,
       @salary = SAL
FROM EMP
WHERE EMPNO = @empno;

PRINT 'Employee = ' + @ename;

PRINT 'Salary = ' + CAST(@salary AS VARCHAR);


/* =========================================================
   10. CALCULATE EXPERIENCE
   ========================================================= */

DECLARE @eno2 INT,
        @hire DATE,
        @expr INT;

SET @eno2 = 7566;

SELECT @hire = HIREDATE
FROM EMP
WHERE EMPNO = @eno2;

SET @expr = DATEDIFF(YEAR, @hire, GETDATE());

PRINT 'Experience = '
      + CAST(@expr AS VARCHAR)
      + ' Years';


/* =========================================================
   11. CALCULATE TOTAL SALARY
   Total Salary = Salary + Commission
   ========================================================= */

DECLARE @eno3 INT,
        @sal2 MONEY,
        @comm MONEY,
        @totsal MONEY;

SET @eno3 = 7566;

SELECT @sal2 = SAL,
       @comm = COMM
FROM EMP
WHERE EMPNO = @eno3;

SET @totsal = @sal2 + ISNULL(@comm, 0);

PRINT 'Total Sal = '
      + CAST(@totsal AS VARCHAR);


/* =========================================================
   12. CHECK EMPLOYEE SALARY
   ========================================================= */

DECLARE @eno4 INT,
        @salary2 MONEY;

SET @eno4 = 7566;

SELECT @salary2 = SAL
FROM EMP
WHERE EMPNO = @eno4;

PRINT 'Salary = ' + CAST(@salary2 AS VARCHAR);


/* =========================================================
   13. DML USING T-SQL
   INSERT
   ========================================================= */

DECLARE @newEmpNo INT;

SET @newEmpNo = 8888;

INSERT INTO EMP
(
    EMPNO,
    ENAME,
    SAL
)
VALUES
(
    @newEmpNo,
    'TEST',
    3000
);


/* =========================================================
   14. DML USING T-SQL
   UPDATE
   ========================================================= */

DECLARE @updateEmpNo INT;

SET @updateEmpNo = 8888;

UPDATE EMP
SET SAL = 3500
WHERE EMPNO = @updateEmpNo;


/* =========================================================
   15. DML USING T-SQL
   DELETE
   ========================================================= */

DECLARE @deleteEmpNo INT;

SET @deleteEmpNo = 8888;

DELETE FROM EMP
WHERE EMPNO = @deleteEmpNo;


/* =========================================================
   16. IF-ELSE
   ========================================================= */

DECLARE @marks INT;

SET @marks = 75;

IF @marks >= 40
    PRINT 'PASS';
ELSE
    PRINT 'FAIL';


/* =========================================================
   17. IF-ELSE — SALARY CHECK
   ========================================================= */

DECLARE @salary3 MONEY;

SET @salary3 = 5000;

IF @salary3 >= 5000
    PRINT 'HIGH SALARY';
ELSE
    PRINT 'LOW SALARY';


/* =========================================================
   18. WHILE LOOP
   ========================================================= */

DECLARE @i INT;

SET @i = 1;

WHILE @i <= 5
BEGIN
    PRINT @i;

    SET @i = @i + 1;
END;


/* =========================================================
   19. WHILE LOOP — EVEN NUMBERS
   ========================================================= */

DECLARE @n INT;

SET @n = 2;

WHILE @n <= 10
BEGIN
    PRINT @n;

    SET @n = @n + 2;
END;


/* =========================================================
   20. STRING CONCATENATION
   ========================================================= */

DECLARE @firstName VARCHAR(20),
        @lastName VARCHAR(20);

SET @firstName = 'Subhash';

SET @lastName = 'Yadav';

PRINT @firstName + ' ' + @lastName;


/* =========================================================
   21. CAST() WITH PRINT
   ========================================================= */

DECLARE @salary4 MONEY;

SET @salary4 = 5000;

PRINT 'Salary = '
      + CAST(@salary4 AS VARCHAR);


/* =========================================================
   22. ISNULL() WITH T-SQL
   ========================================================= */

DECLARE @commission MONEY;

SET @commission = NULL;

PRINT 'Commission = '
      + CAST(ISNULL(@commission, 0) AS VARCHAR);


/* =========================================================
   23. DATE DIFFERENCE
   ========================================================= */

DECLARE @startDate DATE,
        @endDate DATE,
        @days INT;

SET @startDate = '2025-01-01';

SET @endDate = GETDATE();

SET @days = DATEDIFF(DAY, @startDate, @endDate);

PRINT 'Days = ' + CAST(@days AS VARCHAR);


/* =========================================================
   24. DATENAME() EXAMPLES
   ========================================================= */

DECLARE @date2 DATE;

SET @date2 = '2025-01-01';

PRINT DATENAME(YEAR, @date2);

PRINT DATENAME(MONTH, @date2);

PRINT DATENAME(DAY, @date2);

PRINT DATENAME(WEEKDAY, @date2);


/* =========================================================
   25. SELECT COUNT INTO VARIABLE
   ========================================================= */

DECLARE @empCount INT;

SELECT @empCount = COUNT(*)
FROM EMP;

PRINT 'Total Employees = '
      + CAST(@empCount AS VARCHAR);


/* =========================================================
   26. SELECT MAX SALARY INTO VARIABLE
   ========================================================= */

DECLARE @maxSalary MONEY;

SELECT @maxSalary = MAX(SAL)
FROM EMP;

PRINT 'Maximum Salary = '
      + CAST(@maxSalary AS VARCHAR);


/* =========================================================
   27. SELECT MIN SALARY INTO VARIABLE
   ========================================================= */

DECLARE @minSalary MONEY;

SELECT @minSalary = MIN(SAL)
FROM EMP;

PRINT 'Minimum Salary = '
      + CAST(@minSalary AS VARCHAR);


/* =========================================================
   28. SELECT AVG SALARY INTO VARIABLE
   ========================================================= */

DECLARE @avgSalary MONEY;

SELECT @avgSalary = AVG(SAL)
FROM EMP;

PRINT 'Average Salary = '
      + CAST(@avgSalary AS VARCHAR);


/* =========================================================
   29. T-SQL TRANSACTION
   ========================================================= */

BEGIN TRANSACTION;

UPDATE EMP
SET SAL = SAL + 500
WHERE DEPTNO = 10;

-- COMMIT TRANSACTION;

-- ROLLBACK TRANSACTION;


/* =========================================================
   30. SAVE TRANSACTION
   ========================================================= */

BEGIN TRANSACTION;

UPDATE EMP
SET SAL = SAL + 100
WHERE DEPTNO = 10;

SAVE TRANSACTION S1;

UPDATE EMP
SET SAL = SAL + 200
WHERE DEPTNO = 20;

-- ROLLBACK TRANSACTION S1;

-- COMMIT TRANSACTION;


/* =========================================================
   QUICK MEMORY
   =========================================================

   DECLARE  → Create Variable
   SET      → Assign Value
   PRINT    → Display Value
   SELECT   → Store Query Result
   IF-ELSE  → Conditional Execution
   WHILE    → Repeated Execution
   DML      → INSERT / UPDATE / DELETE / MERGE
   DQL      → SELECT
   TCL      → COMMIT / ROLLBACK / SAVE TRANSACTION
   ========================================================= */
