# SQL Server — Day 43: Error Handling / Exception Handling

## 1. Runtime Error Example

```sql
DECLARE @x TINYINT;

SET @x = 1000;

PRINT @x;
```

---

## 2. Basic TRY-CATCH Example

```sql
DECLARE @a TINYINT;
DECLARE @b TINYINT;
DECLARE @c TINYINT;

BEGIN TRY

    SET @a = 100;
    SET @b = 20;

    SET @c = @a / @b;

    PRINT @c;

END TRY

BEGIN CATCH

    PRINT 'ERROR';

END CATCH;
```

---

## 3. Divide by Zero Error Handling

```sql
DECLARE @a INT;
DECLARE @b INT;
DECLARE @c INT;

BEGIN TRY

    SET @a = 100;
    SET @b = 0;

    SET @c = @a / @b;

    PRINT @c;

END TRY

BEGIN CATCH

    PRINT 'ERROR OCCURRED';

END CATCH;
```

---

## 4. Using ERROR_NUMBER() and ERROR_MESSAGE()

```sql
DECLARE @a INT;
DECLARE @b INT;
DECLARE @c INT;

BEGIN TRY

    SET @a = 100;
    SET @b = 0;

    SET @c = @a / @b;

    PRINT @c;

END TRY

BEGIN CATCH

    PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));

    PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();

END CATCH;
```

---

## 5. Handling Specific Errors

```sql
DECLARE @a TINYINT;
DECLARE @b TINYINT;
DECLARE @c TINYINT;

BEGIN TRY

    SET @a = 100;
    SET @b = 0;

    SET @c = @a / @b;

    PRINT @c;

END TRY

BEGIN CATCH

    IF ERROR_NUMBER() = 220
        PRINT 'VALUE EXCEEDING LIMIT';

    ELSE IF ERROR_NUMBER() = 8134
        PRINT 'DIVISOR CANNOT BE ZERO';

    ELSE
        PRINT 'UNKNOWN ERROR';

END CATCH;
```

---

## 6. View SQL Server Error Messages

```sql
SELECT *
FROM SYS.MESSAGES;
```

---

## 7. Create EMP44 Table

```sql
CREATE TABLE EMP44
(
    EMPID INT PRIMARY KEY,
    ENAME VARCHAR(10) NOT NULL,
    SAL MONEY CHECK (SAL >= 3000)
);
```

---

## 8. Insert Data with Error Handling

```sql
DECLARE @eno INT;
DECLARE @name VARCHAR(10);
DECLARE @sal MONEY;

BEGIN TRY

    SET @eno = 101;
    SET @name = 'B';
    SET @sal = 1000;

    INSERT INTO EMP44
    VALUES (@eno, @name, @sal);

END TRY

BEGIN CATCH

    IF ERROR_NUMBER() = 2627
        PRINT 'EMPNO SHOULD NOT BE DUPLICATE';

    ELSE IF ERROR_NUMBER() = 515
        PRINT 'NAME SHOULD NOT BE NULL';

    ELSE IF ERROR_NUMBER() = 547
        PRINT 'SALARY SHOULD BE GREATER THAN OR EQUAL TO 3000';

    ELSE
        PRINT ERROR_MESSAGE();

END CATCH;
```

---

## 9. Duplicate Primary Key Error

```sql
BEGIN TRY

    INSERT INTO EMP44
    VALUES (101, 'A', 5000);

END TRY

BEGIN CATCH

    IF ERROR_NUMBER() = 2627
        PRINT 'EMPID SHOULD NOT BE DUPLICATE';

    ELSE
        PRINT ERROR_MESSAGE();

END CATCH;
```

---

## 10. NOT NULL Constraint Error

```sql
BEGIN TRY

    INSERT INTO EMP44
    VALUES (102, NULL, 5000);

END TRY

BEGIN CATCH

    IF ERROR_NUMBER() = 515
        PRINT 'ENAME SHOULD NOT BE NULL';

    ELSE
        PRINT ERROR_MESSAGE();

END CATCH;
```

---

## 11. CHECK Constraint Error

```sql
BEGIN TRY

    INSERT INTO EMP44
    VALUES (103, 'C', 1000);

END TRY

BEGIN CATCH

    IF ERROR_NUMBER() = 547
        PRINT 'SALARY SHOULD BE GREATER THAN OR EQUAL TO 3000';

    ELSE
        PRINT ERROR_MESSAGE();

END CATCH;
```

---

## 12. RAISERROR() Basic Example

```sql
RAISERROR('USER DEFINED ERROR', 16, 1);
```

---

## 13. Prevent Salary Update on Sunday

```sql
DECLARE @eno INT;
DECLARE @amt MONEY;

SET @eno = 7369;
SET @amt = 1000;

IF DATENAME(WEEKDAY, GETDATE()) = 'SUNDAY'

    RAISERROR('SUNDAY UPDATE NOT ALLOWED', 16, 1);

ELSE

    UPDATE EMP
    SET SAL = SAL + @amt
    WHERE EMPNO = @eno;
```

---

## 14. Divide Two Numbers with RAISERROR()

```sql
DECLARE @a INT;
DECLARE @b INT;
DECLARE @c INT;

BEGIN TRY

    SET @a = 100;
    SET @b = 0;

    SET @c = @a / @b;

    PRINT @c;

END TRY

BEGIN CATCH

    IF ERROR_NUMBER() = 220

        RAISERROR('VALUE EXCEEDING LIMIT', 16, 1);

    ELSE IF ERROR_NUMBER() = 8134

        RAISERROR('DIVISOR CANNOT BE ZERO', 16, 1);

    ELSE

        PRINT ERROR_MESSAGE();

END CATCH;
```

