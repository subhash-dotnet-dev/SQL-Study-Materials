<div align="center">

# 🗄️ Day 34 — SQL Server Security & Views

### LOGINS • USERS • PRIVILEGES • GRANT • REVOKE • VIEWS

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 34 focuses on **Database Security and Views** in SQL Server.

The main concepts covered are:

- `LOGINS`
- `USERS`
- `PRIVILEGES`
- `GRANT`
- `REVOKE`
- Database Objects
- `VIEWS`
- Simple Views
- Complex Views
- Row-Level Security
- View Permissions
- `INFORMATION_SCHEMA`

---

## 🎯 Learning Objectives

By the end of Day 34, the focus was on understanding:

- Server-level security using Logins
- Database-level security using Users
- Table-level security using Privileges
- Granting permissions
- Revoking permissions
- Database Objects
- Views and Virtual Tables
- Simple Views
- Complex Views
- Row-Level Security using Views
- View Permissions
- `INFORMATION_SCHEMA`

---

# 🔐 DATABASE SECURITY

SQL Server provides security at different levels:

| Level | Security Object |
|---|---|
| Server | `LOGIN` |
| Database | `USER` |
| Table | `PRIVILEGES` |
| Rows & Columns | `VIEW` |

### Security Flow

```text
SERVER
   ↓
LOGINS
   ↓
DATABASE
   ↓
USERS
   ↓
TABLE
   ↓
PRIVILEGES
   ↓
ROWS & COLUMNS
   ↓
VIEWS
