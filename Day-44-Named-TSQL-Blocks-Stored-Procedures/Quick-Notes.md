# SQL Server — Day 44 Quick Notes

## 📌 Topic: Named T-SQL Blocks

Named T-SQL Blocks are T-SQL programs created with a name and stored in the database.

### Main Named T-SQL Blocks

1. Stored Procedures
2. Functions
3. Triggers

### Sub-programs

- Stored Procedures
- Functions

---

## 🚀 Advantages of Procedures & Functions

### 1. Modular Programming
Large T-SQL programs can be divided into smaller modules.

### 2. Reusability
Once created and stored, procedures/functions can be called multiple times.

### 3. Front-End Integration
Stored procedures and functions can be invoked from applications such as C#/.NET.

### 4. Performance
Stored programs are compiled and stored in the database, reducing repeated compilation work.

---

# 🧑‍💻 Stored Procedures

A Stored Procedure is a named T-SQL block that can accept parameters, perform database operations and may or may not return a value.

### Common Operations

- INSERT
- UPDATE
- DELETE
- SELECT

---

## 📌 Syntax

```sql
CREATE OR ALTER PROCEDURE procedure_name
parameters
AS
statements;
