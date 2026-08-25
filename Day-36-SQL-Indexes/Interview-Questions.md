# SQL Server — Day 36 Interview Questions

## Topic: INDEXES

---

## 1. What is an Index?

An **Index** is a database object used to improve the performance of data retrieval.

It helps SQL Server locate required rows faster instead of scanning the entire table in suitable cases.

---

## 2. Why are Indexes used?

Indexes are mainly created to improve query performance.

Indexes are commonly useful on columns that are:

- Frequently used in `WHERE` clauses
- Frequently used in `JOIN` operations
- Used for searching and sorting

---

## 3. Give a real-world example of an Index.

An Index in a database is similar to the **index of a textbook**.

```text
TEXTBOOK
   ↓
Index → Find Topic Faster

DATABASE
   ↓
Index → Find Data Faster
