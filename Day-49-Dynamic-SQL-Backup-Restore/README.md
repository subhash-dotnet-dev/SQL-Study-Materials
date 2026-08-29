<div align="center">

# 🗄️ Day 49 — SQL Server: Dynamic SQL, Backup & Restore

### DYNAMIC SQL • EXEC() • DATABASE BACKUP • RESTORE

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts**  •  **🧠 Interview Preparation**  •  **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 49 focuses on **Dynamic SQL** and **Database Backup & Restore** in SQL Server.

The main concepts covered are:

* Dynamic SQL
* Static SQL vs Dynamic SQL
* Runtime SQL command generation
* `EXEC()`
* Dynamic table names
* Dynamic SQL using Stored Procedures
* Backup
* Restore
* `.BAK` file
* `.MDF` file
* `.LDF` file
* Backup of multiple databases

---

## 🎯 Learning Objectives

By the end of Day 49, the focus was on understanding:

* What is Dynamic SQL?
* Difference between Static and Dynamic SQL
* Why Dynamic SQL is useful
* How to execute Dynamic SQL using `EXEC()`
* How to create a procedure for dynamic table operations
* How to process multiple databases using a Cursor
* What is Database Backup?
* What is Database Restore?
* SQL Server database file types
* How to take database backup
* How to restore a database
* How to automate backups for user databases

---

# 🧩 Dynamic SQL

Dynamic SQL refers to **SQL commands generated and executed at runtime**.

It is useful when table names, column names, or other SQL elements are not known until runtime.

### Static SQL

```sql
DROP TABLE EMP;
```

The table name is fixed.

### Dynamic SQL

```sql
DECLARE @tname VARCHAR(30);

SET @tname = 'EMP';

EXEC('DROP TABLE ' + @tname);
```

Here, the SQL command is constructed dynamically at runtime.

---

# 🔹 EXEC()

`EXEC()` can be used to execute a dynamically generated SQL command.

```sql
EXEC('SELECT * FROM EMP');
```

### Dynamic SQL Flow

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

# 🛠️ Dynamic SQL Procedure

A procedure can accept a table name and execute a dynamic SQL command.

```sql
CREATE OR ALTER PROCEDURE drop_table
    @tname VARCHAR(30)
AS
BEGIN
    EXEC('DROP TABLE ' + @tname);
END;
```

### Execution

```sql
EXECUTE drop_table 'emp_resign';
```

---

# 🔄 Dropping All Tables Dynamically

A Cursor can be used to retrieve table names from `INFORMATION_SCHEMA.TABLES`.

```sql
CREATE OR ALTER PROCEDURE drop_all_tables
AS
BEGIN
    DECLARE C1 CURSOR FOR
        SELECT TABLE_NAME
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_TYPE = 'BASE TABLE';

    DECLARE @TNAME VARCHAR(30);

    OPEN C1;

    FETCH NEXT FROM C1 INTO @TNAME;

    WHILE (@@FETCH_STATUS = 0)
    BEGIN
        EXEC('DROP TABLE ' + @TNAME);

        FETCH NEXT FROM C1 INTO @TNAME;
    END;

    CLOSE C1;
    DEALLOCATE C1;
END;
```

---

# 💾 Database Backup

**Backup** is the process of creating a copy of a database so it can be recovered after a failure or data-loss situation.

### Common Backup File

```text
.BAK → Backup File
```

### Backup Command

```sql
BACKUP DATABASE DB11AM
TO DISK = 'D:\BACKUPS\DB11AM.BAK';
```

### Backup Flow

```text
DATABASE
    ↓
BACKUP DATABASE
    ↓
.BAK FILE
```

---

# ♻️ Database Restore

**Restore** is the process of recovering a database from a backup file.

### Restore Command

```sql
RESTORE DATABASE DB9AM
FROM DISK = 'D:\BACKUPS\DB9AM.BAK';
```

### Restore Flow

```text
.BAK FILE
    ↓
RESTORE DATABASE
    ↓
DATABASE RECOVERED
```

---

# 📁 SQL Server Database Files

| Extension | Purpose              |
| --------- | -------------------- |
| `.MDF`    | Primary Data File    |
| `.LDF`    | Transaction Log File |
| `.BAK`    | Backup File          |

---

# 🔁 Backup All User Databases

User databases can be identified using `sys.databases`.

```sql
SELECT name
FROM sys.databases
WHERE database_id > 4;
```

A Cursor can process each database and dynamically generate the backup file name.

### Flow

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

# 🧠 Important Concepts

### Dynamic SQL

```text
SQL generated at runtime
```

### EXEC()

```text
Executes Dynamic SQL
```

### Backup

```text
Database → .BAK
```

### Restore

```text
.BAK → Database
```

### File Types

```text
.MDF → Primary Data File
.LDF → Transaction Log File
.BAK → Backup File
```

---

# 📚 Commands Practiced

```sql
-- Dynamic SQL
EXEC('SELECT * FROM EMP');

-- Backup
BACKUP DATABASE DB11AM
TO DISK = 'D:\BACKUPS\DB11AM.BAK';

-- Restore
RESTORE DATABASE DB9AM
FROM DISK = 'D:\BACKUPS\DB9AM.BAK';

-- List Databases
SELECT name
FROM sys.databases
WHERE database_id > 4;
```

---

# 🎯 Interview Quick Revision

```text
STATIC SQL
→ Fixed SQL Command

DYNAMIC SQL
→ Runtime Generated SQL

EXEC()
→ Execute Dynamic SQL

BACKUP
→ Protect Database

RESTORE
→ Recover Database

.BAK
→ Backup File

.MDF
→ Primary Data File

.LDF
→ Transaction Log File
```

---

# 🚀 Day 49 Learning Flow

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

---

## 📂 Day 49 Files

```text
Day-49-Dynamic-SQL-Backup-Restore/
│
├── README.md
├── Quick-Notes.md
├── Interview-Questions.md
└── SQL-Queries.sql
```

---

## 🏆 Key Takeaway

Dynamic SQL helps execute SQL commands that are generated at runtime, while Backup and Restore provide essential database protection and recovery capabilities.

---

<div align="center">

### ✅ DAY 49 COMPLETE! 🚀

**LEARN → PRACTICE → DOCUMENT → IMPROVE**

**SUBHASH YADAV**
**.NET FULL STACK DEVELOPER**
**LEARNING IN PUBLIC**

</div>
