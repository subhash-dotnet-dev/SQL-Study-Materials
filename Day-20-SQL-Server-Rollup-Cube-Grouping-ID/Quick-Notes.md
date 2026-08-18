# Day 20 — Quick Notes

## 1. ROLLUP()

- `ROLLUP()` is used to generate **subtotals** and a **grand total**.
- It follows a hierarchical grouping order.

### Syntax

GROUP BY ROLLUP(column1, column2)

### Example

SELECT deptno, job, SUM(sal) AS totsal
FROM emp
GROUP BY ROLLUP(deptno, job);

### Remember

ROLLUP → Subtotals + Grand Total

---

## 2. CUBE()

- `CUBE()` generates subtotals for **different combinations of grouping columns**.
- It also generates the **grand total**.

### Syntax

GROUP BY CUBE(column1, column2)

### Example

SELECT deptno, job, SUM(sal) AS totsal
FROM emp
GROUP BY CUBE(deptno, job);

### Remember

CUBE → Multiple Grouping Combinations + Grand Total

---

## 3. ROLLUP vs CUBE

| ROLLUP | CUBE |
|---|---|
| Hierarchical subtotals | Combination-based subtotals |
| Follows grouping order | Generates multiple combinations |
| Subtotals + Grand Total | Subtotals + Grand Total |

Example:

ROLLUP(deptno, job)

→ Department-wise subtotals
→ Grand Total

CUBE(deptno, job)

→ Department subtotals
→ Job subtotals
→ Grand Total

---

## 4. GROUPING_ID()

- `GROUPING_ID()` identifies the grouping level of a subtotal or grand-total row.

### Syntax

GROUPING_ID(column1, column2)

### Values

1 → Subtotal of first grouping column

2 → Subtotal of second grouping column

3 → Grand Total

### Example

SELECT
    deptno,
    job,
    SUM(sal) AS totsal,
    GROUPING_ID(deptno, job) AS gid
FROM emp
GROUP BY CUBE(deptno, job);

---

## 5. GROUPING_ID() with CASE

CASE GROUPING_ID(deptno, job)
    WHEN 1 THEN 'Dept Subtotal'
    WHEN 2 THEN 'Job Subtotal'
    WHEN 3 THEN 'Grand Total'
END

This can be used to give meaningful labels to subtotal and grand-total rows.

---

## 6. State-wise & Gender-wise Grouping

### Using ROLLUP

SELECT
    state,
    gender,
    COUNT(*) AS num_of_persons
FROM persons
GROUP BY ROLLUP(state, gender)
ORDER BY state, gender;

Output concept:

State + Gender
→ Gender-wise details
→ State subtotal
→ Grand Total

### Using CUBE

SELECT
    state,
    gender,
    COUNT(*) AS num_of_persons
FROM persons
GROUP BY CUBE(state, gender)
ORDER BY state, gender;

CUBE also provides:

- State-wise totals
- Gender-wise totals
- Grand Total

---

## 7. Year-wise & Quarter-wise Grouping

ROLLUP can be used for hierarchical time-based reporting.

### Example

SELECT
    YEAR(dateid) AS year,
    DATEPART(QUARTER, dateid) AS quarter,
    SUM(amt) AS total_amt
FROM sales
GROUP BY ROLLUP(
    YEAR(dateid),
    DATEPART(QUARTER, dateid)
)
ORDER BY year, quarter;

Result concept:

2023
→ Q1
→ Q2
→ Q3
→ Q4
→ Year Subtotal

2024
→ Q1
→ Q2
→ Q3
→ Q4
→ Year Subtotal

→ Grand Total

---

## 8. RANGE GROUPING

- Range grouping is used to divide numeric values into meaningful categories.
- `CASE` can be combined with `GROUP BY`.

### Example

SELECT
    CASE
        WHEN sal BETWEEN 0 AND 2000 THEN '0-2000'
        WHEN sal BETWEEN 2001 AND 4000 THEN '2001-4000'
        WHEN sal > 4000 THEN 'Above 4000'
    END AS salrange,
    COUNT(*) AS cnt
FROM emp
GROUP BY
    CASE
        WHEN sal BETWEEN 0 AND 2000 THEN '0-2000'
        WHEN sal BETWEEN 2001 AND 4000 THEN '2001-4000'
        WHEN sal > 4000 THEN 'Above 4000'
    END;

### Remember

SALARY
↓
0–2000
2001–4000
Above 4000
↓
COUNT(*)

---

## 9. DUPLICATE RECORD DETECTION

- Duplicate records can be identified using:
  - `GROUP BY`
  - `HAVING`
  - `COUNT(*)`

### Example

SELECT
    eno,
    ename,
    sal
FROM emp44
GROUP BY eno, ename, sal
HAVING COUNT(*) > 1;

### Logic

Same values
+
COUNT(*) > 1
↓
Duplicate Record

---

# Interview Points

1. What is ROLLUP()?
   → Generates hierarchical subtotals and a grand total.

2. What is CUBE()?
   → Generates subtotals for different grouping combinations and a grand total.

3. Difference between ROLLUP() and CUBE()?
   → ROLLUP follows hierarchy; CUBE generates multiple grouping combinations.

4. What is GROUPING_ID()?
   → Identifies which grouping level produced a subtotal or grand total.

5. What does GROUPING_ID() = 1 indicate?
   → Subtotal of the first grouping column.

6. What does GROUPING_ID() = 2 indicate?
   → Subtotal of the second grouping column.

7. What does GROUPING_ID() = 3 indicate?
   → Grand Total.

8. How do you perform range grouping?
   → Use CASE expression with GROUP BY.

9. How do you find duplicate records?
   → GROUP BY the identifying columns and use HAVING COUNT(*) > 1.

10. Can ROLLUP() display a grand total?
    → Yes.

11. Can CUBE() display a grand total?
    → Yes.

---

# Day 20 Summary

ROLLUP()
→ Hierarchical Subtotals + Grand Total

CUBE()
→ Multiple Grouping Combinations + Grand Total

GROUPING_ID()
→ Identifies Grouping Level

CASE + GROUP BY
→ Range Grouping

GROUP BY + HAVING COUNT(*) > 1
→ Duplicate Detection

State + Gender
→ Population Analysis

Year + Quarter
→ Sales Reporting

---

## Learning Flow

LEARN → PRACTICE → DOCUMENT → IMPROVE 🚀
