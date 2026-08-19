/* ============================================================
   SQL LEARNING JOURNEY
   DAY 22 — FOREIGN KEY, DEFAULT & TABLE-LEVEL CONSTRAINTS
   ============================================================

   Topics:
   1. Foreign Key
   2. Parent / Child Relationship
   3. DEFAULT Constraint
   4. Relationship Types
   5. Many-to-Many Relationship
   6. Composite Primary Key
   7. Composite Foreign Key
   8. Table-Level Constraints
   9. ALTER TABLE
   10. WITH NOCHECK
   11. Adding Constraints
   12. Dropping Constraints
   13. Constraint Dependencies
   ============================================================ */


/* ============================================================
   1. FOREIGN KEY — PARENT TABLE
   ============================================================ */

CREATE TABLE Projects
(
    ProjID INT PRIMARY KEY,
    PName VARCHAR(20) NOT NULL,
    Client VARCHAR(50) NOT NULL
);

INSERT INTO Projects
VALUES
(1000, 'ABC', 'TATA MOTORS'),
(1001, 'KLM', 'L&T');

SELECT *
FROM Projects;


/* ============================================================
   2. FOREIGN KEY — CHILD TABLE
   ============================================================ */

CREATE TABLE Emp_Proj
(
    EmpNo INT PRIMARY KEY,
    EName VARCHAR(20) NOT NULL,
    Sal MONEY CHECK (Sal >= 3000),
    ProjID INT REFERENCES Projects(ProjID)
);

INSERT INTO Emp_Proj
VALUES
(100, 'A', 4000, 1000),
(101, 'B', 3000, 1001),
(102, 'C', 5000, 1000);

SELECT *
FROM Emp_Proj;


/* ============================================================
   3. FOREIGN KEY — INVALID VALUE
   ============================================================ */

-- This will give an error because 9999
-- does not exist in Projects.ProjID.

-- INSERT INTO Emp_Proj
-- VALUES (103, 'D', 3500, 9999);


/* ============================================================
   4. FOREIGN KEY — DUPLICATE VALUES
   ============================================================ */

-- Foreign Key allows duplicate values.

INSERT INTO Emp_Proj
VALUES
(103, 'D', 4500, 1000);

SELECT *
FROM Emp_Proj;


/* ============================================================
   5. FOREIGN KEY — NULL VALUE
   ============================================================ */

-- Foreign Key allows NULL unless NOT NULL is specified.

INSERT INTO Emp_Proj
VALUES
(104, 'E', 4000, NULL);

SELECT *
FROM Emp_Proj;


/* ============================================================
   6. EXPLICIT FOREIGN KEY CONSTRAINT
   ============================================================ */

CREATE TABLE Departments
(
    DeptNo INT PRIMARY KEY,
    DName VARCHAR(30) NOT NULL
);

INSERT INTO Departments
VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'SALES');


CREATE TABLE Employees
(
    EmpNo INT PRIMARY KEY,
    EName VARCHAR(30) NOT NULL,
    Sal MONEY,
    DeptNo INT,

    CONSTRAINT FK_Employees_Departments
    FOREIGN KEY (DeptNo)
    REFERENCES Departments(DeptNo)
);

INSERT INTO Employees
VALUES
(1, 'Subhash', 40000, 20),
(2, 'Amit', 35000, 10),
(3, 'Rahul', 30000, 20),
(4, 'Pooja', 45000, 30);

SELECT *
FROM Employees;


/* ============================================================
   7. DEFAULT CONSTRAINT
   ============================================================ */

CREATE TABLE Emp_Default
(
    EmpNo INT,
    EName VARCHAR(20),
    HireDate DATE DEFAULT GETDATE()
);

-- HireDate skipped → DEFAULT value will be inserted.

INSERT INTO Emp_Default(EmpNo, EName)
VALUES
(100, 'A');


-- Explicit date

INSERT INTO Emp_Default
VALUES
(101, 'B', '2024-01-01');


-- Explicit NULL is allowed if column allows NULL.

INSERT INTO Emp_Default
VALUES
(102, 'C', NULL);

SELECT *
FROM Emp_Default;


/* ============================================================
   8. RELATIONSHIP — ONE TO MANY
   ============================================================ */

-- One project can have many employees.

SELECT
    P.ProjID,
    P.PName,
    E.EmpNo,
    E.EName
FROM Projects P
INNER JOIN Emp_Proj E
    ON P.ProjID = E.ProjID;


/* ============================================================
   9. ONE TO ONE RELATIONSHIP
   ============================================================ */

CREATE TABLE Project_One
(
    ProjID INT PRIMARY KEY,
    PName VARCHAR(30),
    Cost MONEY
);

INSERT INTO Project_One
VALUES
(1000, 'Project A', 500000),
(1001, 'Project B', 700000);


