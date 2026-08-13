<div align="center">

# 🗄️ Day 07 — Creating Tables & Inserting Data

### Creating Tables, Understanding Structure & Inserting Data in SQL Server

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 07 focuses on **creating tables in SQL Server**, understanding table structure and metadata, checking table structure using `SP_HELP`, and inserting single or multiple rows into a table.

The session also covers **NULL values** and different ways to insert NULL data.

---

## 🎯 Learning Objectives

By the end of Day 07, the focus was on understanding:

- CREATE TABLE
- Table Structure / Metadata
- Table Naming Rules
- SP_HELP
- INSERT Command
- Single Row Insert
- Multiple Rows Insert
- NULL Values

---

## 📚 Concepts Covered

| # | Concept | Purpose |
|---:|---|---|
| 01 | CREATE TABLE | Creates table structure |
| 02 | Table Structure | Columns, data types and size |
| 03 | Naming Rules | Rules for table names |
| 04 | SP_HELP | Shows table structure |
| 05 | INSERT | Inserts data into table |
| 06 | Single Row | Inserts one row |
| 07 | Multiple Rows | Inserts multiple rows |
| 08 | NULL | Represents blank/empty value |

---

## 🧠 Key Takeaways

### CREATE TABLE

`CREATE TABLE` is used to create a **table structure / metadata**.

Example:

```sql
CREATE TABLE EMP
(
    EMPID TINYINT,
    ENAME VARCHAR(10),
    JOB VARCHAR(10),
    SAL SMALLMONEY,
    HIREDATE DATE,
    DEPT VARCHAR(10)
)
