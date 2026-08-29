# SQL Server — Day 45 Quick Notes

## 📌 Topic: Named T-SQL Blocks

Named T-SQL Blocks include:

1. Stored Procedures
2. Functions
3. Triggers

---

## 🔹 Sub-Programs

1. Stored Procedures
2. Functions

---

## ✅ Advantages

### 1. Modular Programming
Big T-SQL programs can be divided into small modules.

### 2. Reusability
Named programs can be called multiple times.

### 3. Front-End Integration
Stored Procedures and Functions can be invoked from applications such as C# / ASP.NET.

### 4. Performance
Stored Procedures and Functions can reuse compiled execution plans, reducing repeated compilation work in many scenarios.

---

# 🛠️ Stored Procedures

A Stored Procedure is a named T-SQL block that performs one or more database operations.

Examples:

- INSERT
- UPDATE
- DELETE
- SELECT

### Syntax

```sql
CREATE OR ALTER PROCEDURE procedure_name
    parameters
AS
BEGIN
    statements
END;
