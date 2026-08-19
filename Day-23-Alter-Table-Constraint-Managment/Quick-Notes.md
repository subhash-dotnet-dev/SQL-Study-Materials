DAY 23 — ALTER TABLE & CONSTRAINT MANAGEMENT
=============================================

1. WITH NOCHECK
----------------
=> WITH NOCHECK is used while adding a constraint to an existing table.

=> It does NOT validate existing data.

=> The constraint is enforced for new or modified data.

Syntax:
ALTER TABLE table_name
WITH NOCHECK
ADD CHECK(condition);

Example:
ALTER TABLE EMP
WITH NOCHECK
ADD CHECK(SAL >= 3000);


2. ADD CHECK CONSTRAINT
------------------------
=> CHECK constraint can be added to an existing table using ALTER TABLE.

Syntax:
ALTER TABLE table_name
ADD CHECK(condition);

Example:
ALTER TABLE EMP77
ADD CHECK(SAL >= 3000);


3. ADD FOREIGN KEY
------------------
=> FOREIGN KEY can be added to an existing table using ALTER TABLE.

Syntax:
ALTER TABLE child_table
ADD FOREIGN KEY(column_name)
REFERENCES parent_table(column_name);

Example:
ALTER TABLE EMP77
ADD FOREIGN KEY(DNO)
REFERENCES DEPT(DEPTNO);


4. ADD UNIQUE CONSTRAINT
------------------------
=> UNIQUE constraint can be added to an existing table.

Syntax:
ALTER TABLE table_name
ADD UNIQUE(column_name);

Example:
ALTER TABLE EMP77
ADD UNIQUE(EMAILID);


5. ALTER COLUMN
---------------
=> ALTER COLUMN is used to modify an existing column definition.

Example:
ALTER TABLE EMP77
ALTER COLUMN ENAME VARCHAR(10) NOT NULL;

=> This changes the column from NULL allowed to NOT NULL.

Important:
=> Existing data must satisfy the new definition before changing a
   column to NOT NULL.


6. DROP CONSTRAINT
------------------
=> DROP CONSTRAINT is used to remove an existing constraint.

Syntax:
ALTER TABLE table_name
DROP CONSTRAINT constraint_name;

Example:
ALTER TABLE EMP77
DROP CONSTRAINT CK_EMP77_SAL;

=> The constraint name must be specified correctly.


7. CONSTRAINT DEPENDENCY
------------------------
=> A Primary Key can be referenced by a Foreign Key.

=> The table containing the Primary Key is the PARENT table.

=> The table containing the Foreign Key is the CHILD table.

Example:

PARENT TABLE
DEPT
DEPTNO (PK)
      ↓
      ↓
EMP
DNO (FK)


8. PRIMARY KEY DEPENDENCY
-------------------------
=> A Primary Key cannot be dropped while it is referenced
   by a Foreign Key.

=> The referenced parent table cannot be dropped while a
   Foreign Key depends on it.

=> The referenced parent table cannot be truncated while a
   Foreign Key depends on it.

Example:

DEPT
PK → DEPTNO
      ↓
      ↓
EMP
FK → DNO


9. DROP TABLE DEPENDENCY
------------------------
=> If another table has a Foreign Key referencing a table,
   the referenced parent table cannot be dropped directly.

Example:
DROP TABLE DEPT;

=> Error if EMP.DNO references DEPT.DEPTNO.


10. TRUNCATE TABLE DEPENDENCY
-----------------------------
=> A parent table cannot be truncated while it is referenced
   by a Foreign Key.

Example:
TRUNCATE TABLE DEPT;

=> Error if EMP.DNO references DEPT.DEPTNO.


11. QUICK REVISION
------------------
WITH NOCHECK
→ Existing data is not validated.

ADD CHECK
→ Adds CHECK constraint to existing table.

ADD FOREIGN KEY
→ Establishes relationship with parent table.

ADD UNIQUE
→ Prevents duplicate values.

ALTER COLUMN
→ Changes column definition.

DROP CONSTRAINT
→ Removes a constraint.

PRIMARY KEY + FOREIGN KEY
→ Creates dependency between parent and child tables.

DROP / TRUNCATE
→ Can be restricted because of Foreign Key dependency.


12. IMPORTANT INTERVIEW POINTS
------------------------------
Q. Does WITH NOCHECK validate existing rows?
A. No.

Q. What happens with new data after WITH NOCHECK?
A. The constraint is enforced.

Q. Which command is used to remove a constraint?
A. ALTER TABLE ... DROP CONSTRAINT.

Q. Can a referenced Primary Key be dropped directly?
A. No, not while a Foreign Key references it.

Q. Can a referenced parent table be dropped?
A. No, while a Foreign Key depends on it.

Q. Can a referenced parent table be truncated?
A. No, while it is referenced by a Foreign Key.


DAY 23 KEY TAKEAWAY
===================
ALTER TABLE helps manage constraints on existing tables.

WITH NOCHECK
→ Skip validation of existing data.

ADD
→ Add constraints.

ALTER COLUMN
→ Modify column definition.

DROP CONSTRAINT
→ Remove constraints.

FOREIGN KEY DEPENDENCY
→ Can restrict DROP and TRUNCATE operations.
