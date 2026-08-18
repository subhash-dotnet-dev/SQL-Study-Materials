<div align="center">

# 📝 Day 21 — SQL Server Integrity Constraints

### NOT NULL • UNIQUE • PRIMARY KEY • CHECK • Keys • Data Integrity

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Quick Revision** &nbsp;•&nbsp; **🧠 Interview Focus** &nbsp;•&nbsp; **⚡ Fast Recall**

</div>

---

## 📌 What are Integrity Constraints?

Integrity Constraints are rules used to maintain:

- Data Integrity
- Data Quality
- Data Consistency
- Data Validation

They prevent users from inserting invalid or inconsistent data.

---

# 🔐 Types of Constraints

SQL Server supports:

1. `NOT NULL`
2. `UNIQUE`
3. `PRIMARY KEY`
4. `CHECK`
5. `FOREIGN KEY`
6. `DEFAULT`

> **Day 21 Focus:** `NOT NULL`, `UNIQUE`, `PRIMARY KEY`, `CHECK`, Candidate Key, Alternate/Secondary Key.

---

# 1️⃣ NOT NULL

### Meaning

Prevents a column from storing `NULL`.

```sql
ENAME VARCHAR(20) NOT NULL
