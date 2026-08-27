/*
===========================================================
SQL LEARNING JOURNEY — DAY 39
TOPIC: T-SQL CONDITIONAL STATEMENTS
===========================================================

Topics:
1. IF-ELSE
2. MULTI IF / ELSE IF
3. NESTED IF
4. Conditional UPDATE
5. Conditional DELETE
6. Transaction with IF-ELSE
7. Bank Transaction Logic
8. Student Result Logic
===========================================================
*/


/* =========================================================
   1. BASIC IF-ELSE
   ========================================================= */

DECLARE @x INT;

SET @x = 100;

IF @x > 50
BEGIN
    PRINT 'X is greater than 50';
END
ELSE
BEGIN
    PRINT 'X is less than or equal to 50';
END;


/* =========================================================
   2. MULTI IF / ELSE IF
   ========================================================= */

DECLARE @marks INT;

SET @marks = 75;

IF @marks >= 90
BEGIN
    PRINT 'Grade A+';
END
ELSE IF @marks >= 75
BEGIN
    PRINT 'Grade A';
END
ELSE IF @marks >= 60
BEGIN
    PRINT 'Grade B';
END
ELSE IF @marks >= 35
BEGIN
    PRINT 'Grade C';
END
ELSE
BEGIN
    PRINT 'FAIL';
END;


/* =========================================================
   3. NESTED IF
   ========================================================= */

DECLARE @age INT;
DECLARE @salary MONEY;

SET @age = 25;
SET @salary = 30000;

IF @age >= 18
BEGIN
    IF @salary >= 25000
    BEGIN
        PRINT 'Eligible';
    END
    ELSE
    BEGIN
        PRINT 'Salary is too low';
    END
END
ELSE
BEGIN
    PRINT 'Not eligible';
END;


/* =========================================================
   4. CONDITIONAL SALARY INCREMENT
   ========================================================= */

DECLARE @eno INT;
DECLARE @job VARCHAR(10);
DECLARE @pct TINYINT;

SET @eno = 7844;

SELECT @job = job
FROM EMP
WHERE empno = @eno;

IF @job = 'CLERK'
    SET @pct = 10;
ELSE IF @job = 'SALESMAN'
    SET @pct = 15;
ELSE IF @job = 'MANAGER'
    SET @pct = 20;
ELSE
    SET @pct = 5;

UPDATE EMP
SET sal = sal + (sal * @pct / 100)
WHERE empno = @eno;

SELECT empno, ename, job, sal
FROM EMP
WHERE empno = @eno;


/* =========================================================
   5. CONDITIONAL DELETE / UPDATE
   ========================================================= */

DECLARE @eno2 INT;
DECLARE @hire DATE;
DECLARE @expr TINYINT;

SET @eno2 = 7566;

SELECT @hire = hiredate
FROM EMP
WHERE empno = @eno2;

SET @expr = DATEDIFF(YEAR, @hire, GETDATE());

IF @expr > 40
BEGIN
    DELETE FROM EMP
    WHERE empno = @eno2;

    PRINT 'Employee deleted';
END
ELSE
BEGIN
    UPDATE EMP
    SET sal = sal + (sal * 0.10)
    WHERE empno = @eno2;

    PRINT 'Salary increased by 10%';
END;


/* =========================================================
   6. SALARY INCREMENT WITH TRANSACTION
   ========================================================= */

DECLARE @eno3 INT;
DECLARE @amt MONEY;
DECLARE @sal MONEY;

SET @eno3 = 7566;
SET @amt = 2500;

BEGIN TRANSACTION;

UPDATE EMP
SET sal = sal + @amt
WHERE empno = @eno3;

SELECT @sal = sal
FROM EMP
WHERE empno = @eno3;

IF @sal > 5000
BEGIN
    ROLLBACK;

    PRINT 'Salary exceeds 5000. Transaction rolled back.';
END
ELSE
BEGIN
    COMMIT;

    PRINT 'Salary updated successfully.';
END;


/* =========================================================
   7. BANK TRANSACTION
   ========================================================= */

CREATE TABLE ACCOUNTS
(
    ACCNO INT PRIMARY KEY,
    ACTYPE CHAR(1),
    BAL MONEY
);

INSERT INTO ACCOUNTS
VALUES
(100, 'S', 10000),
(101, 'S', 20000);


