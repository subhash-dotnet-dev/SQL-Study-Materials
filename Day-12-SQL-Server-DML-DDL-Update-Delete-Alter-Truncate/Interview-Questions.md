
### `Interview-Questions.md`

```markdown
# Day 12 - SQL Server DML & DDL Interview Questions

## 1. What is DML?

DML stands for Data Manipulation Language.

It is used to work with data stored inside tables.

Examples:

- INSERT
- UPDATE
- DELETE
- MERGE

---

## 2. What is DDL?

DDL stands for Data Definition Language.

It is mainly used to create or modify database object structures.

Examples:

- CREATE
- ALTER
- DROP
- TRUNCATE

---

## 3. What is the UPDATE command?

UPDATE is used to modify existing data in a table.

Example:

```sql
UPDATE EMP
SET SAL = 1000
WHERE EMPNO = 7369;
