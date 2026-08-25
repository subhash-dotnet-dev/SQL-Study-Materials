# SQL Server — Day 37 Quick Notes

## Topic: CLUSTERED INDEX, IDENTITY & SEQUENCE

---

## 1. CLUSTERED INDEX

A Clustered Index stores the **actual table data at the leaf level**.

```sql
CREATE CLUSTERED INDEX I10
ON CUST(CID);
