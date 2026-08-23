# SQL Server — Day 31 Quick Notes
## Topic: DERIVED TABLES & ROW_NUMBER()

---

## 1. DERIVED TABLE

A sub-query written inside the `FROM` clause is called a **Derived Table**.

### Syntax

```sql
SELECT columns
FROM
(
    SELECT statement
) AS E
WHERE condition;
