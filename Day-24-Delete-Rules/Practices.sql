/*
===========================================================
SQL LEARNING JOURNEY
DAY 24 — FOREIGN KEY DELETE RULES
===========================================================

Topics:
1. ON DELETE NO ACTION
2. ON DELETE CASCADE
3. ON DELETE SET NULL
4. ON DELETE SET DEFAULT
5. Parent / Child Relationship
6. Practical DELETE Rule Scenarios

Database: SQL Server
===========================================================
*/


/*
===========================================================
1. ON DELETE NO ACTION
===========================================================

Default behavior.

If child records exist, parent record cannot be deleted.
===========================================================
*/

CREATE TABLE DEPT_NO_ACTION
(
    DNO INT PRIMARY KEY,
    DNAME VARCHAR(20) NOT NULL
);

INSERT INTO DEPT_NO_ACTION
VALUES
(10, 'HR'),
(20, 'IT');


CREATE TABLE EMP_NO_ACTION
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20) NOT NULL,
    DNO INT REFERENCES DEPT_NO_ACTION(DNO)
        ON DELETE NO ACTION
);

INSERT INTO EMP_NO_ACTION
VALUES
(1, 'A', 10),
(2, 'B', 10),
(3, 'C', 20);


SELECT *
FROM DEPT_NO_ACTION;

SELECT *
FROM EMP_NO_ACTION;


/*
This DELETE will fail because
employees exist for department 10.
*/

DELETE FROM DEPT_NO_ACTION
WHERE DNO = 10;


/*
===========================================================
2. ON DELETE CASCADE
===========================================================

When parent record is deleted,
related child records are automatically deleted.
===========================================================
*/

CREATE TABLE DEPT_CASCADE
(
    DNO INT PRIMARY KEY,
    DNAME VARCHAR(20) NOT NULL
);

INSERT INTO DEPT_CASCADE
VALUES
(10, 'HR'),
(20, 'IT');


CREATE TABLE EMP_CASCADE
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20) NOT NULL,
    DNO INT REFERENCES DEPT_CASCADE(DNO)
        ON DELETE CASCADE
);

INSERT INTO EMP_CASCADE
VALUES
(1, 'A', 10),
(2, 'B', 10),
(3, 'C', 20);


SELECT *
FROM EMP_CASCADE;


/*
Deleting department 10
will automatically delete
employees belonging to department 10.
*/

DELETE FROM DEPT_CASCADE
WHERE DNO = 10;


SELECT *
FROM DEPT_CASCADE;

SELECT *
FROM EMP_CASCADE;


/*
===========================================================
3. ON DELETE SET NULL
===========================================================

When parent is deleted,
child records remain but Foreign Key becomes NULL.

Important:
Foreign Key column must allow NULL.
===========================================================
*/

CREATE TABLE PROJECT_SET_NULL
(
    PROJID INT PRIMARY KEY,
    PNAME VARCHAR(30) NOT NULL
);

INSERT INTO PROJECT_SET_NULL
VALUES
(1000, 'Project A'),
(1001, 'Project B');


CREATE TABLE EMP_SET_NULL
(
    EMPID INT PRIMARY KEY,
    ENAME VARCHAR(20) NOT NULL,
    PROJID INT NULL
        REFERENCES PROJECT_SET_NULL(PROJID)
        ON DELETE SET NULL
);

INSERT INTO EMP_SET_NULL
VALUES
(1, 'A', 1000),
(2, 'B', 1000),
(3, 'C', 1001);


SELECT *
FROM EMP_SET_NULL;


/*
Delete Project 1000.
Employees remain,
but PROJID becomes NULL.
*/

DELETE FROM PROJECT_SET_NULL
WHERE PROJID = 1000;


SELECT *
FROM PROJECT_SET_NULL;

SELECT *
FROM EMP_SET_NULL;


/*
===========================================================
4. ON DELETE SET DEFAULT
===========================================================

When parent is deleted,
child records remain and Foreign Key
is changed to the DEFAULT value.

Important:
The default value must exist in the parent table.
===========================================================
*/

CREATE TABLE DEPT_SET_DEFAULT
(
    DNO INT PRIMARY KEY,
    DNAME VARCHAR(20) NOT NULL
);

INSERT INTO DEPT_SET_DEFAULT
VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'DEFAULT DEPT');


CREATE TABLE EMP_SET_DEFAULT
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20) NOT NULL,
    DNO INT DEFAULT 30
        REFERENCES DEPT_SET_DEFAULT(DNO)
        ON DELETE SET DEFAULT
);

INSERT INTO EMP_SET_DEFAULT
VALUES
(1, 'A', 10),
(2, 'B', 10),
(3, 'C', 20);


SELECT *
FROM EMP_SET_DEFAULT;


/*
Delete department 10.
Employees remain,
but DNO becomes the default value 30.
*/

DELETE FROM DEPT_SET_DEFAULT
WHERE DNO = 10;


SELECT *
FROM DEPT_SET_DEFAULT;

SELECT *
FROM EMP_SET_DEFAULT;


/*
===========================================================
5. ACCOUNT → LOAN
Scenario: ON DELETE NO ACTION
===========================================================

Rule:
Account cannot be deleted if associated loans exist.
===========================================================
*/

CREATE TABLE ACCOUNTS_DAY24
(
    ACCNO INT PRIMARY KEY,
    ACTYPE CHAR(1),
    BAL MONEY
);

INSERT INTO ACCOUNTS_DAY24
VALUES
(100, 'S', 10000),
(101, 'S', 20000);


