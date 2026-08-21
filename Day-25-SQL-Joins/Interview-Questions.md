<div align="center">

# 🧠 Day 25 — SQL Server JOINs Interview Questions

### INNER JOIN • LEFT JOIN • RIGHT JOIN • FULL JOIN • CROSS JOIN • SELF JOIN

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Interview Preparation**  •  **💡 Concepts**  •  **💻 Practical SQL**

</div>

---

## 📌 Overview

This document contains important **SQL Server JOIN interview questions and answers** covered during Day 25.

The questions focus on JOIN concepts commonly asked in **SQL Developer, .NET Developer, Backend Developer, and Full Stack Developer interviews**.

---

# 🔹 Basic JOIN Questions

## 1. What is a JOIN in SQL Server?

A **JOIN** is used to combine rows from two or more tables based on a related column or a specified condition.

Example:

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno;
```

---

## 2. Why are JOINs used in SQL?

JOINs are used when related data is stored in different tables and needs to be retrieved together.

For example:

```text
EMP
  ↓
DEPT
  ↓
LOCATIONS
```

A JOIN can combine employee, department, and location information into a single result.

---

## 3. What are the different types of JOINs in SQL Server?

Common JOIN types include:

1. `INNER JOIN`
2. `LEFT JOIN`
3. `RIGHT JOIN`
4. `FULL JOIN`
5. `CROSS JOIN`
6. `SELF JOIN`

Other classifications include:

* `EQUI JOIN`
* `NON-EQUI JOIN`

---

## 4. What is an INNER JOIN?

`INNER JOIN` returns only the rows that have matching values in both tables.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Key Point

```text
TABLE A
   ∩
TABLE B
   =
MATCHING RECORDS
```

---

## 5. What is a LEFT JOIN?

`LEFT JOIN` returns:

* All rows from the left table
* Matching rows from the right table
* `NULL` for right-side columns when no match exists

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
LEFT JOIN dept AS d
    ON e.deptno = d.deptno;
```

---

## 6. What is a RIGHT JOIN?

`RIGHT JOIN` returns:

* All rows from the right table
* Matching rows from the left table
* `NULL` for left-side columns when no match exists

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
RIGHT JOIN dept AS d
    ON e.deptno = d.deptno;
```

---

## 7. What is a FULL JOIN?

`FULL JOIN` returns:

* Matching rows
* Non-matching rows from the left table
* Non-matching rows from the right table

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
FULL JOIN dept AS d
    ON e.deptno = d.deptno;
```

---

## 8. What is a CROSS JOIN?

`CROSS JOIN` returns every possible combination of rows from two tables.

It produces a **Cartesian Product**.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
CROSS JOIN dept AS d;
```

If:

```text
Table A = 5 rows
Table B = 4 rows
```

Then:

```text
Result = 5 × 4 = 20 rows
```

---

# 🔹 SELF JOIN Questions

## 9. What is a SELF JOIN?

A **SELF JOIN** is a JOIN where a table is joined with itself.

It is useful for hierarchical relationships.

Example:

```sql
SELECT e.ename AS Employee,
       m.ename AS Manager
FROM emp AS e
LEFT JOIN emp AS m
    ON e.mgr = m.empno;
```

Here the `emp` table is used twice with different aliases.

---

## 10. Why are aliases required in a SELF JOIN?

Aliases help SQL Server distinguish between the different instances of the same table.

```sql
FROM emp AS e
LEFT JOIN emp AS m
```

Here:

* `e` = Employee
* `m` = Manager

---

# 🔹 EQUI JOIN & NON-EQUI JOIN

## 11. What is an EQUI JOIN?

An **EQUI JOIN** uses the equality operator `=` to match related columns.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno;
```

---

## 12. What is a NON-EQUI JOIN?

A **NON-EQUI JOIN** uses operators other than `=`.

Common operators include:

```text
<
>
<=
>=
<>
BETWEEN
```

Example:

```sql
SELECT e.ename,
       e.sal,
       s.grade
FROM emp AS e
INNER JOIN salgrade AS s
    ON e.sal BETWEEN s.losal AND s.hisal;
```

---

# 🔹 JOIN Condition Questions

## 13. What is the purpose of the ON clause?

The `ON` clause defines the condition used to relate the tables.

Example:

```sql
ON e.deptno = d.deptno
```

It tells SQL Server how rows from the two tables should be matched.

---

## 14. Is a Primary Key and Foreign Key relationship mandatory for a JOIN?

**No.**

A PK-FK relationship is common, but SQL Server does not require an actual PK-FK constraint for every JOIN.

A JOIN can be performed using any logically related columns.

---

## 15. Do the columns used in a JOIN need to have the same name?

**No.**

The columns can have different names.

Example:

```sql
ON employee.department_id = department.deptno
```

The important requirement is that the columns contain a meaningful relationship.

---

## 16. What is the difference between ON and WHERE?

### `ON`

Defines the relationship between tables.

### `WHERE`

Filters the resulting rows.

