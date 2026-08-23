# Day 28 - CROSS / CARTESIAN JOIN

## Interview Questions

### 1. What is a CROSS JOIN in SQL?

A CROSS JOIN returns the **Cartesian Product** of two tables.

Every row from the first table is combined with every row from the second table.

---

### 2. What is another name for CROSS JOIN?

CROSS JOIN is also called a:

- Cartesian JOIN
- Cartesian Product

---

### 3. Does CROSS JOIN require a JOIN condition?

No.

CROSS JOIN does not require an `ON` condition.

### Syntax

```sql
SELECT columns
FROM table1
CROSS JOIN table2;
