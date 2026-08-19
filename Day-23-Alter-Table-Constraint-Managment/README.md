<div align="center">

# 🗄️ Day 23 — ALTER TABLE & Constraint Management

### WITH NOCHECK • ADD CONSTRAINT • ALTER COLUMN • DROP CONSTRAINT

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 23 focuses on **ALTER TABLE and Constraint Management** in SQL Server.

The session covers how to add, modify, and remove constraints from existing tables using `ALTER TABLE`.

It also focuses on `WITH NOCHECK`, changing nullable columns to `NOT NULL`, and understanding **Primary Key / Foreign Key dependencies** that affect `DROP TABLE` and `TRUNCATE TABLE`.

---

## 🎯 Learning Objectives

By the end of Day 23, the focus was on understanding:

- `WITH NOCHECK`
- Adding `CHECK` constraint
- Adding `FOREIGN KEY`
- Adding `UNIQUE` constraint
- `ALTER COLUMN`
- Changing `NULL` to `NOT NULL`
- `DROP CONSTRAINT`
- Constraint dependencies
- Primary Key / Foreign Key dependency
- `DROP TABLE` dependency
- `TRUNCATE TABLE` dependency
- Existing data vs new data validation

---

# 🛠️ ALTER TABLE

`ALTER TABLE` is used to modify an existing table structure.

It can be used to:

- Add constraints
- Modify column definitions
- Drop constraints

### Basic Syntax

```sql
ALTER TABLE table_name
operation;
