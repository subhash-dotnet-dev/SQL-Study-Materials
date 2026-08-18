# 🎯 Day 19 — SQL Server CASE Statement & GROUP BY
## Interview Questions & Answers

---

## 📌 CASE Statement

### 1. What is a CASE statement in SQL Server?

A `CASE` statement is used to implement **IF-THEN-ELSE logic** in SQL Server.

It returns a value based on one or more conditions.

---

### 2. What are the types of CASE statements?

There are two types:

1. **Simple CASE**
2. **Searched CASE**

---

### 3. What is a Simple CASE statement?

A Simple CASE is used when conditions are based on **equality (`=`)**.

### Syntax

```sql
CASE column
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ELSE result
END
