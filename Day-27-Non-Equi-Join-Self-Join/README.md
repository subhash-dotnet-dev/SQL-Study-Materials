<div align="center">

# 🗄️ Day 27 — Non-Equi JOIN & SELF JOIN

**### RANGE MATCHING • MULTI-TABLE JOINS • EMPLOYEE-MANAGER RELATIONSHIPS**

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes** &nbsp;•&nbsp; **💻 SQL Practice**

</div>

---

## 📌 Overview

Day 27 focuses on **Non-Equi JOIN** and **SELF JOIN** concepts in SQL Server.

The session covers how JOIN conditions can be based on comparison operators and how a table can be joined with itself using different aliases.

The major concepts studied are:

- Non-Equi JOIN
- Range-Based Matching
- `BETWEEN`
- Multi-Table JOIN
- SELF JOIN
- Table Aliases
- Employee → Manager Relationship
- Same Salary Comparison
- Same Hire Date Comparison
- Team Combinations

---

## 🎯 Learning Objectives

By the end of Day 27, the focus was on understanding:

- What is a Non-Equi JOIN
- Difference between Equi JOIN and Non-Equi JOIN
- Comparison-based JOIN conditions
- `BETWEEN` operator in JOIN
- Salary → Grade matching
- Multi-table JOIN
- What is a SELF JOIN
- Using different aliases in SELF JOIN
- Employee → Manager relationships
- Comparing records from the same table
- Generating unique team combinations

---

# 🔗 1️⃣ NON-EQUI JOIN

A **Non-Equi JOIN** is performed when the JOIN condition is not based only on the `=` operator.

Common operators used in Non-Equi JOIN are:

```text
BETWEEN
>
<
>=
<=
<>
