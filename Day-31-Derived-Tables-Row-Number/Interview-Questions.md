# SQL Server — Day 31 Interview Questions
## Topic: Derived Tables & ROW_NUMBER()

---

## 1. What is a Derived Table?

**Answer:**

A Derived Table is a sub-query written inside the `FROM` clause.

The output of the sub-query acts like a temporary table for the outer query.

```sql
SELECT *
FROM
(
    SELECT empno, ename, sal
    FROM emp
) AS E;
