-- =============================================
-- Day 05 - SQL Server Data Types
-- =============================================

-- Integer Data Types
DECLARE @TinyIntValue TINYINT = 10;
DECLARE @SmallIntValue SMALLINT = 100;
DECLARE @IntValue INT = 1000;
DECLARE @BigIntValue BIGINT = 100000;

-- Numeric Data Types
DECLARE @NumericValue NUMERIC(10,2) = 1250.50;
DECLARE @DecimalValue DECIMAL(10,2) = 4500.75;
DECLARE @FloatValue FLOAT = 123.456;

-- Currency Data Types
DECLARE @SmallMoneyValue SMALLMONEY = 100.50;
DECLARE @MoneyValue MONEY = 5000.75;

-- Date / Time Data Types
DECLARE @DateValue DATE = '2026-08-13';
DECLARE @TimeValue TIME = '10:30:00';
DECLARE @DateTimeValue DATETIME = '2026-08-13 10:30:00';

-- Character Data Types
DECLARE @CharValue CHAR(10) = 'Subhash';
DECLARE @VarcharValue VARCHAR(50) = 'Subhash Yadav';
DECLARE @NcharValue NCHAR(10) = N'Subhash';
DECLARE @NvarcharValue NVARCHAR(50) = N'Subhash Yadav';

-- Display Values
SELECT
    @TinyIntValue AS TinyIntValue,
    @SmallIntValue AS SmallIntValue,
    @IntValue AS IntValue,
    @BigIntValue AS BigIntValue,
    @NumericValue AS NumericValue,
    @DecimalValue AS DecimalValue,
    @FloatValue AS FloatValue,
    @SmallMoneyValue AS SmallMoneyValue,
    @MoneyValue AS MoneyValue,
    @DateValue AS DateValue,
    @TimeValue AS TimeValue,
    @DateTimeValue AS DateTimeValue,
    @CharValue AS CharValue,
    @VarcharValue AS VarcharValue,
    @NcharValue AS NcharValue,
    @NvarcharValue AS NvarcharValue;
