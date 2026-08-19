# 📝 Day 24 — SQL Server DELETE Rules
## Quick Notes

---

## 📌 1. DELETE Rules

DELETE Rules specify **how child records are affected when a parent record is deleted**.

DELETE Rules are defined with a **Foreign Key**.

### Types:

1. `ON DELETE NO ACTION`
2. `ON DELETE CASCADE`
3. `ON DELETE SET NULL`
4. `ON DELETE SET DEFAULT`

---

# 1️⃣ ON DELETE NO ACTION

### Definition

`NO ACTION` is the **default DELETE behavior**.

If a parent record has related child records, the parent record **cannot be deleted**.

### Syntax

```sql
FOREIGN KEY (DNO)
REFERENCES DEPT(DNO)
ON DELETE NO ACTION
