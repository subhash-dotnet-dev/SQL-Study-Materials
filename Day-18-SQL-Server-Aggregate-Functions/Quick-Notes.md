# 📝 Day 18 — SQL Server Aggregate Functions — Quick Notes

## 🔹 What are Aggregate Functions?

Aggregate functions process **multiple rows** and return **one summarized value**.

### Main Aggregate Functions

| Function | Purpose |
|---|---|
| `MAX()` | Returns maximum value |
| `MIN()` | Returns minimum value |
| `SUM()` | Returns total |
| `AVG()` | Returns average |
| `COUNT()` | Counts non-NULL values |
| `COUNT(*)` | Counts all rows |

---

## 1️⃣ MAX()

Returns the **maximum value**.

```sql
SELECT MAX(SAL)
FROM EMP;