CREATE TABLE Manager_One
(
    MgrNo INT PRIMARY KEY,
    MName VARCHAR(30),
    ProjID INT UNIQUE,

    FOREIGN KEY (ProjID)
    REFERENCES Project_One(ProjID)
);

INSERT INTO Manager_One
VALUES
(101, 'Manager A', 1000),
(102, 'Manager B', 1001);

SELECT *
FROM Manager_One;


/* ============================================================
   10. MANY TO MANY — STUDENT & COURSE
   ============================================================ */

CREATE TABLE Student
(
    SID INT PRIMARY KEY,
    SName VARCHAR(30) NOT NULL
);

INSERT INTO Student
VALUES
(1, 'Subhash'),
(2, 'Amit');


CREATE TABLE Course
(
    CID INT PRIMARY KEY,
    CName VARCHAR(30) NOT NULL
);

INSERT INTO Course
VALUES
(10, '.NET'),
(11, 'SQL Server');


/* ============================================================
   11. JUNCTION TABLE
   ============================================================ */

CREATE TABLE Registrations
(
    SID INT,
    CID INT,
    DOR DATE,
    Fee MONEY,

    PRIMARY KEY (SID, CID),

    FOREIGN KEY (SID)
    REFERENCES Student(SID),

    FOREIGN KEY (CID)
    REFERENCES Course(CID)
);

INSERT INTO Registrations
VALUES
(1, 10, GETDATE(), 5000),
(1, 11, GETDATE(), 5000),
(2, 10, GETDATE(), 5000);

SELECT *
FROM Registrations;


/* ============================================================
   12. COMPOSITE PRIMARY KEY — DUPLICATE TEST
   ============================================================ */

-- The combination SID + CID must be unique.

-- This will give an error.

-- INSERT INTO Registrations
-- VALUES (1, 10, GETDATE(), 5000);


/* ============================================================
   13. COMPOSITE FOREIGN KEY
   ============================================================ */

CREATE TABLE Certificates
(
    CertNo INT PRIMARY KEY,
    DOI DATE,
    SID INT,
    CID INT,

    FOREIGN KEY (SID, CID)
    REFERENCES Registrations(SID, CID)
);

INSERT INTO Certificates
VALUES
(1000, GETDATE(), 1, 10);

-- Valid combination.

SELECT *
FROM Certificates;


/* ============================================================
   14. COMPOSITE FOREIGN KEY — INVALID TEST
   ============================================================ */

-- (2,11) does not exist in Registrations.
-- Therefore this will fail.

-- INSERT INTO Certificates
-- VALUES (1001, GETDATE(), 2, 11);


/* ============================================================
   15. TABLE-LEVEL CHECK CONSTRAINT
   ============================================================ */

CREATE TABLE Products
(
    ProdID INT PRIMARY KEY,
    PName VARCHAR(30) NOT NULL,
    MFD_DT DATE,
    EXP_DT DATE,

    CHECK (EXP_DT > MFD_DT)
);

-- Valid record

INSERT INTO Products
VALUES
(100, 'Product A', '2025-01-01', '2025-12-31');

-- Invalid record
-- EXP_DT is before MFD_DT.

-- INSERT INTO Products
-- VALUES (101, 'Product B', '2025-02-01', '2025-01-01');

SELECT *
FROM Products;


/* ============================================================
   16. ALTER TABLE — ADD PRIMARY KEY
   ============================================================ */

CREATE TABLE Emp77
(
    EmpNo INT,
    EName VARCHAR(30),
    Sal MONEY,
    EmailID VARCHAR(50),
    DNo INT
);

-- Step 1: Change column to NOT NULL

ALTER TABLE Emp77
ALTER COLUMN EmpNo INT NOT NULL;


-- Step 2: Add Primary Key

ALTER TABLE Emp77
ADD PRIMARY KEY (EmpNo);


/* ============================================================
   17. ALTER TABLE — ADD CHECK
   ============================================================ */

ALTER TABLE Emp77
ADD CHECK (Sal >= 3000);


/* ============================================================
   18. ALTER TABLE — ADD UNIQUE
   ============================================================ */

ALTER TABLE Emp77
ADD UNIQUE (EmailID);


/* ============================================================
   19. ALTER TABLE — ADD FOREIGN KEY
   ============================================================ */

ALTER TABLE Emp77
ADD FOREIGN KEY (DNo)
REFERENCES Departments(DeptNo);


/* ============================================================
   20. ALTER TABLE — MODIFY COLUMN
   ============================================================ */

ALTER TABLE Emp77
ALTER COLUMN EName VARCHAR(30) NOT NULL;


/* ============================================================
   21. WITH NOCHECK
   ============================================================ */

CREATE TABLE Salary_Test
(
    EmpNo INT,
    EName VARCHAR(30),
    Sal MONEY
);

