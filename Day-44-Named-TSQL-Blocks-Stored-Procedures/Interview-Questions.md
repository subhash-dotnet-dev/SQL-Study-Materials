# SQL Server — Day 44 Interview Questions

## Topic: Named T-SQL Blocks & Stored Procedures

---

## 1. What are Named T-SQL Blocks?

**Answer:**

Named T-SQL Blocks are programs created with a name and stored in the SQL Server database.

The main named T-SQL blocks are:

1. Stored Procedures
2. Functions
3. Triggers

---

## 2. What are Sub-programs in T-SQL?

**Answer:**

Stored Procedures and Functions are called sub-programs in T-SQL.

They help divide a large program into smaller and reusable modules.

---

## 3. What is a Stored Procedure?

**Answer:**

A Stored Procedure is a named T-SQL block that can accept parameters, perform one or more database operations, and may or may not return a value.

It can perform:

- INSERT
- UPDATE
- DELETE
- SELECT

---

## 4. What are the advantages of Stored Procedures?

**Answer:**

Main advantages are:

1. **Modular Programming**
2. **Reusability**
3. **Can be invoked from Front-End Applications**
4. **Improves Performance**

---

## 5. What is Modular Programming?

**Answer:**

Modular programming means dividing a large T-SQL program into smaller modules using procedures and functions.

This makes the program easier to develop, understand and maintain.

---

## 6. What is Reusability?

**Answer:**

A Stored Procedure is created with a name and stored in the database.

Because of this, the same procedure can be executed multiple times from different programs or applications.

---

## 7. Can Stored Procedures be called from Front-End Applications?

**Answer:**

Yes.

Stored Procedures stored in the database can be called from front-end applications such as C# and ASP.NET applications.

---

## 8. What are the types of parameters in Stored Procedures?

**Answer:**

There are mainly two types:

1. **INPUT Parameter**
2. **OUTPUT Parameter**

---

## 9. What is an INPUT Parameter?

**Answer:**

An INPUT parameter receives a value from the calling program.

It is the default parameter type.

**Example:**

```sql
CREATE OR ALTER PROCEDURE raise_salary
@eno INT,
@amt MONEY
AS
UPDATE emp
SET sal = sal + @amt
WHERE empno = @eno;
