# SQL Server — Day 48 Quick Notes

## 📌 Topic

**TRIGGERS**

---

## 🔹 What is a Trigger?

A Trigger is a named T-SQL block that is executed **automatically by SQL Server** when DML operations occur.

### DML Operations

* INSERT
* UPDATE
* DELETE

### Main Uses

* Control DML operations
* Enforce complex rules and validations
* Audit database activities

---

## 🔹 Types of Triggers

### 1. AFTER / FOR Trigger

Executes **after** the DML operation.

```text
DML
 ↓
DML Executes
 ↓
TRIGGER Executes
```

### 2. INSTEAD OF Trigger

Executes **instead of** the DML operation.

```text
DML
 ↓
TRIGGER Executes
 ↓
DML Replaced / Controlled
```

---

## 🔹 Magic Tables

SQL Server provides two special tables during trigger execution:

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

**Important:** Magic tables exist only during trigger execution.

---

## 🔹 Useful Trigger Functions

### UPDATE()

Checks whether a particular column was included in an UPDATE statement.

```sql
IF UPDATE(empno)
```

### ROLLBACK

Cancels the current transaction/DML operation.

```sql
ROLLBACK;
```

### RAISERROR

Generates an error message.

```sql
RAISERROR('Operation not allowed', 16, 1);
```

---

## 🔹 Trigger Examples

### Prevent DML on Sunday

```sql
IF DATENAME(DW, GETDATE()) = 'Sunday'
BEGIN
    ROLLBACK;
    RAISERROR('Sunday not allowed', 16, 1);
END;
```

### Prevent Salary Decrement

```text
DELETED.SAL   → OLD SALARY
INSERTED.SAL  → NEW SALARY

NEW SALARY < OLD SALARY
        ↓
     ROLLBACK
```

### Employee Resignation

```text
DELETE EMPLOYEE
      ↓
DELETED
      ↓
EMP_RESIGN
```

### Auditing

```text
INSERT / UPDATE / DELETE
          ↓
       TRIGGER
          ↓
   INSERTED + DELETED
          ↓
       EMP_AUDIT
```

---

## 🔹 Trigger Metadata

```sql
SELECT
    TR.NAME AS TRGNAME,
    TB.NAME AS TABNAME
FROM SYS.TRIGGERS AS TR
INNER JOIN SYS.TABLES AS TB
ON TR.PARENT_ID = TB.OBJECT_ID;
```

---

## 🔹 Drop Trigger

```sql
DROP TRIGGER T1;
```

---

## 🧠 Quick Memory

```text
TRIGGER → AUTOMATIC EXECUTION

AFTER → DML → TRIGGER

INSTEAD OF → TRIGGER → DML

INSERTED → NEW DATA

DELETED → OLD DATA

UPDATE → OLD + NEW DATA

UPDATE() → CHECK COLUMN UPDATE

ROLLBACK → REJECT OPERATION

RAISERROR → SHOW ERROR

AUDITING → TRACK DML ACTIVITIES
```

---

## 🎯 Day 48 Flow

```text
T-SQL
 ↓
TRIGGERS
 ↓
AFTER / FOR
 ↓
INSTEAD OF
 ↓
INSERTED / DELETED
 ↓
VALIDATION
 ↓
AUDITING
```

**✅ DAY 48 COMPLETE! 🚀**
