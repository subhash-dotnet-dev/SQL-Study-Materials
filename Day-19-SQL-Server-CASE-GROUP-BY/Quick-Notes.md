# 📝 Day 19 — Quick Notes

## CASE Statement

`CASE` statement is used to implement **IF-THEN-ELSE logic** in SQL Server.

### Types of CASE

1. Simple CASE
2. Searched CASE

---

# 1️⃣ Simple CASE

Used when conditions are based on **equality (`=`)**.

### Syntax

```sql
CASE column
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ELSE result
END
