# 🧠 Day 23 — SQL Server Interview Questions
## ALTER TABLE & Constraint Management

---

## 📌 Basic Questions

### Q1. What is `WITH NOCHECK`?

**Answer:**

`WITH NOCHECK` is used when adding a constraint without validating the existing data in the table.

```sql
ALTER TABLE EMP
WITH NOCHECK
ADD CHECK(SAL >= 3000);