CREATE TABLE TRANSACTIONS
(
    TRID INT,
    TTYPE CHAR(1),
    TDATE DATETIME,
    TAMT MONEY,
    ACCNO INT REFERENCES ACCOUNTS(ACCNO)
);


CREATE SEQUENCE S10
START WITH 1
INCREMENT BY 1
MAXVALUE 99999;


/* =========================================================
   7A. BANK WITHDRAWAL / DEPOSIT
   ========================================================= */

DECLARE @acno INT;
DECLARE @type CHAR(1);
DECLARE @amt2 MONEY;
DECLARE @bal MONEY;

SET @acno = 100;
SET @type = 'W';
SET @amt2 = 1000;

IF @type = 'W'
BEGIN
    SELECT @bal = BAL
    FROM ACCOUNTS
    WHERE ACCNO = @acno;

    IF @amt2 > @bal
    BEGIN
        PRINT 'Insufficient Balance';
    END
    ELSE
    BEGIN
        UPDATE ACCOUNTS
        SET BAL = BAL - @amt2
        WHERE ACCNO = @acno;

        INSERT INTO TRANSACTIONS
        VALUES
        (
            NEXT VALUE FOR S10,
            'W',
            GETDATE(),
            @amt2,
            @acno
        );

        PRINT 'Withdrawal successful';
    END
END
ELSE IF @type = 'D'
BEGIN
    UPDATE ACCOUNTS
    SET BAL = BAL + @amt2
    WHERE ACCNO = @acno;

    INSERT INTO TRANSACTIONS
    VALUES
    (
        NEXT VALUE FOR S10,
        'D',
        GETDATE(),
        @amt2,
        @acno
    );

    PRINT 'Deposit successful';
END
ELSE
BEGIN
    PRINT 'Invalid Transaction Type';
END;


/* =========================================================
   7B. CHECK BANK DATA
   ========================================================= */

SELECT *
FROM ACCOUNTS;

SELECT *
FROM TRANSACTIONS;


/* =========================================================
   8. STUDENT RESULT
   ========================================================= */

CREATE TABLE STUDENT
(
    SNO INT,
    SNAME VARCHAR(10),
    S1 TINYINT,
    S2 TINYINT,
    S3 TINYINT
);

INSERT INTO STUDENT
VALUES
(1, 'A', 80, 90, 70),
(2, 'B', 30, 60, 50);


CREATE TABLE RESULT
(
    SNO INT,
    TOTAL INT,
    AVG DECIMAL(5,2),
    RESULT CHAR(4)
);


/* =========================================================
   8A. CALCULATE STUDENT RESULT
   ========================================================= */

DECLARE @sno INT;
DECLARE @s1 TINYINT;
DECLARE @s2 TINYINT;
DECLARE @s3 TINYINT;

DECLARE @total INT;
DECLARE @avg DECIMAL(5,2);
DECLARE @res CHAR(4);

SET @sno = 1;

SELECT
    @s1 = S1,
    @s2 = S2,
    @s3 = S3
FROM STUDENT
WHERE SNO = @sno;

SET @total = @s1 + @s2 + @s3;

SET @avg = @total / 3.0;

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

INSERT INTO RESULT
VALUES
(
    @sno,
    @total,
    @avg,
    @res
);


/* =========================================================
   8B. CHECK RESULT
   ========================================================= */

SELECT *
FROM RESULT;


/* =========================================================
   9. STUDENT RESULT FOR ANOTHER STUDENT
   ========================================================= */

SET @sno = 2;

SELECT
    @s1 = S1,
    @s2 = S2,
    @s3 = S3
FROM STUDENT
WHERE SNO = @sno;

SET @total = @s1 + @s2 + @s3;

SET @avg = @total / 3.0;

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

INSERT INTO RESULT
VALUES
(
    @sno,
    @total,
    @avg,
    @res
);


/* =========================================================
   10. FINAL RESULT
   ========================================================= */

SELECT *
FROM RESULT;


/* =========================================================
   QUICK REVISION
   =========================================================

   IF-ELSE
   → Two-way decision

   MULTI IF / ELSE IF
   → Multiple conditions

   NESTED IF
   → IF inside IF

   BEGIN...END
   → Groups multiple statements

   COMMIT
   → Saves transaction

   ROLLBACK
   → Undoes transaction

   IF + UPDATE
   → Conditional UPDATE

   IF + DELETE
   → Conditional DELETE

   IF + INSERT
   → Conditional INSERT

   DATEDIFF()
   → Calculates date difference

===========================================================
*/