---

## 15. Create ACCOUNTS Table

```sql
CREATE TABLE ACCOUNTS
(
    ACCNO INT PRIMARY KEY,
    ACTYPE CHAR(1),
    BAL MONEY
);
```

---

## 16. Insert Account Records

```sql
INSERT INTO ACCOUNTS
VALUES
(100, 'S', 10000),
(101, 'S', 20000);
```

---

## 17. Create TRANSACTIONS Table

```sql
CREATE TABLE TRANSACTIONS
(
    TRID INT PRIMARY KEY,
    TTYPE CHAR(1),
    TDATE DATETIME,
    TAMT MONEY,
    ACCNO INT
);
```

---

## 18. Create Sequence for Transaction ID

```sql
CREATE SEQUENCE S10
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999;
```

---

## 19. Money Transfer with TRY-CATCH

```sql
DECLARE @sacno INT;
DECLARE @tacno INT;
DECLARE @amt MONEY;
DECLARE @bal MONEY;

DECLARE @cnt1 INT;
DECLARE @cnt2 INT;

DECLARE @msg VARCHAR(1000);

BEGIN TRY

    SET @sacno = 100;
    SET @tacno = 101;
    SET @amt = 1000;

    -- Check Source Account
    SELECT @cnt1 = COUNT(*)
    FROM ACCOUNTS
    WHERE ACCNO = @sacno;

    IF @cnt1 = 0
        RAISERROR('SOURCE ACCOUNT DOES NOT EXIST', 16, 1);

    -- Check Target Account
    SELECT @cnt2 = COUNT(*)
    FROM ACCOUNTS
    WHERE ACCNO = @tacno;

    IF @cnt2 = 0
        RAISERROR('TARGET ACCOUNT DOES NOT EXIST', 16, 1);

    -- Check Source Account Balance
    SELECT @bal = BAL
    FROM ACCOUNTS
    WHERE ACCNO = @sacno;

    IF @amt > @bal
        RAISERROR('INSUFFICIENT BALANCE', 16, 1);

    BEGIN TRANSACTION;

    -- Debit Source Account
    UPDATE ACCOUNTS
    SET BAL = BAL - @amt
    WHERE ACCNO = @sacno;

    -- Credit Target Account
    UPDATE ACCOUNTS
    SET BAL = BAL + @amt
    WHERE ACCNO = @tacno;

    -- Insert Withdrawal Transaction
    INSERT INTO TRANSACTIONS
    VALUES
    (
        NEXT VALUE FOR S10,
        'W',
        GETDATE(),
        @amt,
        @sacno
    );

    -- Insert Deposit Transaction
    INSERT INTO TRANSACTIONS
    VALUES
    (
        NEXT VALUE FOR S10,
        'D',
        GETDATE(),
        @amt,
        @tacno
    );

    COMMIT TRANSACTION;

    PRINT 'MONEY TRANSFER SUCCESSFUL';

END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    SET @msg = ERROR_MESSAGE();

    PRINT 'ERROR: ' + @msg;

END CATCH;
```

---

## 20. Money Transfer with User-Friendly Error

```sql
DECLARE @sacno INT = 100;
DECLARE @tacno INT = 101;
DECLARE @amt MONEY = 1000;

DECLARE @bal MONEY;
DECLARE @msg VARCHAR(1000);

BEGIN TRY

    SELECT @bal = BAL
    FROM ACCOUNTS
    WHERE ACCNO = @sacno;

    IF @bal IS NULL
        RAISERROR('SOURCE ACCOUNT DOES NOT EXIST', 16, 1);

    IF NOT EXISTS
    (
        SELECT 1
        FROM ACCOUNTS
        WHERE ACCNO = @tacno
    )
        RAISERROR('TARGET ACCOUNT DOES NOT EXIST', 16, 1);

    IF @amt > @bal
        RAISERROR('INSUFFICIENT BALANCE', 16, 1);

    BEGIN TRANSACTION;

    UPDATE ACCOUNTS
    SET BAL = BAL - @amt
    WHERE ACCNO = @sacno;

    UPDATE ACCOUNTS
    SET BAL = BAL + @amt
    WHERE ACCNO = @tacno;

    COMMIT TRANSACTION;

    PRINT 'TRANSFER COMPLETED SUCCESSFULLY';

END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    SET @msg = ERROR_MESSAGE();

    RAISERROR(@msg, 16, 1);

END CATCH;
```

---

# Quick Revision Queries

```sql
-- TRY-CATCH Structure

BEGIN TRY

    -- Statements that may cause an error

END TRY

BEGIN CATCH

    -- Error handling statements

END CATCH;
```

```sql
-- Error Number

SELECT ERROR_NUMBER();
```

```sql
-- Error Message

SELECT ERROR_MESSAGE();
```

```sql
-- Raise User Defined Error

RAISERROR('ERROR MESSAGE', 16, 1);
```

```sql
-- Check Active Transaction

SELECT @@TRANCOUNT;
```

```sql
-- Commit Transaction

COMMIT TRANSACTION;
```

```sql
-- Rollback Transaction

ROLLBACK TRANSACTION;
```

# Day 43 Complete

**Topics Covered:**

* Syntax Errors
* Logical Errors
* Runtime Errors / Exceptions
* TRY-CATCH
* ERROR_NUMBER()
* ERROR_MESSAGE()
* SYS.MESSAGES
* RAISERROR()
* Severity Levels
* State
* Constraint Error Handling
* Transaction Error Handling
* COMMIT
* ROLLBACK
* Real-World Money Transfer Program
