<div align="center">

# 🗄️ Day 12 — SQL Server DML & DDL Commands

### Understanding INSERT, UPDATE, DELETE, ALTER, DROP, TRUNCATE & SP_RENAME

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts**  •  **🧠 Interview Preparation**  •  **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 12 focuses on understanding **DML (Data Manipulation Language)** and **DDL (Data Definition Language)** commands in SQL Server.

The session covers modifying table data using `UPDATE` and `DELETE`, modifying table structure using `ALTER`, removing tables using `DROP`, removing all rows using `TRUNCATE`, and renaming tables or columns using `SP_RENAME`.

---

## 🎯 Learning Objectives

By the end of Day 12, the focus was on understanding:

* DML Commands
* INSERT
* UPDATE
* DELETE
* MERGE
* DDL Commands
* CREATE
* ALTER
* DROP
* TRUNCATE
* Updating Single and Multiple Columns
* Updating Specific Rows
* Deleting Specific Rows
* Adding Columns
* Dropping Columns
* Modifying Column Datatype and Size
* DELETE vs TRUNCATE
* SP_RENAME
* Alias vs Rename

---

## 📚 Commands Covered

|  # | Category | Commands  | Purpose                 |
| -: | -------- | --------- | ----------------------- |
| 01 | DML      | INSERT    | Add data                |
| 02 | DML      | UPDATE    | Modify data             |
| 03 | DML      | DELETE    | Delete rows             |
| 04 | DML      | MERGE     | Synchronize data        |
| 05 | DDL      | CREATE    | Create database objects |
| 06 | DDL      | ALTER     | Modify table structure  |
| 07 | DDL      | DROP      | Remove object           |
| 08 | DDL      | TRUNCATE  | Remove all rows         |
| 09 | Utility  | SP_RENAME | Rename table/column     |

---

## 🧠 Key Concepts

### DML — Data Manipulation Language

DML commands are used to work with **table data (rows)**.

Main DML commands:

* `INSERT`
* `UPDATE`
* `DELETE`
* `MERGE`

A table can be understood as:

```text
Table = Structure + Data
         ↓         ↓
      Columns     Rows
        DDL        DML
```

---

## 🔹 UPDATE Command

`UPDATE` is used to modify existing data in a table.

We can update:

* All rows
* Specific rows
* Single column
* Multiple columns

### Syntax

```sql
UPDATE tablename
SET colname = value,
    colname = value
[WHERE condition];
```

### Update All Employees' Commission

```sql
UPDATE EMP
SET COMM = 500;
```

### Update NULL Commission

```sql
UPDATE EMP
SET COMM = 500
WHERE COMM IS NULL;
```

### Assign NULL

```sql
UPDATE EMP
SET COMM = NULL
WHERE COMM IS NOT NULL;
```

📌 Important:

`=` is used for **NULL assignment**.

`IS NULL` / `IS NOT NULL` is used for **NULL comparison**.

### Update Multiple Columns

```sql
UPDATE EMP
SET SAL = 1000,
    COMM = 500
WHERE EMPNO = 7369;
```

### Increase Salary by 10% and Commission by 20%

```sql
UPDATE EMP
SET SAL = SAL + (SAL * 0.10),
    COMM = COMM + (COMM * 0.20)
WHERE JOB = 'SALESMAN'
AND HIREDATE LIKE '1981%';
```

### Transfer Employees from Department 10 to 20

```sql
UPDATE EMP
SET DEPTNO = 20
WHERE DEPTNO = 10;
```

---

## 🔹 DELETE Command

`DELETE` is used to remove rows from a table.

We can delete:

* All rows
* Specific rows

### Syntax

```sql
DELETE FROM tablename
[WHERE condition];
```

### Delete All Rows

```sql
DELETE FROM EMP;
```

### Delete Employees Joined in 1980

```sql
DELETE FROM EMP
WHERE HIREDATE LIKE '1980%';
```

### Delete Specific Employees

```sql
DELETE FROM EMP
WHERE EMPNO IN (7369, 7499);
```

### Delete Employees Joined in Q2 of 1981

```sql
DELETE FROM EMP
WHERE HIREDATE BETWEEN '1981-04-01' AND '1981-06-30';
```

---

## 🔹 DDL — Data Definition Language

DDL commands work mainly with **table structure**.

Main DDL commands:

* `CREATE`
* `ALTER`
* `DROP`
* `TRUNCATE`

---

## 🔹 ALTER Command

`ALTER` is used to modify the structure of an existing table.

Using `ALTER`, we can:

