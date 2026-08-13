-- Day 06 - SQL Server Data Types Practice

-- Character
DECLARE @Name CHAR(10) = 'Subhash';
DECLARE @Email VARCHAR(50) = 'subhash@example.com';

-- Unicode
DECLARE @Message NVARCHAR(100) = N'Hello SQL';

-- Integer
DECLARE @Age TINYINT = 25;
DECLARE @EmployeeId INT = 1001;

-- Decimal
DECLARE @Salary DECIMAL(10,2) = 50000.55;

-- Currency
DECLARE @Balance MONEY = 75000.50;

-- Date & Time
DECLARE @DOB DATE = '2002-04-07';
DECLARE @LoginTime TIME = '09:30:00';
DECLARE @TransactionDate DATETIME = '2025-04-07 10:00:00';

-- Binary
DECLARE @Photo VARBINARY(MAX);

SELECT
    @Name AS Name,
    @Email AS Email,
    @Message AS Message,
    @Age AS Age,
    @EmployeeId AS EmployeeId,
    @Salary AS Salary,
    @Balance AS Balance,
    @DOB AS DOB,
    @LoginTime AS LoginTime,
    @TransactionDate AS TransactionDate;
