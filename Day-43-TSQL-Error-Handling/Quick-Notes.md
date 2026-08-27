# SQL Server — Day 43 Quick Notes

## Topic: Error Handling / Exception Handling

---

## 1. Types of Errors

### Syntax Error
Occurs when SQL syntax is incorrect.

### Logical Error
Occurs when the program logic is incorrect.

### Runtime Error / Exception
Occurs during program execution.

Example:

```sql
DECLARE @x TINYINT;

SET @x = 1000;

PRINT @x;
