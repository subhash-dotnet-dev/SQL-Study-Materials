# SQL Server — Day 46 Interview Questions

## Topic: Scalar-Valued Functions, Table-Valued Functions & Banking Transactions

---

## 1. What is a Scalar-Valued Function (SVF)?

**Answer:**

A Scalar-Valued Function returns a single value such as `INT`, `MONEY`, `VARCHAR`, etc.

---

## 2. What is a Table-Valued Function (TVF)?

**Answer:**

A Table-Valued Function returns multiple rows and columns in the form of a table.

---

## 3. What is the return type of a TVF?

**Answer:**

The return type of a TVF is `TABLE`.

---

## 4. How do you execute a Scalar-Valued Function?

**Answer:**

A Scalar-Valued Function can be executed using `SELECT`.

```sql
SELECT dbo.GET_BALANCE(102);