INSERT INTO Salary_Test
VALUES
(1, 'A', 2000),
(2, 'B', 4000),
(3, 'C', 5000);


/*
    Existing data contains salary 2000.

    WITH NOCHECK does not validate existing rows.
*/

ALTER TABLE Salary_Test
WITH NOCHECK
ADD CHECK (Sal >= 3000);

SELECT *
FROM Salary_Test;


/* ============================================================
   22. DROPPING CONSTRAINT
   ============================================================ */

CREATE TABLE Drop_Test
(
    ID INT,
    Name VARCHAR(30),
    Sal MONEY,

    CONSTRAINT CK_Drop_Test_Sal
    CHECK (Sal >= 3000)
);

-- Drop CHECK constraint

ALTER TABLE Drop_Test
DROP CONSTRAINT CK_Drop_Test_Sal;


/* ============================================================
   23. NAMED FOREIGN KEY
   ============================================================ */

CREATE TABLE Parent_Test
(
    ID INT PRIMARY KEY
);

CREATE TABLE Child_Test
(
    ID INT PRIMARY KEY,
    ParentID INT,

    CONSTRAINT FK_Child_Parent
    FOREIGN KEY (ParentID)
    REFERENCES Parent_Test(ID)
);


/* ============================================================
   24. FOREIGN KEY DEPENDENCY
   ============================================================ */

INSERT INTO Parent_Test
VALUES
(1),
(2);

INSERT INTO Child_Test
VALUES
(101, 1),
(102, 2);

SELECT *
FROM Parent_Test;

SELECT *
FROM Child_Test;


/*
    Parent table cannot normally be dropped
    while it is referenced by a Foreign Key.

    DROP TABLE Parent_Test;
*/


/*
    Parent table cannot normally be truncated
    while it is referenced by a Foreign Key.

    TRUNCATE TABLE Parent_Test;
*/


/* ============================================================
   25. DROP FOREIGN KEY FIRST
   ============================================================ */

ALTER TABLE Child_Test
DROP CONSTRAINT FK_Child_Parent;


/* Now the parent table can be dropped if no
   other dependency exists. */

DROP TABLE Child_Test;

DROP TABLE Parent_Test;


/* ============================================================
   26. COMPLETE ACCOUNT TABLE PRACTICE
   ============================================================ */

CREATE TABLE Accounts
(
    AccNo INT PRIMARY KEY,

    AcType CHAR(1)
        CHECK (AcType IN ('S', 'C')),

    Bal MONEY
        CHECK (Bal >= 1000),

    Open_DT DATE
        DEFAULT GETDATE() NOT NULL
);

INSERT INTO Accounts
(
    AccNo,
    AcType,
    Bal
)
VALUES
(1001, 'S', 5000),
(1002, 'C', 10000);

SELECT *
FROM Accounts;


/* ============================================================
   27. TRANSACTIONS TABLE
   ============================================================ */

CREATE TABLE Transactions
(
    TrID INT IDENTITY(1,1) PRIMARY KEY,

    TType CHAR(1)
        CHECK (TType IN ('W', 'D')),

    TDate DATE
        DEFAULT GETDATE() NOT NULL,

    TAmt DECIMAL(10,2)
        CHECK (TAmt % 100 = 0),

    AccNo INT NOT NULL,

    CONSTRAINT FK_Transactions_Accounts
    FOREIGN KEY (AccNo)
    REFERENCES Accounts(AccNo)
);

INSERT INTO Transactions
(
    TType,
    TAmt,
    AccNo
)
VALUES
('D', 1000, 1001),
('W', 500, 1001),
('D', 2000, 1002);

SELECT *
FROM Transactions;


/* ============================================================
   28. INVALID TRANSACTION TESTS
   ============================================================ */

-- Invalid TType

-- INSERT INTO Transactions(TType, TAmt, AccNo)
-- VALUES ('X', 1000, 1001);


-- Invalid amount

-- INSERT INTO Transactions(TType, TAmt, AccNo)
-- VALUES ('D', 1250, 1001);


-- Invalid Account Number

-- INSERT INTO Transactions(TType, TAmt, AccNo)
-- VALUES ('D', 1000, 9999);


/* ============================================================
   29. FINAL REVISION — RELATIONSHIP SUMMARY
   ============================================================ */

/*
    1:1
    → One-to-One
    → FK can be UNIQUE

    1:M
    → One-to-Many
    → FK on many-side

    M:1
    → Many-to-One

    M:N
    → Many-to-Many
    → Third/Junction table required

    Composite PK
    → PRIMARY KEY (SID, CID)

    Composite FK
    → FOREIGN KEY (SID, CID)
      REFERENCES Registrations(SID, CID)
*/


/* ============================================================
   DAY 22 PRACTICE COMPLETE
   ============================================================ */
