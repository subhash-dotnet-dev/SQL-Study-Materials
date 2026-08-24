# SQL Learning Journey — Day 32
## Interview Questions & Answers

---

## 1. What is a CTE?

**Answer:**

CTE stands for **Common Table Expression**.

A CTE is a temporary named result set that can be referenced within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement.

### Syntax:

```sql
WITH CTE_Name AS
(
    SELECT ...
)
SELECT *
FROM CTE_Name;
