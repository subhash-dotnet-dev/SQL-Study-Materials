# 🎯 Day 18 — SQL Server Aggregate Functions
## Interview Questions & Answers

Aggregate functions process multiple rows and return a single summarized value. They are commonly used for reporting, analysis, and business calculations.

---

# 1. Basic Interview Questions

### Q1. What is an Aggregate Function?

**Answer:**
An aggregate function processes multiple rows and returns a single result.

**Examples:**
- `MAX()`
- `MIN()`
- `SUM()`
- `AVG()`
- `COUNT()`
- `COUNT(*)`

---

### Q2. What are the main Aggregate Functions in SQL Server?

**Answer:**

| Function | Purpose |
|---|---|
| `MAX()` | Returns maximum value |
| `MIN()` | Returns minimum value |
| `SUM()` | Returns total |
| `AVG()` | Returns average |
| `COUNT()` | Counts non-NULL values |
| `COUNT(*)` | Counts all rows |

---

### Q3. What does MAX() do?

**Answer:**
`MAX()` returns the highest value from a column.

**Syntax:**

```sql
MAX(column_name)
