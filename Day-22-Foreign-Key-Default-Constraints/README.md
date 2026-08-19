<div align="center">

# 🗄️ Day 22 — SQL Server Foreign Key, DEFAULT & Relationships

### FOREIGN KEY • DEFAULT • RELATIONSHIPS • COMPOSITE KEY • ALTER TABLE

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 22 focuses on **Foreign Key, DEFAULT, Relationships, Composite Keys, Table-Level Constraints, and ALTER TABLE** in SQL Server.

The session covers how to establish relationships between tables using Foreign Keys, implement different relationship types, create Many-to-Many relationships using junction tables, and modify constraints on existing tables.

---

## 🎯 Learning Objectives

By the end of Day 22, the focus was on understanding:

- Foreign Key
- Parent / Child relationship
- DEFAULT constraint
- One-to-One relationship
- One-to-Many relationship
- Many-to-One relationship
- Many-to-Many relationship
- Table-Level Constraints
- Composite Primary Key
- Composite Foreign Key
- ALTER TABLE
- Adding constraints
- Dropping constraints
- WITH NOCHECK
- Constraint dependencies

---

# 🔗 FOREIGN KEY

A **Foreign Key** is used to establish a relationship between two tables.

It references a `PRIMARY KEY` or `UNIQUE` key in another table.

The table containing the referenced key is called the **Parent Table**.

The table containing the Foreign Key is called the **Child Table**.

### Syntax

```sql
FOREIGN KEY (column_name)
REFERENCES parent_table(parent_column)
