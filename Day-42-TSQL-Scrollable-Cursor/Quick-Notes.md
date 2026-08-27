# SQL Server — Day 42 Quick Notes

## Topic: Scrollable Cursor

---

## 📌 What is a Cursor?

A Cursor is a database object used in T-SQL to process multiple rows **row-by-row**.

```text
SELECT Query
     ↓
Cursor Result Set
     ↓
Fetch One Row
     ↓
Process Row
