/*
===========================================================
SQL LEARNING JOURNEY
DAY 21 — INTEGRITY CONSTRAINTS
===========================================================

Topics:
1. NOT NULL
2. UNIQUE
3. PRIMARY KEY
4. CHECK
5. Column-level Constraints
6. Table-level Constraints
7. Candidate Key
8. Alternate / Secondary Key
9. Data Integrity
10. Data Validation
===========================================================
*/


/* =========================================================
   1. NOT NULL CONSTRAINT
   ========================================================= */

/*
Question:
Create an employee table where ENAME is mandatory.
*/

CREATE TABLE EMP11
(
    EMPNO INT,
    ENAME VARCHAR(10) NOT NULL
);

-- Valid
INSERT INTO EMP11
VALUES (100, 'A');

-- Invalid: ENAME cannot be NULL
INSERT INTO EMP11
VALUES (101, NULL);

SELECT *
FROM EMP11;


/* =========================================================
   2. UNIQUE CONSTRAINT
   ========================================================= */

/*
Question:
Create an employee table where EMAILID cannot contain
duplicate values.
*/

CREATE TABLE EMP12
(
    EMPNO INT,
    ENAME VARCHAR(10) NOT NULL,
    EMAILID VARCHAR(50) UNIQUE
);

-- Valid
INSERT INTO EMP12
VALUES (100, 'A', 'a@gmail.com');

-- Invalid: Duplicate email
INSERT INTO EMP12
VALUES (101, 'B', 'a@gmail.com');

-- One NULL is allowed
INSERT INTO EMP12
VALUES (102, 'C', NULL);

SELECT *
FROM EMP12;


/* =========================================================
   3. UNIQUE INDEX FOR MULTIPLE NULL VALUES
   ========================================================= */

/*
Question:
Allow multiple NULL values in EMAILID while preventing
duplicate non-NULL email IDs.
*/

CREATE TABLE CUST
(
    CUSTID INT,
    CNAME VARCHAR(20) NOT NULL,
    EMAILID VARCHAR(50)
);

CREATE UNIQUE INDEX IND10
ON CUST(EMAILID)
WHERE EMAILID IS NOT NULL;

INSERT INTO CUST
VALUES (1, 'A', 'a@gmail.com');

-- Invalid: duplicate non-NULL email
INSERT INTO CUST
VALUES (2, 'B', 'a@gmail.com');

-- Multiple NULL values are allowed
INSERT INTO CUST
VALUES (3, 'C', NULL);

INSERT INTO CUST
VALUES (4, 'D', NULL);

SELECT *
FROM CUST;


/* =========================================================
   4. PRIMARY KEY CONSTRAINT
   ========================================================= */

/*
Question:
Create an employee table where EMPNO uniquely identifies
each employee.
*/

CREATE TABLE EMP13
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20) NOT NULL,
    SAL MONEY
);

-- Valid
INSERT INTO EMP13
VALUES (100, 'A', 5000);

-- Invalid: Duplicate primary key
INSERT INTO EMP13
VALUES (100, 'B', 6000);

-- Invalid: Primary key cannot be NULL
INSERT INTO EMP13
VALUES (NULL, 'C', 6000);

SELECT *
FROM EMP13;


/* =========================================================
   5. PRIMARY KEY + UNIQUE NOT NULL
   ========================================================= */

/*
Question:
Create a customer table with:
CUSTID as Primary Key
AADHAARNO as Alternate/Secondary Key
PANNO as Alternate/Secondary Key
*/

CREATE TABLE CUSTOMER21
(
    CUSTID INT PRIMARY KEY,
    CNAME VARCHAR(20) NOT NULL,
    AADHAARNO VARCHAR(12) UNIQUE NOT NULL,
    PANNO VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO CUSTOMER21
VALUES
(
    1,
    'Subhash',
    '123456789012',
    'ABCDE1234F'
);

SELECT *
FROM CUSTOMER21;


/* =========================================================
   6. CHECK CONSTRAINT — MINIMUM SALARY
   ========================================================= */

/*
Question:
Salary must be at least 3000.
*/

CREATE TABLE EMP14
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20) NOT NULL,
    SAL MONEY CHECK (SAL >= 3000)
);

-- Invalid
INSERT INTO EMP14
VALUES (100, 'A', 1000);

