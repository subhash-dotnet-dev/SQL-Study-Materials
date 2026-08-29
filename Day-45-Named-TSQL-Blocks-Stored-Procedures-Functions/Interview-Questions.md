# SQL Server — Day 45 Interview Questions

## Topic: Stored Procedures & User-Defined Functions

---

## 1. What is a Stored Procedure?

**Answer:**

A Stored Procedure is a named T-SQL block that performs one or more database operations such as INSERT, UPDATE, DELETE or SELECT.

---

## 2. What are the advantages of Stored Procedures?

**Answer:**

1. Modular Programming
2. Reusability
3. Can be invoked from front-end applications
4. Improves performance
5. Centralizes database logic

---

## 3. What is the syntax of a Stored Procedure?

```sql
CREATE OR ALTER PROCEDURE procedure_name
    parameters
AS
BEGIN
    statements
END;
