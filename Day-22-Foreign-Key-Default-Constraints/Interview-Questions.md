<div align="center">

# 🧠 Day 22 — SQL Server Interview Questions

### FOREIGN KEY • DEFAULT • RELATIONSHIPS • COMPOSITE KEY • ALTER TABLE

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🎯 Interview Questions** &nbsp;•&nbsp; **💡 Quick Revision**

</div>

---

## 📌 Overview

Day 22 focuses on **Foreign Key, DEFAULT, Table Relationships, Composite Keys, ALTER TABLE, and Constraint Management** in SQL Server.

---

# 🔥 Basic Interview Questions

### Q1. What is a Foreign Key?

**Answer:**

A Foreign Key is a column or combination of columns used to establish a relationship between two tables.

It references a **Primary Key or UNIQUE key** in the parent table.

```sql
FOREIGN KEY (projid)
REFERENCES projects(projid)
