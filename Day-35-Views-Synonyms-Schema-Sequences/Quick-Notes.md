# SQL Server — Day 35 Quick Notes

## Topic: VIEWS, SYNONYMS, SCHEMA & SEQUENCES

---

## 1. DROP VIEW

`DROP VIEW` is used to remove an existing View.

```sql
DROP VIEW V1;
```

### Important Point

If the base table is dropped, the View remains but cannot be queried successfully because its underlying table no longer exists.

---

## 2. SYNONYMS

A **Synonym** is an alternative name for a database object.

### Create Synonym

```sql
CREATE SYNONYM E
FOR EMP;
```

### Use Synonym

```sql
SELECT * FROM E;
```

### Drop Synonym

```sql
DROP SYNONYM E;
```

### Remember

```text
SYNONYM
   ↓
Alternative Name
   ↓
Database Object
```

---

## 3. SCHEMA

A **Schema** is used to logically group and organize related database objects.

### Create Schema

```sql
CREATE SCHEMA SALES;
```

### Create Table

```sql
CREATE TABLE SALES.CUST
(
    CID INT,
    CNAME VARCHAR(10),
    ADDR VARCHAR(20)
);
```

### Access Table

```sql
SELECT * FROM SALES.CUST;
```

### Remember

```text
SCHEMA
   ↓
Groups Related Objects
```

---

## 4. SYNONYM vs ALIAS

| SYNONYM            | ALIAS                         |
| ------------------ | ----------------------------- |
| Database Object    | Query Level                   |
| Stored in Database | Not Stored as Separate Object |
| Permanent          | Query Scope                   |
| Reusable           | Used within Query             |

### Easy Memory

```text
SYNONYM → DATABASE LEVEL

ALIAS → QUERY LEVEL
```

---

## 5. SEQUENCES

A **Sequence** is a database object used to generate sequential numeric values.

### Create Sequence

```sql
CREATE SEQUENCE S1
START WITH 1
INCREMENT BY 1
MAXVALUE 5;
```

### Sequence Values

```text
1 → 2 → 3 → 4 → 5
```

---

## 6. NEXT VALUE FOR

`NEXT VALUE FOR` is used to retrieve the next value from a Sequence.

```sql
INSERT INTO STUDENT
VALUES
(
    NEXT VALUE FOR S1,
    'A'
);
```

### Remember

```text
NEXT VALUE FOR
       ↓
Next Sequence Value
```

---

## 7. CYCLE

`CYCLE` allows the Sequence to restart after reaching its limit.

```text
1 → 2 → 3 → 4 → 5
                ↓
              RESTART
                ↓
                1
```

### Remember

```text
CYCLE → RESTART
```

---

## 8. NOCYCLE

`NOCYCLE` stops the Sequence after reaching its limit.

```text
1 → 2 → 3 → 4 → 5
                ↓
               STOP
```

### Remember

```text
NOCYCLE → STOP
```

---

## 9. ALTER SEQUENCE

`ALTER SEQUENCE` is used to modify or restart an existing Sequence.

### Restart Sequence

```sql
ALTER SEQUENCE S1
RESTART WITH 1;
```

---

## 10. DROP SEQUENCE

`DROP SEQUENCE` is used to remove a Sequence.

```sql
DROP SEQUENCE S1;
```

---

## 11. QUICK REVISION

```text
VIEW
 ↓
Virtual Table

SYNONYM
 ↓
Alternative Database Object Name

SCHEMA
 ↓
Group Database Objects

ALIAS
 ↓
Query-Level Name

SEQUENCE
 ↓
Number Generator

NEXT VALUE FOR
 ↓
Get Next Sequence Value

CYCLE
 ↓
Restart

NOCYCLE
 ↓
Stop

ALTER SEQUENCE
 ↓
Modify / Restart

DROP SEQUENCE
 ↓
Remove Sequence
```

---

## 12. INTERVIEW QUICK POINTS

```text
Synonym = Alternative name for database object

Schema = Logical container for database objects

Sequence = Generates sequential numeric values

NEXT VALUE FOR = Gets next Sequence value

CYCLE = Restarts Sequence

NOCYCLE = Stops Sequence

DROP VIEW = Removes View

DROP SYNONYM = Removes Synonym

DROP SEQUENCE = Removes Sequence
```

---

## 🎯 DAY 35 QUICK MEMORY

```text
VIEW      → Virtual Table
SYNONYM   → Alternative Name
SCHEMA    → Group Objects
ALIAS     → Query Level
SEQUENCE  → Number Generator
CYCLE     → Restart
NOCYCLE   → Stop
```

**Day 35 — SQL Server Concepts Complete ✅**
