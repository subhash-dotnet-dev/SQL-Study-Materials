-- ============================================================
-- SQL Server — Day 33
-- Topic: DATABASE TRANSACTIONS & SECURITY
-- ============================================================

-- ============================================================
-- 1. CREATE TABLE
-- ============================================================

CREATE TABLE A
(
    A INT
);

-- Check table data
SELECT *
FROM A;


-- ============================================================
-- 2. BEGIN TRANSACTION + ROLLBACK
-- ============================================================

BEGIN TRANSACTION;

INSERT INTO A VALUES (10);
INSERT INTO A VALUES (20);
INSERT INTO A VALUES (30);

SELECT *
FROM A;

ROLLBACK;

-- Changes are cancelled
SELECT *
FROM A;


-- ============================================================
-- 3. BEGIN TRANSACTION + COMMIT
-- ============================================================

BEGIN TRANSACTION;

INSERT INTO A VALUES (10);
INSERT INTO A VALUES (20);

SELECT *
FROM A;

COMMIT;

-- Changes are saved
SELECT *
FROM A;


-- ============================================================
-- 4. MULTIPLE TRANSACTIONS
-- ============================================================

BEGIN TRANSACTION;

INSERT INTO A VALUES (30);
INSERT INTO A VALUES (40);

COMMIT;


BEGIN TRANSACTION;

INSERT INTO A VALUES (50);
INSERT INTO A VALUES (60);

ROLLBACK;


-- Final result
SELECT *
FROM A;


-- ============================================================
-- 5. SAVE TRANSACTION
-- ============================================================

TRUNCATE TABLE A;

BEGIN TRANSACTION;

INSERT INTO A VALUES (10);
INSERT INTO A VALUES (20);

SAVE TRANSACTION ST1;

INSERT INTO A VALUES (30);
INSERT INTO A VALUES (40);

SAVE TRANSACTION ST2;

INSERT INTO A VALUES (50);
INSERT INTO A VALUES (60);

SELECT *
FROM A;


-- Rollback up to ST1
ROLLBACK TRANSACTION ST1;

SELECT *
FROM A;

-- Expected remaining rows:
-- 10
-- 20


-- ============================================================
-- 6. SAVE TRANSACTION — ANOTHER EXAMPLE
-- ============================================================

TRUNCATE TABLE A;

BEGIN TRANSACTION;

INSERT INTO A VALUES (100);
INSERT INTO A VALUES (200);

SAVE TRANSACTION S1;

INSERT INTO A VALUES (300);
INSERT INTO A VALUES (400);

SELECT *
FROM A;

ROLLBACK TRANSACTION S1;

SELECT *
FROM A;

COMMIT;


-- ============================================================
-- 7. MONEY TRANSFER — TRANSACTION EXAMPLE
-- ============================================================

CREATE TABLE Accounts
(
    AccountNo INT PRIMARY KEY,
    AccountName VARCHAR(50),
    Balance INT
);

INSERT INTO Accounts
VALUES
(101, 'Account A', 5000),
(102, 'Account B', 2000);

SELECT *
FROM Accounts;


-- Transfer ₹1000 from Account A to Account B

BEGIN TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 1000
WHERE AccountNo = 101;

UPDATE Accounts
SET Balance = Balance + 1000
WHERE AccountNo = 102;

COMMIT;

SELECT *
FROM Accounts;


-- ============================================================
-- 8. MONEY TRANSFER — ROLLBACK EXAMPLE
-- ============================================================

BEGIN TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 1000
WHERE AccountNo = 101;

-- Suppose the second operation fails
-- UPDATE Accounts
-- SET Balance = Balance + 1000
-- WHERE AccountNo = 102;

ROLLBACK;

SELECT *
FROM Accounts;


-- ============================================================
-- 9. TRANSACTION STATUS CHECK
-- ============================================================

SELECT @@TRANCOUNT AS ActiveTransactions;


-- ============================================================
-- 10. COMMIT vs ROLLBACK PRACTICE
-- ============================================================

BEGIN TRANSACTION;

INSERT INTO A VALUES (700);
INSERT INTO A VALUES (800);

-- Save changes
COMMIT;


BEGIN TRANSACTION;

INSERT INTO A VALUES (900);
INSERT INTO A VALUES (1000);

-- Cancel changes
ROLLBACK;


SELECT *
FROM A;


-- ============================================================
-- 11. DATABASE SECURITY — CONCEPTUAL COMMANDS
-- ============================================================

-- LOGIN = SERVER LEVEL
-- USER = DATABASE LEVEL
-- PRIVILEGE = TABLE LEVEL
-- VIEW = ROW & COLUMN LEVEL


-- ============================================================
-- 12. CREATE LOGIN
-- ============================================================

-- Example only
-- Run with appropriate server-level permissions.

-- CREATE LOGIN Naresh
-- WITH PASSWORD = 'YourStrongPasswordHere';


-- ============================================================
-- 13. CREATE DATABASE USER
-- ============================================================

-- Example only
-- Run inside the target database.

-- CREATE USER Vijay
-- FOR LOGIN Naresh;


-- ============================================================
-- 14. GRANT TABLE PRIVILEGES
-- ============================================================

-- Example only.

-- GRANT SELECT
-- ON dbo.A
-- TO Vijay;

-- GRANT INSERT
-- ON dbo.A
-- TO Vijay;

-- GRANT UPDATE
-- ON dbo.A
-- TO Vijay;

-- GRANT DELETE
-- ON dbo.A
-- TO Vijay;


-- ============================================================
-- 15. REVOKE PRIVILEGE
-- ============================================================

-- Example only.

-- REVOKE INSERT
-- ON dbo.A
-- FROM Vijay;


-- ============================================================
-- 16. DENY PRIVILEGE
-- ============================================================

-- Example only.

-- DENY DELETE
-- ON dbo.A
-- TO Vijay;


-- ============================================================
-- 17. VIEW — SELECTED COLUMNS
-- ============================================================

CREATE VIEW Account_View
AS
SELECT AccountNo,
       AccountName
FROM Accounts;

SELECT *
FROM Account_View;


-- ============================================================
-- 18. VIEW — SELECTED ROWS
-- ============================================================

CREATE VIEW High_Balance_Accounts
AS
SELECT AccountNo,
       AccountName,
       Balance
FROM Accounts
WHERE Balance >= 3000;

SELECT *
FROM High_Balance_Accounts;


-- ============================================================
-- 19. FINAL SECURITY STRUCTURE
-- ============================================================

/*
SERVER
   |
   +-- LOGIN
         |
         v
DATABASE
   |
   +-- USER
         |
         v
TABLE
   |
   +-- PRIVILEGES
         |
         v
ROWS & COLUMNS
   |
   +-- VIEW
*/


-- ============================================================
-- 20. DAY 33 QUICK REVISION
-- ============================================================

/*
TRANSACTION
    -> UNIT OF WORK

ATOMICITY
    -> ALL OR NONE

COMMIT
    -> SAVE TRANSACTION

ROLLBACK
    -> CANCEL TRANSACTION

SAVE TRANSACTION
    -> PARTIAL ROLLBACK

LOGIN
    -> SERVER LEVEL

USER
    -> DATABASE LEVEL

PRIVILEGE
    -> TABLE LEVEL

VIEW
    -> ROW & COLUMN LEVEL
*/
