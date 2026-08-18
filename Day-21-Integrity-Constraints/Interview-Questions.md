<div align="center">

# 🧠 Day 21 — SQL Server Integrity Constraints

### NOT NULL • UNIQUE • PRIMARY KEY • CHECK • Candidate Key • Alternate Key

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **🎯 Key Differences**

</div>

---

## 📌 Interview Questions

### 1. What are Integrity Constraints in SQL Server?

Integrity constraints are rules used to maintain **data integrity, data quality, and data consistency** in a database.

They prevent users from inserting invalid or inconsistent data.

Examples:

- NOT NULL
- UNIQUE
- PRIMARY KEY
- CHECK
- FOREIGN KEY
- DEFAULT

> **Day 21 Focus:** NOT NULL, UNIQUE, PRIMARY KEY, CHECK, Candidate Key, Alternate/Secondary Key.

---

### 2. What is a NOT NULL constraint?

`NOT NULL` prevents a column from storing `NULL` values.

```sql
CREATE TABLE EMP11
(
    EMPNO INT,
    ENAME VARCHAR(10) NOT NULL
);