-- Valid
INSERT INTO EMP14
VALUES (101, 'B', 5000);

-- NULL is allowed by CHECK alone
INSERT INTO EMP14
VALUES (102, 'C', NULL);

SELECT *
FROM EMP14;


/* =========================================================
   7. CHECK — GENDER VALIDATION
   ========================================================= */

/*
Question:
Gender must be M or F.
*/

CREATE TABLE PERSON21
(
    PERSONID INT PRIMARY KEY,
    NAME VARCHAR(30) NOT NULL,
    GENDER CHAR(1)
        CHECK (GENDER IN ('M', 'F'))
);

-- Valid
INSERT INTO PERSON21
VALUES (1, 'Amit', 'M');

INSERT INTO PERSON21
VALUES (2, 'Sita', 'F');

-- Invalid
INSERT INTO PERSON21
VALUES (3, 'Rahul', 'X');

SELECT *
FROM PERSON21;


/* =========================================================
   8. CHECK — AMOUNT MUST BE MULTIPLE OF 100
   ========================================================= */

/*
Question:
Amount must be a multiple of 100.
*/

CREATE TABLE PAYMENT21
(
    PAYMENTID INT PRIMARY KEY,
    AMOUNT MONEY CHECK (AMOUNT % 100 = 0)
);

-- Valid
INSERT INTO PAYMENT21
VALUES (1, 1000);

INSERT INTO PAYMENT21
VALUES (2, 2500);

-- Invalid
INSERT INTO PAYMENT21
VALUES (3, 2550);

SELECT *
FROM PAYMENT21;


/* =========================================================
   9. CHECK — PASSWORD LENGTH
   ========================================================= */

/*
Question:
Password must contain at least 6 characters.
*/

CREATE TABLE USER21
(
    USERID INT PRIMARY KEY,
    USERNAME VARCHAR(30) NOT NULL,
    PWD VARCHAR(15)
        CHECK (LEN(PWD) >= 6)
);

-- Valid
INSERT INTO USER21
VALUES (1, 'Subhash', 'abc123');

-- Invalid
INSERT INTO USER21
VALUES (2, 'User2', 'abc');

SELECT *
FROM USER21;


/* =========================================================
   10. CHECK — BASIC EMAIL VALIDATION
   ========================================================= */

/*
Question:
Email must contain @ and end with .com, .co, or .in.
*/

CREATE TABLE EMAIL21
(
    ID INT PRIMARY KEY,
    EMAILID VARCHAR(50)
        CHECK
        (
            EMAILID LIKE '%@%'
            AND
            (
                EMAILID LIKE '%.com'
                OR EMAILID LIKE '%.co'
                OR EMAILID LIKE '%.in'
            )
        )
);

-- Valid
INSERT INTO EMAIL21
VALUES (1, 'subhash@gmail.com');

INSERT INTO EMAIL21
VALUES (2, 'user@yahoo.in');

-- Invalid
INSERT INTO EMAIL21
VALUES (3, 'invalid-email');

SELECT *
FROM EMAIL21;


/* =========================================================
   11. COLUMN-LEVEL CONSTRAINTS
   ========================================================= */

/*
Question:
Create a table using column-level constraints.
*/

CREATE TABLE EMP_COLUMN_LEVEL
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(30) NOT NULL,
    EMAILID VARCHAR(50) UNIQUE,
    SAL MONEY CHECK (SAL >= 3000)
);

INSERT INTO EMP_COLUMN_LEVEL
VALUES
(
    1,
    'Subhash',
    'subhash@gmail.com',
    5000
);

SELECT *
FROM EMP_COLUMN_LEVEL;


/* =========================================================
   12. TABLE-LEVEL CONSTRAINTS
   ========================================================= */

/*
Question:
Create constraints separately at table level.
*/

CREATE TABLE EMP_TABLE_LEVEL
(
    EMPNO INT,
    ENAME VARCHAR(30),
    EMAILID VARCHAR(50),
    SAL MONEY,

    CONSTRAINT PK_EMP_TABLE_LEVEL
        PRIMARY KEY (EMPNO),

    CONSTRAINT UQ_EMP_EMAIL
        UNIQUE (EMAILID),

    CONSTRAINT CK_EMP_SAL
        CHECK (SAL >= 3000),

    CONSTRAINT NN_EMP_NAME
        CHECK (ENAME IS NOT NULL)
);

