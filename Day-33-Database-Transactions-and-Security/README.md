<div align="center">

# 🗄️ Day 33 — SQL Server Transactions & Database Security

### DATABASE TRANSACTIONS • TCL • ATOMICITY • SECURITY

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 33 focuses on **Database Transactions** and **Database Security** in SQL Server.

The main focus is understanding how multiple DML operations can be handled as a single unit using **Transactions**, and how SQL Server provides security at different levels.

---

## 🎯 Learning Objectives

By the end of Day 33, the focus was on understanding:

- Database Transactions
- Atomicity
- TCL Commands
- `COMMIT`
- `ROLLBACK`
- `BEGIN TRANSACTION`
- `SAVE TRANSACTION`
- Successful Transactions
- Aborted Transactions
- Transaction Lifecycle
- Database Security
- Logins
- Users
- Privileges
- Views

---

# 🔄 DATABASE TRANSACTIONS

A **transaction** is a unit of work that contains one or more DML operations and must be saved as a whole or cancelled as a whole.

### Example — Money Transfer

A money transfer may contain two operations:

```text
Account 1
    ↓
Debit Money
    ↓
Account 2
    ↓
Credit Money