1. Add columns
2. Drop columns
3. Modify columns

### Add Column

```sql
ALTER TABLE EMP
ADD GENDER CHAR(1);
```

After adding a new column, existing rows receive `NULL` unless a value is provided.

Example:

```sql
UPDATE EMP
SET GENDER = 'M'
WHERE EMPNO = 7369;
```

### Drop Column

```sql
ALTER TABLE EMP
DROP COLUMN GENDER;
```

### Modify Column Datatype

```sql
ALTER TABLE EMP
ALTER COLUMN EMPNO INT;
```

### Modify Column Size

```sql
ALTER TABLE EMP
ALTER COLUMN ENAME VARCHAR(20);
```

📌 The new size must be able to accommodate the existing data.

---

## 🔹 DROP Command

`DROP` removes the table completely, including its structure and data.

### Syntax

```sql
DROP TABLE tabname;
```

Example:

```sql
DROP TABLE EMP;
```

---

## 🔹 TRUNCATE Command

`TRUNCATE` removes **all rows** from a table while keeping the table structure.

### Syntax

```sql
TRUNCATE TABLE tabname;
```

Example:

```sql
TRUNCATE TABLE STUDENT;
```

It is generally faster than deleting rows individually and deallocates the data pages used by the table.

---

## ⚖️ DELETE vs TRUNCATE

| DELETE                                 | TRUNCATE                               |
| -------------------------------------- | -------------------------------------- |
| DML                                    | DDL                                    |
| Can delete specific rows               | Removes all rows                       |
| `WHERE` can be used                    | `WHERE` cannot be used                 |
| Deletes rows individually              | Deallocates data pages                 |
| Generally slower for removing all rows | Generally faster for removing all rows |
| Does not reset identity in normal use  | Resets identity in SQL Server          |

---

## 🔹 SP_RENAME

`SP_RENAME` is a SQL Server stored procedure used to rename tables and columns.

### Rename Table

```sql
EXEC SP_RENAME 'EMP', 'EMPLOYEES';
```

### Rename Column

```sql
EXEC SP_RENAME 'EMPLOYEES.COMM', 'BONUS', 'COLUMN';
```

---

## 🔄 Alias vs Rename

| Alias                        | Rename                           |
| ---------------------------- | -------------------------------- |
| Temporary / query-level name | Permanent object name change     |
| Changes output heading       | Changes table/column name        |
| Used with SELECT             | Changes database object metadata |

Example of Alias:

```sql
SELECT ENAME AS EMPLOYEE_NAME
FROM EMP;
```

Example of Rename:

```sql
EXEC SP_RENAME 'EMP.COMM', 'BONUS', 'COLUMN';
```

---

## 📝 Quick Summary

| Command     | Category | Purpose                   |
| ----------- | -------- | ------------------------- |
| `INSERT`    | DML      | Insert rows               |
| `UPDATE`    | DML      | Modify rows               |
| `DELETE`    | DML      | Delete rows               |
| `MERGE`     | DML      | Synchronize data          |
| `CREATE`    | DDL      | Create structure          |
| `ALTER`     | DDL      | Modify structure          |
| `DROP`      | DDL      | Remove structure and data |
| `TRUNCATE`  | DDL      | Remove all rows           |
| `SP_RENAME` | Utility  | Rename object             |

---

## 🎯 Key Takeaway

Day 12 helped me understand the difference between **data manipulation and table structure modification** in SQL Server.

`UPDATE` and `DELETE` work with table data, while `ALTER`, `DROP`, and `TRUNCATE` are used for table structure or removing table data in different ways.

Understanding **DELETE vs TRUNCATE**, `UPDATE` with conditions, and `ALTER` operations is important for writing safe and practical SQL Server queries.

---

## 🚀 Learning Progress

| Day | Topic                                      |
| --: | ------------------------------------------ |
|  01 | SQL Fundamentals                           |
|  02 | SQL Server Fundamentals                    |
|  03 | SQL Sublanguages                           |
|  04 | SQL Server Database Basics                 |
|  05 | SQL Server Data Types                      |
|  06 | SQL Server Data Types — Part 2             |
|  07 | Creating Tables & Inserting Data           |
|  08 | SQL Server Operators & Filtering           |
|  09 | SQL Server IN & BETWEEN Operators          |
|  10 | SQL Server LIKE & IS Operators             |
|  11 | SQL Server ALIAS, ORDER BY, DISTINCT & TOP |
|  12 | SQL Server DML & DDL Commands              |

---

<div align="center">

### 🚀 Learn → Practice → Document → Improve

</div>
