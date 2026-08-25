<div align="center">

# 🗄️ Day 36 — SQL Server Indexes

### INDEXES • SIMPLE • COMPOSITE • UNIQUE • CLUSTERED • NON-CLUSTERED

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 36 focuses on **Indexes in SQL Server** and how indexes improve the performance of data retrieval.

The main concepts covered are:

- `INDEXES`
- Index Key
- Non-Clustered Index
- Simple Index
- Composite Index
- Unique Index
- Clustered Index
- B-Tree
- Index Scan
- Table Scan
- Leading Column
- Primary Key & Unique Constraint
- Index Performance
- Advantages & Disadvantages of Indexes

---

## 🎯 Learning Objectives

By the end of Day 36, the focus was on understanding:

- What an Index is
- Why Indexes are used
- Index Key
- Simple Non-Clustered Index
- Composite Index
- Leading Column
- Unique Index
- Clustered Index
- Non-Clustered Index
- B-Tree structure
- Index Scan
- Table Scan
- Enforcing uniqueness using indexes and constraints
- When indexes should be created
- Advantages and disadvantages of indexes

---

# 📚 INDEXES

An **Index** is a database object created to improve the performance of data accessing.

Indexes help SQL Server locate required rows faster.

Indexes are similar to the index of a textbook.

```text
TEXTBOOK

Index
  ↓
Find Topic Faster


DATABASE

Index
  ↓
Find Data Faster
