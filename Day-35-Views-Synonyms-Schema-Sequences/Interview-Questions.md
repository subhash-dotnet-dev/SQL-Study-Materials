# SQL Server – Day 35: Views, Synonyms, Schema & Sequences

## 📚 Interview Questions & Answers

### 1. What is a View?

A View is a virtual table based on a SQL query. It does not store the query result permanently and retrieves data from the underlying base table(s).

**Main uses of Views:**
- Provide security
- Reduce query complexity
- Expose only required data

---

### 2. How do you create a View?

```sql
CREATE VIEW V1
AS
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP;
