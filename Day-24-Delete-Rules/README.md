<div align="center">

# 🗄️ Day 24 — SQL Server DELETE Rules

### ON DELETE NO ACTION • CASCADE • SET NULL • SET DEFAULT

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 24 focuses on **DELETE Rules** used with Foreign Key relationships in SQL Server.

The session covers how child rows are affected when a related parent row is deleted.

The four DELETE rules studied are:

- `ON DELETE NO ACTION`
- `ON DELETE CASCADE`
- `ON DELETE SET NULL`
- `ON DELETE SET DEFAULT`

---

## 🎯 Learning Objectives

By the end of Day 24, the focus was on understanding:

- DELETE rules
- Foreign Key relationships
- Parent and Child tables
- `ON DELETE NO ACTION`
- `ON DELETE CASCADE`
- `ON DELETE SET NULL`
- `ON DELETE SET DEFAULT`
- Parent row deletion
- Child row behavior
- Real-world DELETE scenarios
- Choosing the appropriate DELETE rule

---

# 🔗 DELETE RULES

A DELETE rule specifies **how child rows are affected when a related parent row is deleted**.

These rules are declared with a **Foreign Key**.

### Available DELETE Rules

| Rule | Child Row Behavior |
|---|---|
| `NO ACTION` | Prevents parent deletion if child rows exist |
| `CASCADE` | Deletes related child rows |
| `SET NULL` | Sets Foreign Key value to `NULL` |
| `SET DEFAULT` | Sets Foreign Key value to its default |

---

# 1️⃣ ON DELETE NO ACTION

`ON DELETE NO ACTION` is the **default behavior**.

The parent row cannot be deleted if associated child rows exist.

### Example

```sql
CREATE TABLE DEPT99
(
    DNO INT PRIMARY KEY,
    DNAME VARCHAR(10) NOT NULL
);

INSERT INTO DEPT99
VALUES
(10, 'HR'),
(20, 'IT');

CREATE TABLE EMP99
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(10) NOT NULL,
    DNO INT REFERENCES DEPT99(DNO)
);

INSERT INTO EMP99
VALUES
(1, 'A', 10),
(2, 'B', 10);
