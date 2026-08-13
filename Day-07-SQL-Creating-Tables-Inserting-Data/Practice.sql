
---

## 📄 `Practice.sql`

```sql
-- ==========================================
-- Day 07 - Creating Tables & Inserting Data
-- ==========================================


-- CREATE TABLE

CREATE TABLE EMP
(
    EMPID TINYINT,
    ENAME VARCHAR(10),
    JOB VARCHAR(10),
    SAL SMALLMONEY,
    HIREDATE DATE,
    DEPT VARCHAR(10)
);


-- VIEW TABLE STRUCTURE

sp_help EMP;


-- INSERT SINGLE ROW

INSERT INTO EMP
VALUES
(100, 'Dinesh', 'clerk', 4000, '2025-04-07', 'hr');


INSERT INTO EMP
VALUES
(101, 'Sujeet', 'manager', 8000, GETDATE(), 'it');


-- INSERT MULTIPLE ROWS

INSERT INTO EMP
VALUES
(102, 'Subhash', 'analyst', 6000, '2025-04-07', 'sales'),
(103, 'Aashish', 'clerk', 5000, '2025-04-07', 'it');


-- INSERT NULL VALUES

INSERT INTO EMP
VALUES
(104, 'Subhash', NULL, NULL, '2025-04-07', 'hr');


-- INSERT BY SPECIFYING COLUMNS

INSERT INTO EMP
(EMPID, ENAME, HIREDATE, DEPT)
VALUES
(105, 'Subhash', '2025-04-07', 'sales');
