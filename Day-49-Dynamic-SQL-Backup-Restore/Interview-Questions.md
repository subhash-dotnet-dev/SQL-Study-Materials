# SQL Server — Day 49 Interview Questions

## Topic: Dynamic SQL, Backup & Restore

---

## 1. What is Dynamic SQL?

**Answer:**

Dynamic SQL refers to SQL commands that are generated and executed at runtime.

---

## 2. When is Dynamic SQL useful?

**Answer:**

Dynamic SQL is useful when table names, column names, or other SQL elements are not known until runtime.

---

## 3. How do you execute Dynamic SQL in SQL Server?

**Answer:**

Dynamic SQL can be executed using the `EXEC()` statement.

```sql
DECLARE @tname VARCHAR(30);

SET @tname = 'EMP';

EXEC('DROP TABLE ' + @tname);
```

---

## 4. What is the difference between Static SQL and Dynamic SQL?

**Answer:**

| Static SQL                        | Dynamic SQL                             |
| --------------------------------- | --------------------------------------- |
| SQL is fixed                      | SQL is generated at runtime             |
| Object names are known beforehand | Object names can be provided at runtime |
| Directly executed                 | Usually executed using `EXEC()`         |

---

## 5. How can you create a procedure to drop a table dynamically?

**Answer:**

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

## 6. What is a Database Backup?

**Answer:**

A database backup is a copy of database data and related information stored in a backup file so the database can be recovered after failures.

---

## 7. What is a Restore?

**Answer:**

Restore is the process of recovering a database from a backup file.

---

## 8. What is the extension of a SQL Server Backup file?

**Answer:**

The commonly used backup file extension is:

```text
.BAK → Backup File
```

---

## 9. What are MDF and LDF files?

**Answer:**

```text
.MDF → Primary Database Data File
.LDF → Transaction Log File
```

---

## 10. How do you take a database backup?

**Answer:**

```sql
BACKUP DATABASE DB11AM
TO DISK = 'D:\BACKUPS\DB11AM.BAK';
```

---

## 11. How do you restore a database?

**Answer:**

```sql
RESTORE DATABASE DB9AM
FROM DISK = 'D:\BACKUPS\DB9AM.BAK';
```

---

## 12. Why is Database Backup important?

**Answer:**

Backup protects the database from failures such as:

* Hardware failure
* Software failure
* Network problems
* Data corruption
* Accidental data loss

---

## 13. How can you get the list of databases in SQL Server?

**Answer:**

```sql
SELECT name
FROM sys.databases;
```

---

## 14. How can you backup multiple databases using a procedure?

**Answer:**

We can retrieve database names from `sys.databases`, use a cursor to process them one by one, generate the backup file name dynamically, and execute `BACKUP DATABASE`.

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

## 15. What is the role of Dynamic SQL in database backup?

**Answer:**

Dynamic SQL can be used to generate database-specific backup file names and execute backup commands for databases whose names are determined at runtime.

---

## 16. What is EXEC()?

**Answer:**

`EXEC()` is used to execute a SQL statement or stored procedure. It can also execute SQL commands constructed dynamically as strings.

Example:

```sql
EXEC('SELECT * FROM EMP');
```

---

## 17. What is the difference between BACKUP and RESTORE?

**Answer:**

| BACKUP                   | RESTORE                |
| ------------------------ | ---------------------- |
| Creates a backup         | Recovers a database    |
| Database → `.BAK`        | `.BAK` → Database      |
| Used for data protection | Used for data recovery |

---

## 18. What are the important commands from Day 49?

**Answer:**

```text
EXEC()       → Execute Dynamic SQL
BACKUP       → Create Database Backup
RESTORE      → Recover Database
.BAK         → Backup File
.MDF         → Primary Data File
.LDF         → Transaction Log File
```

---

## 19. Interview Scenario: How would you dynamically drop a table whose name is provided by the user?

**Answer:**

Accept the table name as a parameter, construct the SQL command dynamically, and execute it using `EXEC()`.

```sql
CREATE OR ALTER PROCEDURE drop_table
    @tname VARCHAR(30)
AS
BEGIN
    EXEC('DROP TABLE ' + @tname);
END;
```

---

## 20. Quick Interview Memory

```text
DYNAMIC SQL → SQL Generated at Runtime

EXEC() → Execute Dynamic SQL

BACKUP → Database → .BAK

RESTORE → .BAK → Database

.MDF → Primary Data File

.LDF → Transaction Log File

.BAK → Backup File
```

---

## 🎯 Interview Tip

Remember this simple flow:

```text
Dynamic SQL
     ↓
Build SQL at Runtime
     ↓
EXEC()
     ↓
Execute Command

Backup
     ↓
Database → .BAK

Restore
     ↓
.BAK → Database
```

**DAY 49 COMPLETE! 🚀**
