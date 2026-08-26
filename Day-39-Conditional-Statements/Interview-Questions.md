# SQL Server — Day 39 Interview Questions

## Topic: Conditional Statements

---

## 1. What are Conditional Statements in SQL Server?

**Answer:**

Conditional statements are used to execute different SQL statements based on whether a specified condition is **TRUE or FALSE**.

SQL Server mainly provides:

1. **IF-ELSE**
2. **ELSE IF / Multiple IF**
3. **Nested IF**

---

## 2. What is IF-ELSE?

**Answer:**

`IF-ELSE` is a control-flow statement used to execute one block of statements when a condition is TRUE and another block when the condition is FALSE.

**Syntax:**

```sql
IF condition
BEGIN
    statements
END
ELSE
BEGIN
    statements
END
```

**Example:**

```sql
DECLARE @marks INT = 75;

IF @marks >= 35
BEGIN
    PRINT 'PASS';
END
ELSE
BEGIN
    PRINT 'FAIL';
END
```

---

## 3. What is ELSE IF?

**Answer:**

`ELSE IF` is used when we need to check **multiple conditions** one after another.

**Example:**

```sql
DECLARE @marks INT = 75;

IF @marks >= 90
    PRINT 'EXCELLENT';
ELSE IF @marks >= 60
    PRINT 'GOOD';
ELSE IF @marks >= 35
    PRINT 'PASS';
ELSE
    PRINT 'FAIL';
```

SQL Server checks the conditions from **top to bottom**.

---

## 4. What is a Nested IF?

**Answer:**

An `IF` statement written inside another `IF` statement is called a **Nested IF**.

**Example:**

```sql
DECLARE @salary MONEY = 6000;
DECLARE @job VARCHAR(20) = 'MANAGER';

IF @salary > 5000
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
END
```

---

## 5. What is the difference between IF-ELSE and ELSE IF?

**Answer:**

**IF-ELSE:**

Used when there are mainly **two possible execution paths**.

```text
Condition TRUE  → IF block
Condition FALSE → ELSE block
```

**ELSE IF:**

Used when there are **multiple conditions** to check.

```text
Condition 1
    ↓
Condition 2
    ↓
Condition 3
    ↓
ELSE
```

---

## 6. What is the difference between ELSE IF and Nested IF?

**Answer:**

**ELSE IF** checks multiple conditions at the same level.

```sql
IF condition1
    ...
ELSE IF condition2
    ...
ELSE
    ...
```

**Nested IF** contains one `IF` statement inside another `IF`.

```sql
IF condition1
BEGIN
    IF condition2
    BEGIN
        ...
    END
END
```

---

## 7. What is BEGIN...END in T-SQL?

**Answer:**

`BEGIN...END` is used to group multiple SQL statements into a single block.

**Example:**

```sql
IF @salary > 5000
BEGIN
    PRINT 'High Salary';

    UPDATE EMP
    SET SAL = SAL + 500;
END
```

Without `BEGIN...END`, an `IF` generally controls only the next statement.

---

## 8. Can IF-ELSE execute INSERT, UPDATE and DELETE statements?

**Answer:**

Yes.

`IF-ELSE` can be used to conditionally execute DML statements such as:

* `INSERT`
* `UPDATE`
* `DELETE`

**Example:**

```sql
IF @salary > 5000
BEGIN
    UPDATE EMP
    SET SAL = SAL + 500
    WHERE EMPNO = @eno;
END
ELSE
BEGIN
    DELETE FROM EMP
    WHERE EMPNO = @eno;
END
```

---

## 9. How can we cancel a salary increment using IF-ELSE?

**Answer:**

We can use a **transaction** with `IF-ELSE`.

If the salary exceeds the specified limit, we can use `ROLLBACK`; otherwise, we can use `COMMIT`.

**Example:**

```sql
BEGIN TRANSACTION;

UPDATE EMP
SET SAL = SAL + @amt
WHERE EMPNO = @eno;

SELECT @sal = SAL
FROM EMP
WHERE EMPNO = @eno;

IF @sal > 5000
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;
```

---

## 10. What is COMMIT?

**Answer:**

`COMMIT` permanently saves the changes made during the current transaction.

**Example:**

```sql
BEGIN TRANSACTION;

UPDATE EMP
SET SAL = SAL + 500
WHERE EMPNO = 7566;

COMMIT TRANSACTION;
```

