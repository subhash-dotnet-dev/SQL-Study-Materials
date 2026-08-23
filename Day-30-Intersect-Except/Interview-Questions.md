# SQL Server — Day 30 Interview Questions
## Topic: INTERSECT & EXCEPT

---

## 1. What is INTERSECT?

**Answer:**

INTERSECT returns the common values/records from the result of two SELECT statements.

```sql
SELECT job
FROM emp
WHERE deptno = 20

INTERSECT

SELECT job
FROM emp
WHERE deptno = 30;
