<div align="center">

# 🗄️ Day 41 — SQL Server: CURSORS & STRING_AGG()

### CURSORS • ROW-BY-ROW PROCESSING • @@FETCH_STATUS • STRING_AGG()

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 41 focuses on **Cursors and STRING_AGG() in SQL Server**.

A **Cursor** is used in T-SQL programs to process query results **row-by-row**. It provides a way to fetch and process individual records from a result set.

`STRING_AGG()` is a built-in aggregate function used to **concatenate values from multiple rows into a single string**.

### Main Topics

- Cursors
- Cursor Lifecycle
- DECLARE CURSOR
- OPEN CURSOR
- FETCH NEXT
- @@FETCH_STATUS
- CLOSE CURSOR
- DEALLOCATE CURSOR
- Row-by-Row Processing
- STRING_AGG()
- Practical Cursor Programs
- Student Result Processing

---

## 🎯 Learning Objectives

By the end of Day 41, the focus was on understanding:

- What is a Cursor?
- Why are Cursors used?
- How to declare a Cursor
- How to open a Cursor
- How to fetch records
- How `@@FETCH_STATUS` works
- How to close a Cursor
- How to deallocate a Cursor
- How to process records row-by-row
- How to calculate values using Cursors
- How to use `STRING_AGG()`
- Difference between Cursor processing and set-based processing

---

# 🧑‍💻 CURSORS

A **Cursor** is used to process multiple rows in a T-SQL program.

It allows us to access records **one row at a time** and perform processing on each row.

### Cursor Flow

```text
SELECT QUERY
     ↓
DECLARE CURSOR
     ↓
OPEN CURSOR
     ↓
FETCH NEXT
     ↓
PROCESS ROW
     ↓
CHECK @@FETCH_STATUS
     ↓
FETCH NEXT
     ↓
CLOSE CURSOR
     ↓
DEALLOCATE CURSOR