---

## 11. What is ROLLBACK?

**Answer:**

`ROLLBACK` cancels the changes made during a transaction and returns the database to its previous transaction state.

**Example:**

```sql
BEGIN TRANSACTION;

UPDATE EMP
SET SAL = SAL + 500
WHERE EMPNO = 7566;

ROLLBACK TRANSACTION;
```

---

## 12. What is DATEDIFF() and how can it be used with IF-ELSE?

**Answer:**

`DATEDIFF()` returns the difference between two dates based on a specified date part.

**Example:**

```sql
DECLARE @hire DATE;
DECLARE @expr INT;

SELECT @hire = HIREDATE
FROM EMP
WHERE EMPNO = 7566;

SET @expr = DATEDIFF(YEAR, @hire, GETDATE());

IF @expr > 40
BEGIN
    DELETE FROM EMP
    WHERE EMPNO = 7566;
END
ELSE
BEGIN
    UPDATE EMP
    SET SAL = SAL + (SAL * 0.10)
    WHERE EMPNO = 7566;
END
```

---

## 13. How can we implement different salary increments based on JOB?

**Answer:**

We can use `IF...ELSE IF...ELSE` to assign different increment percentages based on the employee's job.

For example:

```text
CLERK     → 10%
SALESMAN  → 15%
MANAGER   → 20%
OTHERS    → 5%
```

**Example:**

```sql
IF @job = 'CLERK'
    SET @pct = 10;
ELSE IF @job = 'SALESMAN'
    SET @pct = 15;
ELSE IF @job = 'MANAGER'
    SET @pct = 20;
ELSE
    SET @pct = 5;
```

---

## 14. How can IF-ELSE be used to implement a bank transaction?

**Answer:**

We can use `IF-ELSE` to identify whether the transaction is a **Withdrawal (W)** or **Deposit (D)**.

For withdrawal, we can use a Nested IF to check whether sufficient balance is available.

**Example:**

```sql
IF @type = 'W'
BEGIN

    SELECT @bal = BAL
    FROM ACCOUNTS
    WHERE ACCNO = @acno;

    IF @amt > @bal
        PRINT 'INSUFFICIENT BALANCE';
    ELSE
    BEGIN
        UPDATE ACCOUNTS
        SET BAL = BAL - @amt
        WHERE ACCNO = @acno;
    END

END
ELSE IF @type = 'D'
BEGIN

    UPDATE ACCOUNTS
    SET BAL = BAL + @amt
    WHERE ACCNO = @acno;

END
ELSE
BEGIN
    PRINT 'INVALID TRANSACTION TYPE';
END
```

---

## 15. What is the use of Nested IF in a bank transaction?

**Answer:**

Nested IF can be used when one condition depends on another condition.

For example:

```text
Transaction Type = Withdrawal
        ↓
Check Balance
        ↓
Sufficient Balance?
     ↙       ↘
   YES       NO
    ↓         ↓
Withdraw    Insufficient
```

The outer `IF` checks the transaction type, while the inner `IF` checks the account balance.

---

## 16. How can we calculate student result using IF-ELSE?

**Answer:**

We can check whether the student has passed all subjects.

**Example:**

```sql
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
```

If marks in all subjects are at least `35`, the result is **PASS**; otherwise, it is **FAIL**.

---

## 17. Can IF-ELSE be used with variables?

**Answer:**

Yes.

Variables can be used inside conditions and their values can be changed based on the condition.

**Example:**

```sql
DECLARE @salary MONEY;
DECLARE @increment INT;

SET @salary = 5000;

IF @salary >= 5000
    SET @increment = 20;
ELSE
    SET @increment = 10;

PRINT @increment;
```

---

## 18. What is the difference between IF-ELSE and CASE in SQL Server?

**Answer:**

`IF-ELSE` is a **control-flow statement** used to control which SQL statements are executed.

`CASE` is an **expression** used to return a value based on conditions.

**IF-ELSE:**

```sql
IF @salary > 5000
    PRINT 'HIGH';
ELSE
    PRINT 'LOW';
```

**CASE:**

```sql
SELECT
    CASE
        WHEN SAL > 5000 THEN 'HIGH'
        ELSE 'LOW'
    END AS SalaryStatus
FROM EMP;
```

