<div align="center">

# 🗄️ Day 42 — SQL Server: SCROLLABLE CURSOR

### FORWARD-ONLY CURSOR • SCROLL CURSOR • FETCH OPERATIONS

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 42 focuses on **Scrollable Cursors in T-SQL**.

By default, a cursor is **Forward-Only**, which supports navigation only in the forward direction.

When a cursor is declared using the **`SCROLL`** option, it becomes a **Scrollable Cursor** and supports both forward and backward navigation.

### Main Topics

- Forward-Only Cursor
- Scrollable Cursor
- `SCROLL`
- `FETCH FIRST`
- `FETCH NEXT`
- `FETCH PRIOR`
- `FETCH LAST`
- `FETCH ABSOLUTE`
- `FETCH RELATIVE`
- `@@FETCH_STATUS`
- Reverse Cursor Navigation
- Every Nth Record
- Practical Cursor Programs

---

## 🎯 Learning Objectives

By the end of Day 42, the focus was on understanding:

- What is a Forward-Only Cursor?
- What is a Scrollable Cursor?
- Difference between Forward-Only and Scrollable Cursor
- How to declare a cursor using `SCROLL`
- How `FETCH FIRST` works
- How `FETCH NEXT` works
- How `FETCH PRIOR` works
- How `FETCH LAST` works
- How `FETCH ABSOLUTE` works
- How `FETCH RELATIVE` works
- How to navigate through cursor records
- How to print records from last to first
- How to process every 5th record

---

# 🧑‍💻 SCROLLABLE CURSOR

A **Scrollable Cursor** allows navigation through cursor rows in different directions.

```text
                    CURSOR
                       ↓
                 SCROLL CURSOR
                       ↓
       ┌───────────────┼───────────────┐
       ↓               ↓               ↓
    FORWARD         BACKWARD        POSITION
       ↓               ↓               ↓
     NEXT            PRIOR          ABSOLUTE
                                      ↓
                                   RELATIVE
