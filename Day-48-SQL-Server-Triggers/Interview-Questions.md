# SQL Server — Day 48 Interview Questions

## Topic: Triggers

---

## 1. What is a Trigger?

**Answer:**

A Trigger is a named T-SQL block that is executed automatically by SQL Server when specified DML operations occur on a table.

---

## 2. Which DML operations can fire a Trigger?

**Answer:**

* INSERT
* UPDATE
* DELETE

---

## 3. What are the main uses of Triggers?

**Answer:**

1. Control DML operations
2. Enforce complex rules and validations
3. Audit database activities
4. Protect data from invalid changes

---

## 4. What are the types of DML Triggers?

**Answer:**

1. AFTER / FOR Trigger
2. INSTEAD OF Trigger

---

## 5. What is an AFTER Trigger?

**Answer:**

An AFTER Trigger executes after the associated DML operation has been executed.

```text
DML
 ↓
DML Executes
 ↓
TRIGGER Executes
```

---

## 6. What is an INSTEAD OF Trigger?

**Answer:**

An INSTEAD OF Trigger executes instead of the associated DML operation and can decide whether the DML should be performed.

```text
DML
 ↓
TRIGGER Executes
 ↓
DML Replaced / Controlled
```

---

## 7. What are Magic Tables?

**Answer:**

`INSERTED` and `DELETED` are special tables available during trigger execution. They contain the data affected by the DML operation.

---

## 8. What is the purpose of INSERTED?

**Answer:**

`INSERTED` contains the new rows or new values affected by INSERT and UPDATE operations.

---

## 9. What is the purpose of DELETED?

**Answer:**

`DELETED` contains the old rows or old values affected by DELETE and UPDATE operations.

---

## 10. What happens to Magic Tables during UPDATE?

**Answer:**

During UPDATE:

```text
DELETED  → OLD VALUES
INSERTED → NEW VALUES
```

---

## 11. How can a Trigger prevent an operation?

**Answer:**

A Trigger can use `ROLLBACK` to cancel the operation and `RAISERROR` to display an error message.

```sql
ROLLBACK;

RAISERROR('Operation not allowed', 16, 1);
```

---

## 12. What is UPDATE() in a Trigger?

**Answer:**

`UPDATE()` checks whether a particular column was included in an UPDATE statement.

```sql
IF UPDATE(empno)
BEGIN
    ROLLBACK;
END;
```

---

## 13. How can you prevent salary decrement using a Trigger?

**Answer:**

Compare the old salary from `DELETED` with the new salary from `INSERTED`.

```sql
IF (SELECT SAL FROM INSERTED)
   < (SELECT SAL FROM DELETED)
BEGIN
    ROLLBACK;
    RAISERROR('Salary cannot be decremented',16,1);
END;
```

---

## 14. How can Triggers be used for auditing?

**Answer:**

A Trigger can capture INSERT, UPDATE and DELETE activities and store the old/new values in an audit table.

```text
INSERT / UPDATE / DELETE
          ↓
       TRIGGER
          ↓
   INSERTED + DELETED
          ↓
       AUDIT TABLE
```

---

## 15. How can you track an employee resignation?

**Answer:**

Create an AFTER DELETE Trigger and insert the deleted employee details from the `DELETED` table into an `EMP_RESIGN` table.

---

## 16. How do you list user-created Triggers?

**Answer:**

```sql
SELECT
    TR.NAME AS TRGNAME,
    TB.NAME AS TABNAME
FROM SYS.TRIGGERS AS TR
INNER JOIN SYS.TABLES AS TB
ON TR.PARENT_ID = TB.OBJECT_ID;
```

---

## 17. How do you delete a Trigger?

**Answer:**

```sql
DROP TRIGGER T1;
```

---

## 18. Difference between AFTER and INSTEAD OF Trigger?

**Answer:**

| AFTER Trigger                | INSTEAD OF Trigger          |
| ---------------------------- | --------------------------- |
| Executes after DML           | Executes instead of DML     |
| DML is executed first        | Trigger gets control first  |
| Used for validation/auditing | Used to replace/control DML |

---

## 19. Difference between INSERTED and DELETED?

**Answer:**

| INSERTED          | DELETED           |
| ----------------- | ----------------- |
| Contains new data | Contains old data |
| INSERT            | DELETE            |
| UPDATE new values | UPDATE old values |

---

## 20. Interview Quick Memory

```text
TRIGGER       → AUTOMATIC EXECUTION
AFTER         → DML → TRIGGER
INSTEAD OF    → TRIGGER → DML
INSERTED      → NEW DATA
DELETED       → OLD DATA
UPDATE        → OLD + NEW DATA
UPDATE()      → CHECK COLUMN UPDATE
ROLLBACK      → CANCEL OPERATION
RAISERROR     → ERROR MESSAGE
AUDITING      → TRACK DML ACTIVITIES
```

---

## 🎯 Interview Tip

Remember this simple rule:

**AFTER = DML happens first**

**INSTEAD OF = Trigger gets control first**

**INSERTED = New Data**

**DELETED = Old Data**