Example:

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno
WHERE e.sal > 3000;
```

Here:

```text
ON    → Defines JOIN relationship
WHERE → Filters result
```

---

# 🔹 Multiple JOIN Questions

## 17. Can we JOIN more than two tables?

**Yes.**

SQL Server allows multiple tables to be joined in a single query.

Example:

```sql
SELECT e.ename,
       d.dname,
       l.city,
       c.country_name
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno
INNER JOIN locations AS l
    ON d.locid = l.locid
INNER JOIN countries AS c
    ON l.country_id = c.country_id;
```

---

## 18. How many JOIN conditions are generally required for N connected tables?

For a simple connected JOIN structure:

```text
N TABLES → N − 1 JOIN CONDITIONS
```

Example:

```text
4 Tables → 3 JOIN Conditions
```

```text
EMP
 ↓
DEPT
 ↓
LOCATIONS
 ↓
COUNTRIES
```

---

## 19. Can we use different JOIN types in the same query?

**Yes.**

A query can combine different JOIN types depending on the required result.

Example:

```sql
SELECT e.ename,
       d.dname,
       l.city
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno
LEFT JOIN locations AS l
    ON d.locid = l.locid;
```

---

# 🔹 Practical Interview Questions

## 20. How do you find employees who belong to a department?

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno;
```

---

## 21. How do you find all employees, including employees without a department?

Use a `LEFT JOIN`.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
LEFT JOIN dept AS d
    ON e.deptno = d.deptno;
```

---

## 22. How do you find departments that have no employees?

One common approach is:

```sql
SELECT d.dname
FROM dept AS d
LEFT JOIN emp AS e
    ON d.deptno = e.deptno
WHERE e.empno IS NULL;
```

---

## 23. How do you find employees and their managers?

Use a `SELF JOIN`.

```sql
SELECT e.ename AS Employee,
       m.ename AS Manager
FROM emp AS e
LEFT JOIN emp AS m
    ON e.mgr = m.empno;
```

---

## 24. How do you combine employee, department, location, and country information?

Use multiple JOINs.

```sql
SELECT e.ename,
       d.dname,
       l.city,
       l.state,
       c.country_name
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno
INNER JOIN locations AS l
    ON d.locid = l.locid
INNER JOIN countries AS c
    ON l.country_id = c.country_id;
```

---

# 🔥 Frequently Asked Interview Differences

## 25. INNER JOIN vs LEFT JOIN

| INNER JOIN                            | LEFT JOIN                                 |
| ------------------------------------- | ----------------------------------------- |
| Returns matching rows                 | Returns all left rows                     |
| Non-matching rows are excluded        | Non-matching left rows are included       |
| Useful when only matches are required | Useful when all left records are required |

---

## 26. LEFT JOIN vs RIGHT JOIN

| LEFT JOIN                                 | RIGHT JOIN                               |
| ----------------------------------------- | ---------------------------------------- |
| Preserves left table rows                 | Preserves right table rows               |
| Right-side unmatched values become `NULL` | Left-side unmatched values become `NULL` |
| More commonly used                        | Can often be rewritten as LEFT JOIN      |

---

## 27. INNER JOIN vs FULL JOIN

| INNER JOIN                 | FULL JOIN                                  |
| -------------------------- | ------------------------------------------ |
| Returns only matching rows | Returns matching + non-matching rows       |
| Excludes unmatched records | Includes unmatched records from both sides |

---

## 28. CROSS JOIN vs INNER JOIN

| CROSS JOIN                        | INNER JOIN                        |
| --------------------------------- | --------------------------------- |
| Produces Cartesian combinations   | Produces matching records         |
| No matching condition is required | Usually uses a JOIN condition     |
| Can produce a very large result   | Returns logically related records |

---

# 🧠 Interview Quick Revision

```text
INNER JOIN
→ Matching records

LEFT JOIN
→ All Left + Matching Right

RIGHT JOIN
→ All Right + Matching Left

FULL JOIN
→ All Left + All Right

CROSS JOIN
→ Cartesian Product

SELF JOIN
→ Table joined with itself

EQUI JOIN
→ Uses =

NON-EQUI JOIN
→ Uses <, >, <=, >=, etc.

ON
→ Defines JOIN condition

WHERE
→ Filters result

N TABLES
→ N − 1 JOIN CONDITIONS
```

---

# 🎯 Interview Preparation Checklist

* [ ] Understand INNER JOIN
* [ ] Understand LEFT JOIN
* [ ] Understand RIGHT JOIN
* [ ] Understand FULL JOIN
* [ ] Understand CROSS JOIN
* [ ] Understand SELF JOIN
* [ ] Understand EQUI JOIN
* [ ] Understand NON-EQUI JOIN
* [ ] Practice multiple-table JOINs
* [ ] Understand `ON` vs `WHERE`
* [ ] Practice PK-FK relationships
* [ ] Practice JOIN-based interview problems

---

<div align="center">

### 🚀 SQL Learning Journey

**Day 25 — Interview Preparation Completed**

**Learn → Practice → Revise → Interview Ready**

<br>

**Subhash Yadav**
**.NET Full Stack Developer**
**Learning in Public**

</div>