---

## 19. What happens if none of the IF or ELSE IF conditions are TRUE?

**Answer:**

If an `ELSE` block is present, the `ELSE` block will execute.

If there is no `ELSE` block, SQL Server simply skips the conditional statement.

**Example:**

```sql
IF @marks >= 90
    PRINT 'EXCELLENT';
ELSE IF @marks >= 60
    PRINT 'GOOD';
ELSE
    PRINT 'OTHER';
```

---

## 20. What are the main practical uses of Conditional Statements?

**Answer:**

Conditional statements are commonly used for:

1. Salary calculations
2. Employee validations
3. Bank transactions
4. Student result processing
5. Conditional INSERT
6. Conditional UPDATE
7. Conditional DELETE
8. Transaction control
9. Business rules
10. Data validation

---

## 21. Write a program to increase salary only if salary is less than 5000.

**Answer:**

```sql
DECLARE @eno INT = 7566;
DECLARE @sal MONEY;

SELECT @sal = SAL
FROM EMP
WHERE EMPNO = @eno;

IF @sal < 5000
BEGIN
    UPDATE EMP
    SET SAL = SAL + 500
    WHERE EMPNO = @eno;

    PRINT 'SALARY INCREASED';
END
ELSE
BEGIN
    PRINT 'SALARY ALREADY 5000 OR MORE';
END
```

---

## 22. Write a program to find whether an employee is experienced or fresher.

**Answer:**

```sql
DECLARE @eno INT = 7566;
DECLARE @hire DATE;
DECLARE @expr INT;

SELECT @hire = HIREDATE
FROM EMP
WHERE EMPNO = @eno;

SET @expr = DATEDIFF(YEAR, @hire, GETDATE());

IF @expr >= 5
    PRINT 'EXPERIENCED EMPLOYEE';
ELSE
    PRINT 'LESS EXPERIENCED EMPLOYEE';
```

---

## 23. What is the execution flow of IF-ELSE?

**Answer:**

The execution flow is:

```text
IF condition
      ↓
   TRUE?
   /   \
 YES    NO
  ↓      ↓
IF     ELSE
Block   Block
```

Only the appropriate block is executed based on the condition.

---

## 24. What are the three important Conditional Statements covered in Day 39?

**Answer:**

The three important conditional statements are:

1. **IF-ELSE**
2. **MULTI IF / ELSE IF**
3. **NESTED IF**

These are used to implement conditional business logic in T-SQL.

---

## 25. Give a real-world example of Conditional Statements in SQL Server.

**Answer:**

A bank transaction is a good real-world example.

```text
Transaction Type
       ↓
   Withdrawal?
   ↙          ↘
 YES           NO
 ↓              ↓
Check         Deposit
Balance
 ↓
Sufficient?
 ↙      ↘
YES      NO
 ↓        ↓
Withdraw  Insufficient
```

This can be implemented using **IF-ELSE and Nested IF** in T-SQL.

---

# Quick Revision

```text
IF-ELSE
→ Executes one of two blocks based on a condition.

ELSE IF
→ Used to check multiple conditions.

NESTED IF
→ IF statement inside another IF.

BEGIN...END
→ Groups multiple statements.

COMMIT
→ Permanently saves transaction changes.

ROLLBACK
→ Cancels transaction changes.

DATEDIFF()
→ Calculates difference between two dates.

IF-ELSE + TRANSACTION
→ Useful for conditional database operations.

IF-ELSE + DML
→ Can conditionally execute INSERT, UPDATE and DELETE.

IF-ELSE vs CASE
→ IF-ELSE = Control Flow
→ CASE = Expression
```

---

# Most Important Interview Questions ⭐

1. What are Conditional Statements in SQL Server?
2. What is IF-ELSE?
3. What is ELSE IF?
4. What is Nested IF?
5. Difference between IF-ELSE and ELSE IF?
6. Difference between ELSE IF and Nested IF?
7. What is BEGIN...END?
8. What is COMMIT?
9. What is ROLLBACK?
10. Difference between IF-ELSE and CASE?
11. How do you implement a bank transaction using IF-ELSE?
12. How do you find PASS/FAIL using IF-ELSE?
13. How do you perform conditional UPDATE/DELETE?
14. How do you use IF-ELSE with a transaction?
15. What are the practical uses of Conditional Statements?
