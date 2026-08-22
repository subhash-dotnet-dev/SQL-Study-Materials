# 🎯 Day 27 — Non-Equi JOIN & SELF JOIN
## SQL Server Interview Questions & Answers

---

## 📌 NON-EQUI JOIN

### 1. What is a Non-Equi JOIN?

**Answer:**

A Non-Equi JOIN is a JOIN where the JOIN condition is not based on the `=` operator.

It can use operators such as:

- `BETWEEN`
- `>`
- `<`
- `>=`
- `<=`
- `<>`

---

### 2. Why is a Non-Equi JOIN used?

**Answer:**

A Non-Equi JOIN is used when two tables do not share a common field for direct equality-based matching.

It is commonly used for **range-based matching**.

**Example:**

Employee salary can be matched with a salary grade range.

```sql
ON e.sal BETWEEN s.losal AND s.hisal