CREATE TABLE LOANS_DAY24
(
    LOANID INT PRIMARY KEY,
    LOANTYPE CHAR(1),
    AMT MONEY,
    ACCNO INT REFERENCES ACCOUNTS_DAY24(ACCNO)
        ON DELETE NO ACTION
);

INSERT INTO LOANS_DAY24
VALUES
(1, 'H', 30000, 100),
(2, 'C', 10000, 100);


/*
This should fail because
account 100 has loan records.
*/

DELETE FROM ACCOUNTS_DAY24
WHERE ACCNO = 100;


/*
===========================================================
6. ACCOUNT → TRANSACTIONS
Scenario: ON DELETE CASCADE
===========================================================

Rule:
If account is closed,
related transactions are deleted.
===========================================================
*/

CREATE TABLE ACCOUNTS_CASCADE
(
    ACCNO INT PRIMARY KEY,
    ACTYPE CHAR(1),
    BAL MONEY
);

INSERT INTO ACCOUNTS_CASCADE
VALUES
(100, 'S', 10000),
(101, 'S', 20000);


CREATE TABLE TRANSACTIONS_CASCADE
(
    TRID INT PRIMARY KEY,
    TTYPE CHAR(1),
    TAMT MONEY,
    ACCNO INT REFERENCES ACCOUNTS_CASCADE(ACCNO)
        ON DELETE CASCADE
);

INSERT INTO TRANSACTIONS_CASCADE
VALUES
(1, 'W', 2000, 100),
(2, 'D', 1000, 100),
(3, 'W', 500, 101);


SELECT *
FROM TRANSACTIONS_CASCADE;


/*
Delete account 100.
Related transactions will also be deleted.
*/

DELETE FROM ACCOUNTS_CASCADE
WHERE ACCNO = 100;


SELECT *
FROM ACCOUNTS_CASCADE;

SELECT *
FROM TRANSACTIONS_CASCADE;


/*
===========================================================
7. PROJECT → EMPLOYEE
Scenario: ON DELETE SET NULL
===========================================================

Rule:
When project is deleted,
employee remains but project assignment becomes NULL.
===========================================================
*/

CREATE TABLE PROJECTS_DAY24
(
    PROJID INT PRIMARY KEY,
    PNAME VARCHAR(30),
    CLIENT VARCHAR(30)
);

INSERT INTO PROJECTS_DAY24
VALUES
(1000, 'Project A', 'TATA'),
(1001, 'Project B', 'DBS');


CREATE TABLE EMP_PROJECT_DAY24
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20),
    PROJID INT NULL
        REFERENCES PROJECTS_DAY24(PROJID)
        ON DELETE SET NULL
);

INSERT INTO EMP_PROJECT_DAY24
VALUES
(1, 'A', 1000),
(2, 'B', 1001);


SELECT *
FROM EMP_PROJECT_DAY24;


/*
Complete Project 1000.
*/

DELETE FROM PROJECTS_DAY24
WHERE PROJID = 1000;


SELECT *
FROM EMP_PROJECT_DAY24;


/*
===========================================================
8. DEPARTMENT → EMPLOYEE
Scenario: ON DELETE SET DEFAULT
===========================================================

Rule:
When department is deleted,
employees move to the default department.
===========================================================
*/

CREATE TABLE DEPT_DEFAULT_DAY24
(
    DNO INT PRIMARY KEY,
    DNAME VARCHAR(30)
);

INSERT INTO DEPT_DEFAULT_DAY24
VALUES
(10, 'HR'),
(20, 'IT'),
(99, 'DEFAULT');


CREATE TABLE EMP_DEFAULT_DAY24
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20),
    DNO INT DEFAULT 99
        REFERENCES DEPT_DEFAULT_DAY24(DNO)
        ON DELETE SET DEFAULT
);

INSERT INTO EMP_DEFAULT_DAY24
VALUES
(1, 'A', 10),
(2, 'B', 10),
(3, 'C', 20);


/*
Delete department 10.
Employees will move to department 99.
*/

DELETE FROM DEPT_DEFAULT_DAY24
WHERE DNO = 10;


SELECT *
FROM EMP_DEFAULT_DAY24;


/*
===========================================================
9. DELETE RULE COMPARISON
===========================================================

NO ACTION
→ Parent delete blocked if child exists.

CASCADE
→ Parent deleted + child deleted.

SET NULL
→ Parent deleted + child FK becomes NULL.

SET DEFAULT
→ Parent deleted + child FK becomes DEFAULT.
===========================================================
*/


/*
===========================================================
10. PRACTICE QUESTIONS
===========================================================

Q1. Create Department and Employee tables using
    ON DELETE NO ACTION.

Q2. Create Department and Employee tables using
    ON DELETE CASCADE.

Q3. Create Project and Employee tables using
    ON DELETE SET NULL.

Q4. Create Department and Employee tables using
    ON DELETE SET DEFAULT.

Q5. Create Account and Loan tables where an account
    cannot be deleted if loans exist.

Q6. Create Account and Transaction tables where deleting
    an account also deletes its transactions.

Q7. Create Project and Employee tables where deleting
    a project sets employee PROJID to NULL.

Q8. Create Department and Employee tables where deleting
    a department moves employees to a default department.

Q9. Explain the difference between NO ACTION and CASCADE.

Q10. Explain the difference between SET NULL and
     SET DEFAULT.

Q11. What is the default Foreign Key DELETE behavior?

Q12. What condition is required for ON DELETE SET NULL?

Q13. What condition is required for ON DELETE SET DEFAULT?

===========================================================
DAY 24 COMPLETE
FOREIGN KEY DELETE RULES
===========================================================
*/ 
