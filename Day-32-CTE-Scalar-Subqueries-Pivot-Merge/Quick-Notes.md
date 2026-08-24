# SQL Learning Journey — Day 32
## Quick Notes

---

# 1. CTE — Common Table Expression

**CTE** stands for **Common Table Expression**.

A CTE gives a name to a query result and allows us to use that named result in another query.

### Syntax

```sql
WITH CTE_NAME AS
(
    SELECT ...
)
SELECT / INSERT / UPDATE / DELETE
FROM CTE_NAME;
