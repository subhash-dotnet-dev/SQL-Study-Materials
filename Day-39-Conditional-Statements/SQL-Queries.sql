/*
===========================================================
SQL LEARNING JOURNEY — DAY 39
Topic: Conditional Statements
===========================================================

Topics Covered:
1. IF-ELSE
2. MULTI IF / ELSE IF
3. NESTED IF
4. Salary Increment with ROLLBACK / COMMIT
5. Experience Based DELETE / UPDATE
6. Job Based Salary Increment
7. Bank Transaction (Withdrawal / Deposit)
8. Student Result Calculation
9. Practical Conditional Programming

===========================================================
*/


/* =========================================================
   1. BASIC IF-ELSE
   ========================================================= */

DECLARE @marks INT;

SET @marks = 75;

IF @marks >= 35
BEGIN
    PRINT 'PASS';
END
ELSE
BEGIN
    PRINT 'FAIL';
END;


/* =========================================================
   2. IF-ELSE — SALARY CHECK
   ========================================================= */

DECLARE @salary MONEY;

SET @salary = 6000;

IF @salary > 5000
BEGIN
    PRINT 'HIGH SALARY';
END
ELSE
BEGIN
    PRINT 'NORMAL SALARY';
END;


/* =========================================================
   3. MULTI IF / ELSE IF
   ========================================================= */

DECLARE @marks2 INT;

SET @marks2 = 75;

IF @marks2 >= 90
BEGIN
    PRINT 'EXCELLENT';
END
ELSE IF @marks2 >= 60
BEGIN
    PRINT 'GOOD';
END
ELSE IF @marks2 >= 35
BEGIN
    PRINT 'PASS';
END
ELSE
BEGIN
    PRINT 'FAIL';
END;


/* =========================================================
   4. NESTED IF
   ========================================================= */

DECLARE @sal2 MONEY,
        @job VARCHAR(20);

SET @sal2 = 6000;
SET @job = 'MANAGER';

IF @sal2 > 5000
BEGIN

    IF @job = 'MANAGER'
    BEGIN
        PRINT 'HIGH SALARY MANAGER';
    END
    ELSE
    BEGIN
        PRINT 'HIGH SALARY EMPLOYEE';
    END

END
ELSE
BEGIN
    PRINT 'SALARY IS 5000 OR LESS';
END;


/* =========================================================
   5. SALARY INCREMENT
      IF SALARY EXCEEDS 5000 THEN ROLLBACK
      OTHERWISE COMMIT
   ========================================================= */

DECLARE @eno INT,
        @amt MONEY,
        @sal3 MONEY;

SET @eno = 7566;
SET @amt = 2500;

BEGIN TRANSACTION;

UPDATE EMP
SET SAL = SAL + @amt
WHERE EMPNO = @eno;

SELECT @sal3 = SAL
FROM EMP
WHERE EMPNO = @eno;

IF @sal3 > 5000
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'INCREMENT CANCELLED';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'INCREMENT SUCCESSFUL';
END;


/* =========================================================
   6. EXPERIENCE BASED DELETE / UPDATE
      IF EXPERIENCE > 40 YEARS → DELETE
      OTHERWISE → INCREMENT SALARY BY 10%
   ========================================================= */

DECLARE @eno2 INT,
        @hire DATE,
        @expr INT;

SET @eno2 = 7566;

SELECT @hire = HIREDATE
FROM EMP
WHERE EMPNO = @eno2;

SET @expr = DATEDIFF(YEAR, @hire, GETDATE());

IF @expr > 40
BEGIN

    DELETE FROM EMP
    WHERE EMPNO = @eno2;

    PRINT 'EMPLOYEE DELETED';

END
ELSE
BEGIN

    UPDATE EMP
    SET SAL = SAL + (SAL * 0.10)
    WHERE EMPNO = @eno2;

    PRINT 'SALARY INCREASED BY 10%';

END;


/* =========================================================
   7. JOB BASED SALARY INCREMENT
      CLERK    → 10%
      SALESMAN → 15%
      MANAGER  → 20%
      OTHERS   → 5%
   ========================================================= */

DECLARE @eno3 INT,
        @job2 VARCHAR(10),
        @pct TINYINT;

SET @eno3 = 7844;

SELECT @job2 = JOB
FROM EMP
WHERE EMPNO = @eno3;

IF @job2 = 'CLERK'
BEGIN
    SET @pct = 10;
END
ELSE IF @job2 = 'SALESMAN'
BEGIN
    SET @pct = 15;
END
ELSE IF @job2 = 'MANAGER'
BEGIN
    SET @pct = 20;
END
ELSE
BEGIN
    SET @pct = 5;
END;

UPDATE EMP
SET SAL = SAL + (SAL * @pct / 100.0)
WHERE EMPNO = @eno3;


/* =========================================================
   8. DISPLAY JOB BASED INCREMENT
   ========================================================= */

PRINT 'Employee Job = ' + @job2;

PRINT 'Increment Percentage = '
      + CAST(@pct AS VARCHAR);


/* =========================================================
   9. CREATE ACCOUNTS TABLE
   ========================================================= */

CREATE TABLE ACCOUNTS
(
    ACCNO INT PRIMARY KEY,
    ACTYPE CHAR(1),
    BAL MONEY
);


/* =========================================================
   10. INSERT ACCOUNT DATA
   ========================================================= */

INSERT INTO ACCOUNTS
VALUES
(100, 'S', 10000),
(101, 'S', 20000);


