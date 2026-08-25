# SQL Server — Day 33 Interview Questions
## Topic: DATABASE TRANSACTIONS & SECURITY

---

## 1. What is a Transaction?

A transaction is a unit of work that contains one or more DML operations and must be saved as a whole or cancelled as a whole.

---

## 2. What is Atomicity?

Atomicity means **ALL OR NONE**.

If all operations in a transaction are successful, the transaction is saved.

If any operation fails, the entire transaction is cancelled.

---

## 3. What are TCL Commands?

The main TCL commands used to handle transactions are:

- `COMMIT`
- `ROLLBACK`
- `SAVE TRANSACTION`

---

## 4. What is COMMIT?

`COMMIT` is used to save the transaction permanently.

```sql
BEGIN TRANSACTION;

INSERT INTO A VALUES (10);
INSERT INTO A VALUES (20);

COMMIT;
