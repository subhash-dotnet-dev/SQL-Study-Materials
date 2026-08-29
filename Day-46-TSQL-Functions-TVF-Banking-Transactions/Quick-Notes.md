# SQL Server — Day 46 Quick Notes

## Topic: Functions, Procedures & Banking Transactions

---

## 1. Scalar-Valued Function (SVF)

→ SVF returns a single value.

→ Return type must be a scalar data type such as:
INT, MONEY, VARCHAR, etc.

### Syntax

```sql
CREATE OR ALTER FUNCTION function_name(parameters)
RETURNS data_type
AS
BEGIN
    statements
    RETURN expression
END;