/* =========================================================
   11. CREATE TRANSACTIONS TABLE
   ========================================================= */

CREATE TABLE TRANSACTIONS
(
    TRID INT,
    TTYPE CHAR(1),
    TDATE DATETIME,
    TAMT MONEY,
    ACCNO INT REFERENCES ACCOUNTS(ACCNO)
);


/* =========================================================
   12. CREATE SEQUENCE
   ========================================================= */

CREATE SEQUENCE S10
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;


/* =========================================================
   13. BANK TRANSACTION
       WITHDRAWAL / DEPOSIT
   ========================================================= */

DECLARE @acno INT,
        @type CHAR(1),
        @amt MONEY,
        @bal MONEY;

SET @acno = 100;
SET @type = 'W';
SET @amt = 1000;


/* =========================================================
   14. WITHDRAWAL
   ========================================================= */

IF @type = 'W'
BEGIN

    SELECT @bal = BAL
    FROM ACCOUNTS
    WHERE ACCNO = @acno;


    /* =====================================================
       NESTED IF — CHECK BALANCE
       ===================================================== */

    IF @amt > @bal
    BEGIN

        PRINT 'INSUFFICIENT BALANCE';

    END
    ELSE
    BEGIN

        UPDATE ACCOUNTS
        SET BAL = BAL - @amt
        WHERE ACCNO = @acno;

        INSERT INTO TRANSACTIONS
        VALUES
        (
            NEXT VALUE FOR S10,
            'W',
            GETDATE(),
            @amt,
            @acno
        );

        PRINT 'WITHDRAWAL SUCCESSFUL';

    END

END


/* =========================================================
   15. DEPOSIT
   ========================================================= */

ELSE IF @type = 'D'
BEGIN

    UPDATE ACCOUNTS
    SET BAL = BAL + @amt
    WHERE ACCNO = @acno;

    INSERT INTO TRANSACTIONS
    VALUES
    (
        NEXT VALUE FOR S10,
        'D',
        GETDATE(),
        @amt,
        @acno
    );

    PRINT 'DEPOSIT SUCCESSFUL';

END


/* =========================================================
   16. INVALID TRANSACTION TYPE
   ========================================================= */

ELSE
BEGIN

    PRINT 'INVALID TRANSACTION TYPE';

END;


/* =========================================================
   17. DISPLAY ACCOUNT BALANCE
   ========================================================= */

SELECT *
FROM ACCOUNTS
WHERE ACCNO = @acno;


/* =========================================================
   18. DISPLAY TRANSACTION DETAILS
   ========================================================= */

SELECT *
FROM TRANSACTIONS
WHERE ACCNO = @acno;


/* =========================================================
   19. CREATE STUDENT TABLE
   ========================================================= */

CREATE TABLE STUDENT
(
    SNO INT,
    SNAME VARCHAR(10),
    S1 TINYINT,
    S2 TINYINT,
    S3 TINYINT
);


/* =========================================================
   20. INSERT STUDENT DATA
   ========================================================= */

INSERT INTO STUDENT
VALUES
(1, 'A', 80, 90, 70),
(2, 'B', 30, 60, 50);


/* =========================================================
   21. CREATE RESULT TABLE
   ========================================================= */

CREATE TABLE RESULT
(
    SNO INT,
    TOTAL INT,
    AVG DECIMAL(5,2),
    RESULT CHAR(4)
);


/* =========================================================
   22. CALCULATE STUDENT TOTAL, AVG & RESULT
   ========================================================= */

DECLARE @sno INT,
        @s1 TINYINT,
        @s2 TINYINT,
        @s3 TINYINT;

DECLARE @total INT,
        @avg DECIMAL(5,2),
        @res CHAR(4);

SET @sno = 1;

SELECT @s1 = S1,
       @s2 = S2,
       @s3 = S3
FROM STUDENT
WHERE SNO = @sno;


/* =========================================================
   23. CALCULATE TOTAL
   ========================================================= */

SET @total = @s1 + @s2 + @s3;


/* =========================================================
   24. CALCULATE AVERAGE
   ========================================================= */

SET @avg = @total / 3.0;


/* =========================================================
   25. CHECK PASS / FAIL
   ========================================================= */

IF @s1 >= 35
   AND @s2 >= 35
   AND @s3 >= 35
BEGIN

    SET @res = 'PASS';

END
ELSE
BEGIN

    SET @res = 'FAIL';

END;


/* =========================================================
   26. INSERT RESULT
   ========================================================= */

INSERT INTO RESULT
VALUES
(
    @sno,
    @total,
    @avg,
    @res
);


/* =========================================================
   27. DISPLAY RESULT
   ========================================================= */

SELECT *
FROM RESULT
WHERE SNO = @sno;


/* =========================================================
   QUICK MEMORY
   =========================================================

   IF-ELSE
   → Executes statements based on TRUE / FALSE condition

   ELSE IF
   → Checks multiple conditions

   NESTED IF
   → IF statement inside another IF

   BEGIN...END
   → Groups multiple statements

   COMMIT
   → Permanently saves transaction changes

   ROLLBACK
   → Cancels transaction changes

   DATEDIFF()
   → Calculates difference between dates

   GETDATE()
   → Returns current date and time

   NEXT VALUE FOR
   → Gets next value from a sequence

   IF-ELSE
   → Conditional Execution

   MULTI IF
   → Multiple Conditions

   NESTED IF
   → Conditional Statement Inside Another
   =========================================================
*/
