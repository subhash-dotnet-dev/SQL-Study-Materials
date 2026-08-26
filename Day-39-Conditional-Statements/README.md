<div align="center">

# 🗄️ Day 39 — SQL Server: Conditional Statements

### IF-ELSE • MULTI IF • NESTED IF • CONDITIONAL LOGIC

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 39 focuses on **Conditional Statements in T-SQL**.

Conditional statements are used to execute different SQL statements based on whether a specified condition is **TRUE or FALSE**.

### Main Topics

- Conditional Statements
- `IF-ELSE`
- `MULTI IF / ELSE IF`
- `NESTED IF`
- `BEGIN...END`
- Conditional Transactions
- `COMMIT`
- `ROLLBACK`
- `DATEDIFF()`
- Conditional `DELETE`
- Conditional `UPDATE`
- Conditional `INSERT`
- Practical T-SQL Programs

---

## 🎯 Learning Objectives

By the end of Day 39, the focus was on understanding:

- What are Conditional Statements?
- How `IF-ELSE` works
- How `ELSE IF` works
- How to implement multiple conditions
- What is Nested IF?
- How to use `BEGIN...END`
- How to perform conditional `UPDATE`
- How to perform conditional `DELETE`
- How to perform conditional `INSERT`
- How to use conditions with Transactions
- Difference between `COMMIT` and `ROLLBACK`
- Using `DATEDIFF()` with conditions
- Implementing real-world banking logic
- Implementing student result logic

---

# 🧑‍💻 CONDITIONAL STATEMENTS

Conditional statements allow T-SQL to make decisions based on conditions.

```text
Conditional Statements

        ↓

   Condition Check

        ↓

 ┌────────┬─────────┬──────────┐
 ↓        ↓         ↓
IF-ELSE  ELSE IF   Nested IF
