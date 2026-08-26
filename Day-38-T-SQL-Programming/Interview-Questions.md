# SQL Server — Day 38 Interview Questions

## Topic: T-SQL Programming (Transact-SQL)

---

## 1. What is T-SQL?

**Answer:**

T-SQL stands for **Transact-SQL**.

It is Microsoft's extension of SQL that adds programming capabilities to SQL Server.

T-SQL supports:

- Variables
- Conditional statements
- Loops
- Error handling
- Stored Procedures
- Functions
- Triggers
- Dynamic SQL

---

## 2. What are the advantages of T-SQL?

**Answer:**

Major advantages of T-SQL are:

1. Improved performance
2. Supports conditional statements
3. Supports loops
4. Supports error handling
5. Supports reusability

---

## 3. How does T-SQL improve performance?

**Answer:**

In T-SQL, multiple SQL commands can be grouped into a single program/block and sent to SQL Server together.

This reduces the number of requests and responses between the application/user and SQL Server, which can improve performance.

---

## 4. What are the types of T-SQL blocks?

**Answer:**

There are two main types:

1. **Anonymous Blocks**
2. **Named Blocks**

Named blocks include:

- Stored Procedures
- Functions
- Triggers

---

## 5. What is an Anonymous Block?

**Answer:**

A T-SQL program without a name is called an **Anonymous Block**.

Common statements used in anonymous blocks include:

```sql
DECLARE
SET
PRINT