INSERT INTO EMP_TABLE_LEVEL
VALUES
(
    1,
    'Subhash',
    'subhash@gmail.com',
    5000
);

SELECT *
FROM EMP_TABLE_LEVEL;


/* =========================================================
   13. CANDIDATE KEY PRACTICE
   ========================================================= */

/*
VEHICLE TABLE

Possible Candidate Keys:
    VEHNO
    CHASSISNO

Select VEHNO as Primary Key.
Keep CHASSISNO as Alternate Key.
*/

CREATE TABLE VEHICLE21
(
    VEHNO VARCHAR(20) PRIMARY KEY,
    VNAME VARCHAR(30) NOT NULL,
    MODEL VARCHAR(30),
    COST MONEY,
    CHASSISNO VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO VEHICLE21
VALUES
(
    'JH01AB1234',
    'Car',
    'Model-X',
    750000,
    'CHS10001'
);

SELECT *
FROM VEHICLE21;


/* =========================================================
   14. DATA INTEGRITY TEST
   ========================================================= */

/*
Try different invalid values and observe how constraints
protect the database.
*/

-- Duplicate Primary Key
INSERT INTO VEHICLE21
VALUES
(
    'JH01AB1234',
    'Bike',
    'Model-Y',
    100000,
    'CHS10002'
);

-- Duplicate Alternate Key
INSERT INTO VEHICLE21
VALUES
(
    'JH02CD5678',
    'Car',
    'Model-Z',
    800000,
    'CHS10001'
);

-- NULL Primary Key
INSERT INTO VEHICLE21
VALUES
(
    NULL,
    'Car',
    'Model-A',
    900000,
    'CHS10003'
);


/* =========================================================
   15. COMBINED CONSTRAINT PRACTICE
   ========================================================= */

/*
Create a Customer table satisfying all requirements:

1. CUSTOMERID → Primary Key
2. CUSTOMERNAME → Mandatory
3. EMAILID → Unique
4. AGE → Must be >= 18
5. GENDER → M or F
*/

CREATE TABLE CUSTOMER_PRACTICE21
(
    CUSTOMERID INT PRIMARY KEY,

    CUSTOMERNAME VARCHAR(50) NOT NULL,

    EMAILID VARCHAR(100) UNIQUE,

    AGE INT CHECK (AGE >= 18),

    GENDER CHAR(1)
        CHECK (GENDER IN ('M', 'F'))
);

-- Valid records
INSERT INTO CUSTOMER_PRACTICE21
VALUES
(
    1,
    'Subhash',
    'subhash@gmail.com',
    22,
    'M'
);

INSERT INTO CUSTOMER_PRACTICE21
VALUES
(
    2,
    'Amit',
    'amit@gmail.com',
    25,
    'M'
);

INSERT INTO CUSTOMER_PRACTICE21
VALUES
(
    3,
    'Sita',
    NULL,
    21,
    'F'
);

SELECT *
FROM CUSTOMER_PRACTICE21;


/* =========================================================
   16. FINAL PRACTICE QUESTIONS
   ========================================================= */

/*
Q1. Create a STUDENT table with:
    STUDENTID → Primary Key
    STUDENTNAME → NOT NULL
    EMAIL → UNIQUE
    MARKS → CHECK between 0 and 100
    GENDER → M or F

Q2. Insert valid records.

Q3. Try inserting a duplicate STUDENTID.

Q4. Try inserting NULL into STUDENTNAME.

Q5. Try inserting a duplicate EMAIL.

Q6. Try inserting MARKS greater than 100.

Q7. Try inserting an invalid GENDER.

Q8. Identify possible Candidate Keys in a VEHICLE table.

Q9. Select one Candidate Key as Primary Key.

Q10. Implement the remaining Candidate Key as an
    Alternate/Secondary Key using UNIQUE NOT NULL.
*/


/* =========================================================
   DAY 21 SUMMARY
   =========================================================

   NOT NULL
   → Prevents NULL values

   UNIQUE
   → Prevents duplicate values

   PRIMARY KEY
   → UNIQUE + NOT NULL

   CHECK
   → Condition-based validation

   CANDIDATE KEY
   → Eligible unique identifier

   ALTERNATE KEY
   → Candidate key not selected as Primary Key

   DATA INTEGRITY
   → Maintains valid and consistent data

=========================================================== */
