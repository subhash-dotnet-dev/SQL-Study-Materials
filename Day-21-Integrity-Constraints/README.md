<div align="center">

# 🗄️ Day 21 — SQL Server Integrity Constraints

### NOT NULL • UNIQUE • PRIMARY KEY • CHECK • Candidate Key • Data Integrity

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Quick Notes**

</div>

---

## 📌 Overview

Day 21 focuses on **Integrity Constraints** in SQL Server.

Integrity constraints are rules used to maintain **data integrity, data quality, data consistency, and data validation**.

They help prevent users from inserting invalid, duplicate, missing, or inconsistent data into database tables.

---

## 🎯 Learning Objectives

By the end of Day 21, the focus was on understanding:

- Integrity Constraints
- Data Integrity
- Data Validation
- Column-level constraints
- Table-level constraints
- `NOT NULL`
- `UNIQUE`
- `PRIMARY KEY`
- `CHECK`
- Candidate Key
- Alternate Key / Secondary Key
- `UNIQUE` vs `PRIMARY KEY`
- Constraint-based validation

> **Note:** `FOREIGN KEY` and `DEFAULT` are part of the overall SQL Server constraint syllabus but are **not included in the Day 21 study content yet**.

---

# 🔐 Integrity Constraints

Integrity constraints are rules applied to table columns to maintain valid and consistent data.

### Main Purpose

```text
USER INPUT
    ↓
CONSTRAINT
    ↓
VALIDATION
    ↓
VALID DATA
    ↓
DATA INTEGRITY
