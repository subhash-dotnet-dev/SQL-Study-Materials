# SQL Server — Day 42 Interview Questions

## Topic: Scrollable Cursor

---

## 1. What is a Cursor in SQL Server?

**Answer:**

A Cursor is a database object used in T-SQL to process query results **row-by-row**.

It allows a T-SQL program to fetch individual rows from a result set and process them one at a time.

---

## 2. What is a Scrollable Cursor?

**Answer:**

A Scrollable Cursor is a cursor that supports navigation in **both forward and backward directions**.

It is declared using the `SCROLL` keyword.

**Syntax:**

```sql
DECLARE cursor_name CURSOR SCROLL
FOR
SELECT column_name
FROM table_name;
