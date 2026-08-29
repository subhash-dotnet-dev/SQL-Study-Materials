-- ============================================================
-- SQL SERVER — DAY 49
-- TOPIC: DYNAMIC SQL, BACKUP & RESTORE
-- ============================================================

-- ============================================================
-- 1. STATIC SQL vs DYNAMIC SQL
-- ============================================================

-- Static SQL
DROP TABLE emp;

-- Dynamic SQL
DECLARE @tname VARCHAR(30);

SET @tname = 'EMP';

EXEC('DROP TABLE ' + @tname);

-- ============================================================
-- 2. PROCEDURE TO DROP A TABLE USING DYNAMIC SQL
-- ============================================================

CREATE OR ALTER PROCEDURE drop_table
@tname VARCHAR(30)
AS
BEGIN
EXEC('DROP TABLE ' + @tname);
END;
GO

-- Execution
EXECUTE drop_table 'emp_resign';
GO

-- ============================================================
-- 3. PROCEDURE TO DROP ALL TABLES FROM DATABASE
-- ============================================================

CREATE OR ALTER PROCEDURE drop_all_tables
AS
BEGIN
DECLARE C1 CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

```
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
```

END;
GO

-- Execution
-- EXECUTE drop_all_tables;
GO

-- ============================================================
-- 4. DATABASE BACKUP
-- ============================================================

-- Backup a database to a .BAK file

BACKUP DATABASE DB11AM
TO DISK = 'D:\BACKUPS\DB11AM.BAK';
GO

-- ============================================================
-- 5. BACKUP ALL USER DATABASES
-- ============================================================

CREATE OR ALTER PROCEDURE backup_dbs
AS
BEGIN
DECLARE C1 CURSOR FOR
SELECT name
FROM sys.databases
WHERE database_id > 4;

```
DECLARE @dbname VARCHAR(100);
DECLARE @fname VARCHAR(100);

OPEN C1;

FETCH NEXT FROM C1 INTO @dbname;

WHILE (@@FETCH_STATUS = 0)
BEGIN
    SET @fname = 'D:\BACKUPS\' + @dbname + '.bak';

    BACKUP DATABASE @dbname
    TO DISK = @fname;

    FETCH NEXT FROM C1 INTO @dbname;
END;

CLOSE C1;
DEALLOCATE C1;
```

END;
GO

-- Execution
-- EXEC backup_dbs;
GO

-- ============================================================
-- 6. RESTORE DATABASE
-- ============================================================

RESTORE DATABASE DB9AM
FROM DISK = 'D:\BACKUPS\DB9AM.BAK';
GO

-- ============================================================
-- 7. IMPORTANT DATABASE FILE TYPES
-- ============================================================

-- .MDF → Primary Data File
-- .LDF → Transaction Log File
-- .BAK → Database Backup File

-- ============================================================
-- 8. QUICK REFERENCE
-- ============================================================

-- Dynamic SQL → SQL generated at runtime
-- EXEC()       → Executes Dynamic SQL
-- BACKUP       → Creates database backup
-- RESTORE      → Recovers database from backup
-- .BAK         → Backup File
-- .MDF         → Primary Data File
-- .LDF         → Transaction Log File

-- ============================================================
-- DAY 49 COMPLETE
-- ============================================================
