# SQL Server — Day 41 Interview Questions

## Topic: Cursors & STRING_AGG()

---

## 1. What is a Cursor in SQL Server?

**Answer:**

A **Cursor** is a database object used to process multiple rows **row-by-row** in a T-SQL program.

It allows us to fetch one record at a time from the result set and process it inside a T-SQL program.

**Example:**

```sql
DECLARE C1 CURSOR FOR
SELECT ENAME, SAL
FROM EMP;
