# Day 24 — SQL Server DELETE Rules
## Interview Questions & Answers

---

## 📌 1. What are DELETE Rules?

**Answer:**

DELETE Rules define how child table records are affected when a related parent table record is deleted.

DELETE Rules are specified with a **Foreign Key**.

Main DELETE Rules:

1. `ON DELETE NO ACTION`
2. `ON DELETE CASCADE`
3. `ON DELETE SET NULL`
4. `ON DELETE SET DEFAULT`

---

## 📌 2. What is ON DELETE NO ACTION?

**Answer:**

`ON DELETE NO ACTION` is the **default behavior** of a Foreign Key.

If a parent record has related child records, SQL Server does not allow the parent record to be deleted.

### Example:

```sql
CREATE TABLE DEPT99
(
    DNO INT PRIMARY KEY,
    DNAME VARCHAR(10) NOT NULL
);

CREATE TABLE EMP99
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(10) NOT NULL,
    DNO INT REFERENCES DEPT99(DNO)
        ON DELETE NO ACTION
);
