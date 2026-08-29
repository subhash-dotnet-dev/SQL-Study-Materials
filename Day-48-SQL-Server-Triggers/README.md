<div align="center">

# 🗄️ Day 48 — SQL Server: Triggers

### AFTER TRIGGER • INSTEAD OF TRIGGER • MAGIC TABLES • AUDITING

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts**  •  **🧠 Interview Preparation**  •  **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 48 focuses on **Triggers** in SQL Server and their practical use in controlling, validating, and auditing DML operations.

A Trigger is a **named T-SQL block** that is executed automatically by SQL Server when specified DML operations occur.

---

## 🎯 Learning Objectives

* What is a Trigger?
* AFTER / FOR Triggers
* INSTEAD OF Triggers
* INSERTED and DELETED Magic Tables
* DML validation
* Preventing unwanted updates
* Salary validation
* Employee resignation tracking
* DML auditing
* Listing user-created triggers
* Dropping triggers

---

# 🔹 1. What is a Trigger?

A Trigger is a named T-SQL block that executes **automatically** when an `INSERT`, `UPDATE`, or `DELETE` operation occurs on a table.

### Main Uses

* Control DML operations
* Enforce complex rules and validations
* Audit day-to-day table operations
* Protect data from invalid changes

---

# 🔹 2. Types of Triggers

## AFTER / FOR Trigger

The trigger executes **after** the DML operation.

```text
DML
 ↓
DML Executes
 ↓
TRIGGER Executes
```

Example:

```sql
CREATE OR ALTER TRIGGER T1
ON EMP
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Trigger logic
END;
```

---

## INSTEAD OF Trigger

The trigger executes **instead of** the DML operation.

```text
DML
 ↓
TRIGGER Executes
 ↓
DML Replaced / Controlled
```

Example:

```sql
CREATE OR ALTER TRIGGER T7
ON EMP44
INSTEAD OF INSERT
AS
BEGIN
    -- Validation
END;
```

---

# 🔹 3. Magic Tables

SQL Server provides two special temporary tables inside DML triggers:

```text
INSERTED → New Data
DELETED  → Old Data
```

### INSERT

```text
INSERTED → New Row
```

### DELETE

```text
DELETED → Deleted Row
```

### UPDATE

```text
DELETED  → Old Values
INSERTED → New Values
```

These tables exist only during trigger execution.

---

# 🔹 4. DML Restriction

Example: Prevent DML operations on Sunday.

```sql
CREATE OR ALTER TRIGGER T1
ON EMP
AFTER INSERT, UPDATE, DELETE
AS
IF DATENAME(DW, GETDATE()) = 'Sunday'
BEGIN
    ROLLBACK;
    RAISERROR('Sunday not allowed', 16, 1);
END;
```

---

# 🔹 5. Prevent Employee ID / Hire Date Update

```sql
CREATE OR ALTER TRIGGER T3
ON EMP
AFTER UPDATE
AS
IF UPDATE(EMPNO) OR UPDATE(HIREDATE)
BEGIN
    ROLLBACK;
    RAISERROR(
        'Cannot update empno and hiredate',
        16,
        1
    );
END;
```

---

# 🔹 6. Prevent Salary Decrement

The `INSERTED` and `DELETED` tables can be compared to validate salary changes.

```text
DELETED.SAL
    ↓
OLD SALARY

INSERTED.SAL
    ↓
NEW SALARY

NEW SALARY < OLD SALARY
        ↓
     ROLLBACK
```

Example:

```sql
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
    RAISERROR(
        'Salary cannot be decremented',
        16,
        1
    );
END;
```

---

# 🔹 7. Employee Resignation Tracking

When an employee is deleted from `EMP`, the deleted employee details can be stored in an `EMP_RESIGN` table.

```text
DELETE EMPLOYEE
      ↓
DELETED TABLE
      ↓
EMP_RESIGN
```

Example:

```sql
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
```

---

# 🔹 8. Auditing

Auditing means monitoring day-to-day activities such as:

* INSERT
* UPDATE
* DELETE

### Audit Flow

```text
INSERT / UPDATE / DELETE
          ↓
       TRIGGER
          ↓
   INSERTED + DELETED
          ↓
       EMP_AUDIT
```

Audit information can include:

* Username
* Operation
* Date / Time
* New Employee Data
* Old Employee Data

---

# 🔹 9. List User-Created Triggers

```sql
SELECT
    TR.NAME AS TRGNAME,
    TB.NAME AS TABNAME
FROM SYS.TRIGGERS AS TR
INNER JOIN SYS.TABLES AS TB
ON TR.PARENT_ID = TB.OBJECT_ID;
```

---

# 🔹 10. Drop Trigger

```sql
DROP TRIGGER T1;
```

---

# 🧠 Quick Memory

```text
TRIGGER → AUTOMATIC EXECUTION

AFTER → DML → TRIGGER

INSTEAD OF → TRIGGER → DML

INSERTED → NEW DATA

DELETED → OLD DATA

UPDATE → OLD + NEW DATA

ROLLBACK → REJECT INVALID OPERATION

AUDITING → TRACK DML ACTIVITIES
```

---

# 💼 Practical Scenarios

| Requirement                    | Trigger Concept    |
| ------------------------------ | ------------------ |
| Restrict Sunday DML            | AFTER Trigger      |
| Restrict Working Hours         | AFTER Trigger      |
| Prevent EMPNO update           | `UPDATE()`         |
| Prevent Salary Decrement       | INSERTED + DELETED |
| Track Employee Resignation     | DELETED            |
| Audit DML Operations           | INSERTED + DELETED |
| Limit Employees per Department | INSTEAD OF Trigger |

---

# 🎯 Day 48 Learning Flow

```text
T-SQL
  ↓
TRIGGERS
  ↓
AFTER / FOR
  ↓
INSTEAD OF
  ↓
MAGIC TABLES
  ↓
VALIDATION
  ↓
AUDITING
```

---

# 📂 Day 48 Files

```text
Day-48-SQL-Server-Triggers/
│
├── README.md
├── Quick-Notes.md
├── Interview-Questions.md
└── SQL-Queries.sql
```

---

<div align="center">

### ✅ DAY 48 COMPLETE! 🚀

**LEARN → PRACTICE → DOCUMENT → IMPROVE**

**SUBHASH YADAV | .NET FULL STACK DEVELOPER | LEARNING IN PUBLIC**

</div>
