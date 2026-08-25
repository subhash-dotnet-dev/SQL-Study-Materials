# SQL Server — Day 33 Quick Notes
## Topic: DATABASE TRANSACTIONS & SECURITY

---

## 1. DATABASE TRANSACTION

A transaction is a **unit of work** that contains one or more DML operations.

A transaction must be:

- Saved as a whole
- OR cancelled as a whole

### Example

```text
MONEY TRANSFER

Account 1
₹1000
  ↓
- ₹1000

Account 2
₹0
  ↓
+ ₹1000
