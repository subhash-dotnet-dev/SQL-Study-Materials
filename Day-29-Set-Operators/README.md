<div align="center">

# 🗄️ Day 29 — SQL Server SET OPERATORS

### UNION • UNION ALL • INTERSECT • EXCEPT

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 29 focuses on **SET OPERATORS** in SQL Server.

Set Operators are used to **combine or compare the result of two queries**.

The four SET OPERATORS studied are:

- `UNION`
- `UNION ALL`
- `INTERSECT`
- `EXCEPT`

---

## 🎯 Learning Objectives

By the end of Day 29, the focus was on understanding:

- SET OPERATORS
- `UNION`
- `UNION ALL`
- `INTERSECT`
- `EXCEPT`
- Difference between `UNION` and `UNION ALL`
- Difference between `UNION` and `JOIN`
- Combining results from multiple queries
- Removing duplicate records
- Finding common records
- Finding records available in one result but not another
- SET OPERATOR rules

---

# 🔗 SET OPERATORS

SET OPERATORS are used to perform operations between the **result of two queries**.

### Available SET OPERATORS

| Operator | Purpose |
|---|---|
| `UNION` | Combines rows and removes duplicates |
| `UNION ALL` | Combines rows and keeps duplicates |
| `INTERSECT` | Returns common rows |
| `EXCEPT` | Returns rows from first query not present in second |

---

## 📌 SET OPERATOR RULES

### Rule 1 — Same Number of Columns

Both queries must return the **same number of columns**.

### Rule 2 — Compatible Datatypes

Corresponding columns must have the **same / compatible datatype**.

### Basic Syntax

```sql
SELECT statement1

UNION / UNION ALL / INTERSECT / EXCEPT

SELECT statement2;
