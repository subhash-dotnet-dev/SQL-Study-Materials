# SQL Server — Day 43 Interview Questions

## Topic: Error Handling / Exception Handling

---

## 1. What is Error Handling in SQL Server?

**Answer:**

Error Handling is the process of detecting and handling errors that occur during T-SQL program execution.

SQL Server mainly deals with:

1. Syntax Errors
2. Logical Errors
3. Runtime Errors / Exceptions

---

## 2. What are the different types of errors?

**Answer:**

### 1. Syntax Error
Occurs when SQL syntax is incorrect.

### 2. Logical Error
Occurs when the program logic is incorrect.

### 3. Runtime Error / Exception
Occurs while the program is executing.

Example:

```sql
DECLARE @x TINYINT;

SET @x = 1000;

PRINT @x;
