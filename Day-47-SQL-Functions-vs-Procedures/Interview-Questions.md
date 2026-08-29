# SQL Server — Day 47 Interview Questions

## Topic: Functions vs Procedures

---

## 1. What is a Scalar-Valued Function (SVF)?

**Answer:**

A Scalar-Valued Function returns a single value such as INT, VARCHAR, MONEY, etc.

---

## 2. What is a Table-Valued Function (TVF)?

**Answer:**

A Table-Valued Function returns records in the form of a table.

---

## 3. Difference between SVF and TVF?

**Answer:**

| SVF | TVF |
|---|---|
| Returns one value | Returns records |
| Return type is scalar | Return type is TABLE |
| Return expression is scalar | Return expression is SELECT |
| Used in SELECT clause | Used in FROM clause |

---

## 4. What is the difference between a Procedure and a Function?

**Answer:**

| Procedure | Function |
|---|---|
| May or may not return a value | Must return a value |
| Can return multiple values | Returns a value |
| Uses OUTPUT parameters | Uses RETURN statement |
| DML operations are allowed | DML operations are not allowed |
| Used to perform database actions | Used mainly for calculations/data retrieval |
| Called using EXEC | Can be called from SQL commands |

---

## 5. How does a Procedure return values?

**Answer:**

A Procedure can return values using OUTPUT parameters.

---

## 6. How does a Function return a value?

**Answer:**

A Function returns a value using the RETURN statement.

---

## 7. Where is an SVF called?

**Answer:**

An SVF is generally called in the SELECT clause.

```sql
SELECT dbo.GET_BALANCE(102);
