# SQL Server — Day 37 Interview Questions

## Topic: CLUSTERED INDEX, IDENTITY & SEQUENCE

---

## 1. What is a Clustered Index?

A Clustered Index is an index where the **actual table data is stored at the leaf level** of the index.

---

## 2. What is the main difference between Clustered and Non-Clustered Index?

**Clustered Index**
- Stores actual table data at the leaf level.
- Only one clustered index is possible per table.

**Non-Clustered Index**
- Stores index keys and row locators.
- Multiple non-clustered indexes can be created on a table.

---

## 3. How many Clustered Indexes can a table have?

A table can have **only one Clustered Index** because the table data can have only one physical ordering based on the clustered index key.

---

## 4. How many Non-Clustered Indexes can a table have?

SQL Server supports multiple Non-Clustered Indexes on a table.

---

## 5. What does a Clustered Index store at the leaf level?

The leaf level of a Clustered Index contains the **actual table data**.

---

## 6. What does a Non-Clustered Index store?

A Non-Clustered Index stores the **index key values and row locators** that help SQL Server locate the actual table rows.

---

## 7. Why can a table have only one Clustered Index?

Because a Clustered Index determines how the table's data rows are organized at the leaf level. A table can have only one such organization.

---

## 8. How can you list the indexes created on a table?

Using:

```sql
EXEC SP_HELPINDEX 'CUST';
