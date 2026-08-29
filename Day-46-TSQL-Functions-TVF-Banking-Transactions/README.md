<div align="center">

# 🗄️ Day 46 — SQL Server: Functions, Procedures & Banking Transactions

### SCALAR-VALUED FUNCTION • TABLE-VALUED FUNCTION • CURSOR OUTPUT • BANKING OPERATIONS

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 46 focuses on **User-Defined Functions, Procedures Returning Records, and Real-World Banking Transactions** in SQL Server.

### Topics Covered

- Scalar-Valued Functions (SVF)
- Table-Valued Functions (TVF)
- Procedures Returning Records
- CURSOR VARYING OUTPUT
- Order Amount Calculation
- Top N Employees using DENSE_RANK()
- Account Opening
- Account Closing
- Balance Enquiry
- Money Deposit
- Money Withdrawal
- Money Transfer
- Transaction Statements
- Latest N Transactions
- SQL Server Sequence

---

## 🎯 Learning Objectives

By the end of Day 46, the focus was on understanding:

- How Scalar-Valued Functions work
- How Table-Valued Functions work
- Difference between SVF and TVF
- Returning records from procedures using cursors
- Calculating order totals
- Finding Top N employees
- Implementing banking operations using procedures/functions
- Generating transaction IDs using Sequence
- Retrieving transactions by date range
- Retrieving latest N transactions

---

# 🧩 1. Scalar-Valued Function

A **Scalar-Valued Function (SVF)** returns a single value.

Examples of return types:

```text
INT
MONEY
VARCHAR
DECIMAL
