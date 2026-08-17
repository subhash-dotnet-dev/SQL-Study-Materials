-- ============================================================
-- Day 15 — SQL Server Character / String Functions
-- Topic: Character / String Functions
-- ============================================================

-- Functions Covered:
-- UPPER(), LOWER(), LEN(), LEFT(), RIGHT()
-- SUBSTRING(), CHARINDEX(), REPLICATE()
-- REPLACE(), TRANSLATE(), STUFF()

-- NOTE:
-- Queries using EMP, CUST, ACCOUNTS, and CUSTOMER assume
-- those tables already exist in your database.
-- ============================================================

-- ============================================================
-- 1. UPPER()
-- Convert text to uppercase
-- ============================================================

SELECT UPPER('Subhash') AS UpperName;

-- Using an existing EMP table
SELECT EMPNO,
ENAME,
UPPER(ENAME) AS UpperName
FROM EMP;

-- ============================================================
-- 2. LOWER()
-- Convert text to lowercase
-- ============================================================

SELECT LOWER('SUBHASH') AS LowerName;

SELECT EMPNO,
ENAME,
LOWER(ENAME) AS LowerName,
SAL
FROM EMP;

-- ============================================================
-- 3. LEN()
-- Find the number of characters
-- ============================================================

SELECT LEN('Subhash') AS NameLength;

SELECT LEN('Subhash Yadav') AS FullNameLength;

-- Find employees whose names contain exactly 4 characters
SELECT *
FROM EMP
WHERE LEN(ENAME) = 4;

-- ============================================================
-- 4. LEFT()
-- Extract characters from the left
-- ============================================================

SELECT LEFT('Subhash Yadav', 7) AS FirstPart;

-- Display first 3 characters of employee names
SELECT EMPNO,
ENAME,
LEFT(ENAME, 3) AS ShortName
FROM EMP;

-- Find employees whose names start with 'S'
SELECT *
FROM EMP
WHERE LEFT(ENAME, 1) = 'S';

-- ============================================================
-- 5. RIGHT()
-- Extract characters from the right
-- ============================================================

SELECT RIGHT('Subhash Yadav', 5) AS LastPart;

-- Display last 3 characters of employee names
SELECT EMPNO,
ENAME,
RIGHT(ENAME, 3) AS LastCharacters
FROM EMP;

-- Find employees whose names end with 'S'
SELECT *
FROM EMP
WHERE RIGHT(ENAME, 1) = 'S';

-- ============================================================
-- 6. SUBSTRING()
-- Extract characters from a specific position
-- ============================================================

SELECT SUBSTRING('Subhash Yadav', 1, 7) AS FirstName;

SELECT SUBSTRING('Subhash Yadav', 9, 5) AS LastName;

-- Extract first 3 characters from employee names
SELECT EMPNO,
ENAME,
SUBSTRING(ENAME, 1, 3) AS ShortName
FROM EMP;

-- ============================================================
-- 7. CHARINDEX()
-- Find the position of a character/string
-- ============================================================

SELECT CHARINDEX(' ', 'Subhash Yadav') AS SpacePosition;

SELECT CHARINDEX('a', 'Subhash Yadav') AS CharacterPosition;

-- Search starting from a specific position
SELECT CHARINDEX('a', 'Subhash Yadav', 5) AS CharacterPosition;

-- ============================================================
-- 8. CHARINDEX() + SUBSTRING()
-- Extract First Name and Last Name
-- ============================================================

-- Assumption:
-- CUST table contains:
-- CID
-- CNAME
--------

-- Example:
-- 10 | SACHIN TENDULKAR
-- 11 | VIRAT KOHLI

SELECT CID,
SUBSTRING(CNAME, 1, CHARINDEX(' ', CNAME) - 1) AS FNAME,
SUBSTRING(
CNAME,
CHARINDEX(' ', CNAME) + 1,
LEN(CNAME)
) AS LNAME
FROM CUST;

-- ============================================================
-- 9. REPLICATE()
-- Repeat a character/string
-- ============================================================

SELECT REPLICATE('*', 5) AS RepeatedCharacters;

SELECT REPLICATE('-', 10) AS Separator;

-- Display employee name with a repeated character based
-- on the length of salary
SELECT ENAME,
REPLICATE('*', LEN(SAL)) AS SalaryMask
FROM EMP;

-- ============================================================
-- 10. REPLACE()
-- Replace matching text
-- ============================================================

SELECT REPLACE(
'SQL Server',
'Server',
'Database'
) AS ModifiedText;

-- Replace a character in a string
SELECT REPLACE(
'Subhash',
'h',
'H'
) AS ModifiedName;

-- Example of text cleaning
SELECT REPLACE(
'SQL@Server#2026',
'@',
' '
) AS CleanText;

