# 🎯 Day 20 — SQL Server ROLLUP, CUBE & GROUPING_ID Interview Questions

> SQL Server Learning Journey — Day 20
> Topics: ROLLUP(), CUBE(), GROUPING_ID(), Subtotals, Grand Total, Range Grouping & Duplicate Detection

---

## 📌 Basic Questions

### 1. What is ROLLUP() in SQL Server?

`ROLLUP()` is used with `GROUP BY` to generate hierarchical subtotals and a grand total.

### Example:

```sql
SELECT DEPTNO, JOB, SUM(SAL) AS TOTSAL
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);
