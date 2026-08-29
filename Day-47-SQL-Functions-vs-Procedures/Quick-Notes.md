# SQL Server — Day 47 Quick Notes

## 📌 Topic
**Functions vs Procedures**

---

## 🔹 Scalar-Valued Function (SVF)

- Returns **one value**
- Return type → `INT`, `VARCHAR`, `MONEY`, etc.
- Return expression → Scalar value
- Used in **SELECT** clause

```sql
SELECT dbo.GET_BALANCE(102);
