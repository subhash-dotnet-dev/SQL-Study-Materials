# SQL Server — Day 49 Quick Notes

## 📌 Topic: Dynamic SQL, Backup & Restore

---

## 🔹 Dynamic SQL

Dynamic SQL means **SQL commands generated and executed at runtime**.

### Why Dynamic SQL?

Useful when table names, column names, or other SQL elements are known only at runtime.

```text
Static SQL
→ SQL is fixed

Dynamic SQL
→ SQL is generated at runtime
```

### Execute Dynamic SQL

```sql
EXEC('SELECT * FROM EMP');
```

---

## 🔹 Dynamic Table Name

```sql
DECLARE @tname VARCHAR(30);

SET @tname = 'EMP';

EXEC('DROP TABLE ' + @tname);
```

### Memory Trick

```text
Variable
   ↓
Build SQL String
   ↓
EXEC()
   ↓
Execute at Runtime
```

---

## 🔹 Dynamic SQL Procedure

```sql
CREATE OR ALTER PROCEDURE drop_table
    @tname VARCHAR(30)
AS
BEGIN
    EXEC('DROP TABLE ' + @tname);
END;
```

Execution:

```sql
EXECUTE drop_table 'emp_resign';
```

---

# 🔹 Backup

**Backup** is the process of protecting a database by creating a copy that can be used for recovery.

### Common Backup File

```text
.BAK → Backup File
```

### Take Database Backup

```sql
BACKUP DATABASE DB11AM
TO DISK = 'D:\BACKUPS\DB11AM.BAK';
```

---

# 🔹 Restore

**Restore** means recovering a database from a backup file.

```sql
RESTORE DATABASE DB9AM
FROM DISK = 'D:\BACKUPS\DB9AM.BAK';
```

### Memory Trick

```text
BACKUP
Database → .BAK

RESTORE
.BAK → Database
```

---

# 🔹 SQL Server Database Files

```text
.MDF
→ Primary Data File

.LDF
→ Transaction Log File

.BAK
→ Backup File
```

---

# 🔹 Backup All User Databases

User databases can be identified using:

```sql
SELECT name
FROM sys.databases
WHERE database_id > 4;
```

A cursor can process databases one by one and dynamically generate backup file names.

```text
SYS.DATABASES
      ↓
    CURSOR
      ↓
DATABASE NAME
      ↓
DYNAMIC FILE NAME
      ↓
BACKUP DATABASE
      ↓
   .BAK FILE
```

---

# 🔹 Important Commands

```sql
-- Dynamic SQL
EXEC('SELECT * FROM EMP');

-- Backup
BACKUP DATABASE DB11AM
TO DISK = 'D:\BACKUPS\DB11AM.BAK';

-- Restore
RESTORE DATABASE DB9AM
FROM DISK = 'D:\BACKUPS\DB9AM.BAK';
```

---

# 🧠 Quick Memory

```text
DYNAMIC SQL → Runtime SQL

EXEC() → Execute Dynamic SQL

BACKUP → Database → .BAK

RESTORE → .BAK → Database

.MDF → Primary Data File

.LDF → Transaction Log

.BAK → Backup File
```

---

# 🎯 Interview Revision

```text
STATIC SQL
→ Fixed SQL Command

DYNAMIC SQL
→ Runtime Generated SQL

BACKUP
→ Protect Database

RESTORE
→ Recover Database

EXEC()
→ Execute Dynamic SQL
```

---

## 🚀 Day 49 Learning Flow

```text
T-SQL
  ↓
Dynamic SQL
  ↓
EXEC()
  ↓
Database Backup
  ↓
.BAK
  ↓
Restore
```

**✅ DAY 49 COMPLETE! 🚀**

**LEARN → PRACTICE → DOCUMENT → IMPROVE**
