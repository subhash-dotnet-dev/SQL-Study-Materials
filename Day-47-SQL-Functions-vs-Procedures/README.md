<div align="center">

# 🗄️ Day 47 — SQL Server: Functions vs Procedures

### SCALAR-VALUED FUNCTION • TABLE-VALUED FUNCTION • STORED PROCEDURE

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 47 focuses on the important differences between **Scalar-Valued Functions, Table-Valued Functions, Stored Procedures, and Functions** in SQL Server.

The day also covers how to view and remove user-created procedures and functions.

---

## 🎯 Learning Objectives

By the end of Day 47, the focus was on understanding:

- Scalar-Valued Functions (SVF)
- Table-Valued Functions (TVF)
- Difference between SVF and TVF
- Difference between Procedures and Functions
- Return values and OUTPUT parameters
- DML operations
- `INFORMATION_SCHEMA.ROUTINES`
- Dropping Procedures
- Dropping Functions

---

# 🔹 1. Scalar-Valued Function (SVF)

A Scalar-Valued Function returns **one value**.

### Key Points

- Returns one value
- Return type must be a scalar type
- Examples: `INT`, `VARCHAR`, `MONEY`
- Return expression is a scalar value
- Generally called in the `SELECT` clause

### Example

```sql
SELECT dbo.GET_BALANCE(102);
