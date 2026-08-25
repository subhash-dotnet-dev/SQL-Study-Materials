<div align="center">

# 🗄️ Day 37 — SQL Server: Clustered Index, Identity & Sequence

### CLUSTERED INDEX • NON-CLUSTERED INDEX • IDENTITY • SEQUENCE

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 37 focuses on **Indexes, Identity and Sequence** in SQL Server.

The main concepts covered are:

- `CLUSTERED INDEX`
- `NON-CLUSTERED INDEX`
- Clustered vs Non-Clustered Index
- `SP_HELPINDEX`
- `DROP INDEX`
- `IDENTITY`
- `IDENTITY(SEED, INCREMENT)`
- `DELETE` vs `TRUNCATE`
- `SEQUENCE`
- `NEXT VALUE FOR`
- `ALTER SEQUENCE`
- Identity vs Sequence
- SQL Server Database Objects

---

## 🎯 Learning Objectives

By the end of Day 37, the focus was on understanding:

- What is a Clustered Index?
- What is a Non-Clustered Index?
- Difference between Clustered and Non-Clustered Index
- How to check indexes using `SP_HELPINDEX`
- How to drop an index
- How `IDENTITY` generates values
- Meaning of Seed and Increment
- Behavior of Identity after `DELETE`
- Behavior of Identity after `TRUNCATE`
- What is a Sequence?
- How to retrieve the next Sequence value
- How to restart a Sequence
- Difference between Identity and Sequence

---

# 📚 1. CLUSTERED INDEX

A **Clustered Index** stores the **actual table data at the leaf level** of the index.

Example:

```sql
CREATE TABLE CUST
(
    CID INT,
    CNAME VARCHAR(10)
);

CREATE CLUSTERED INDEX I10
ON CUST(CID);
