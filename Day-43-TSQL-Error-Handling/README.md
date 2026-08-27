# 🗄️ Day 43 — SQL Server: Error Handling / Exception Handling

<div align="center">

**### TRY-CATCH • ERROR FUNCTIONS • RAISERROR() • TRANSACTION HANDLING**

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 43 focuses on **Error Handling / Exception Handling in T-SQL**.

Error handling allows us to detect and handle runtime errors gracefully instead of allowing unexpected failures to affect database operations.

### Main Topics

- Syntax Errors
- Logical Errors
- Runtime Errors / Exceptions
- `TRY...CATCH`
- `ERROR_NUMBER()`
- `ERROR_MESSAGE()`
- `SYS.MESSAGES`
- `RAISERROR()`
- Severity Levels
- State
- Transactions
- `COMMIT`
- `ROLLBACK`
- Constraint Error Handling
- Divide-by-Zero Error Handling
- Conditional Error Handling
- Money Transfer Logic

---

## 🎯 Learning Objectives

By the end of Day 43, the focus was on understanding:

- What are different types of errors?
- What is a runtime error?
- Why is error handling required?
- How does `TRY...CATCH` work?
- How to retrieve error number?
- How to retrieve error message?
- What is `RAISERROR()`?
- What are severity levels?
- What is the purpose of state?
- How to handle constraint violations?
- How to handle divide-by-zero errors?
- How to use error handling with transactions?
- How to safely process money transfers?

---

# ⚠️ TYPES OF ERRORS

SQL Server programs can encounter different types of errors.

```text
                ERRORS
                   ↓
        ┌──────────┼──────────┐
        ↓          ↓          ↓
     SYNTAX      LOGICAL    RUNTIME
      ERROR       ERROR      ERROR
                              ↓
                          EXCEPTION