-- ============================================================
-- 11. TRANSLATE()
-- Character-to-character transformation
-- ============================================================

SELECT TRANSLATE(
'ABCD',
'ABCD',
'1234'
) AS TranslatedText;

-- Character mapping:
-- A -> 1
-- B -> 2
-- C -> 3
-- D -> 4

-- Example: replace selected special characters
SELECT TRANSLATE(
'@#HELLO!$',
'@#!$',
'    '
) AS CleanText;

-- ============================================================
-- 12. STUFF()
-- Replace characters based on position and length
-- ============================================================

SELECT STUFF(
'9431737280',
4,
4,
'XXXX'
) AS MaskedNumber;

-- Another example
SELECT STUFF(
'Subhash Kumar',
9,
5,
'Yadav'
) AS ModifiedName;

-- ============================================================
-- 13. String Concatenation (+)
-- Combine multiple strings
-- ============================================================

SELECT 'Subhash' + ' ' + 'Yadav' AS FullName;

-- ============================================================
-- 14. Generate Employee Email IDs
-- Assumption: EMP table contains EMPNO and ENAME
-- ============================================================

SELECT EMPNO,
ENAME,
LEFT(ENAME, 3)
+ LEFT(CAST(EMPNO AS VARCHAR(10)), 3)
+ '@tcs.com' AS EMAILID
FROM EMP;

-- ============================================================
-- 15. Add Email Column to EMP Table
-- OPTIONAL: Execute only if EMAILID column does not exist.
-- ============================================================

-- ALTER TABLE EMP
-- ADD EMAILID VARCHAR(50);

-- ============================================================
-- 16. Store Generated Email IDs
-- OPTIONAL: Execute only after creating EMAILID column.
-- ============================================================

-- UPDATE EMP
-- SET EMAILID =
--     LEFT(ENAME, 3)
--     + LEFT(CAST(EMPNO AS VARCHAR(10)), 3)
--     + '@tcs.com';

-- Verify generated email IDs
-- SELECT EMPNO, ENAME, EMAILID
-- FROM EMP;

-- ============================================================
-- 17. Account Number Masking
-- Assumption: ACCOUNTS table contains ACCNO
-- ============================================================

SELECT REPLICATE('X', 4)
+ RIGHT(CAST(ACCNO AS VARCHAR(50)), 4) AS MASKED_ACCOUNT
FROM ACCOUNTS;

-- ============================================================
-- 18. Credit Card Number Masking
-- Assumption: CUSTOMER table contains CREDIT_CARD_NO
-- ============================================================

SELECT LEFT(CREDIT_CARD_NO, 2)
+ REPLICATE('X', 3)
+ RIGHT(CREDIT_CARD_NO, 3) AS MASKED_CARD
FROM CUSTOMER;

-- ============================================================
-- 19. Compare LIKE with LEFT()
-- Employees whose names start with 'S'
-- ============================================================

-- Using LIKE
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- Using LEFT()
SELECT *
FROM EMP
WHERE LEFT(ENAME, 1) = 'S';

-- ============================================================
-- 20. Compare LIKE with RIGHT()
-- Employees whose names end with 'S'
-- ============================================================

-- Using LIKE
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

-- Using RIGHT()
SELECT *
FROM EMP
WHERE RIGHT(ENAME, 1) = 'S';

-- ============================================================
-- 21. Names Starting and Ending with Same Character
-- ============================================================

SELECT *
FROM EMP
WHERE LEFT(ENAME, 1) = RIGHT(ENAME, 1);

-- ============================================================
-- 22. Names Starting and Ending with Same 3 Characters
-- ============================================================

SELECT *
FROM EMP
WHERE LEFT(ENAME, 3) = RIGHT(ENAME, 3);

-- ============================================================
-- 23. Combined String Function Practice
-- Display uppercase first 3 characters of employee names
-- ============================================================

SELECT EMPNO,
ENAME,
UPPER(LEFT(ENAME, 3)) AS NAME_PREFIX
FROM EMP;

-- ============================================================
-- 24. Combined String Function Practice
-- Display lowercase employee names and their lengths
-- ============================================================

SELECT EMPNO,
LOWER(ENAME) AS LOWER_NAME,
LEN(ENAME) AS NAME_LENGTH
FROM EMP;

-- ============================================================
-- 25. Final Practical Query
-- Display employee name, first 3 characters, last 3 characters,
-- and name length
-- ============================================================

SELECT EMPNO,
ENAME,
LEFT(ENAME, 3) AS FIRST_3,
RIGHT(ENAME, 3) AS LAST_3,
LEN(ENAME) AS NAME_LENGTH
FROM EMP;

-- ============================================================
-- Day 15 Practice Complete
-- LEARN → PRACTICE → DOCUMENT → IMPROVE
-- ============================================================
