# Day 06 — Quick Notes

## Character Types

CHAR(n) → Fixed + ASCII
VARCHAR(n) → Variable + ASCII
VARCHAR(MAX) → Variable + Up to 2GB

NCHAR(n) → Fixed + Unicode
NVARCHAR(n) → Variable + Unicode
NVARCHAR(MAX) → Variable + Unicode + Up to 2GB

## Integer Types

TINYINT → 1 byte → 0–255
SMALLINT → 2 bytes
INT → 4 bytes
BIGINT → 8 bytes

Integer = Whole numbers

## Numeric Types

NUMERIC(p) → Whole numbers
DECIMAL(p,s) → Decimal values
NUMERIC(p,s) → Decimal values

p = Total digits
s = Digits after decimal
Maximum precision = 38

Example:
DECIMAL(7,2) → 5000.55

## Currency

SMALLMONEY → 4 bytes
MONEY → 8 bytes

## Date & Time

DATE → Date
TIME → Time
DATETIME → Date + Time

## Binary

BINARY(n) → Fixed binary
VARBINARY(n) → Variable binary
VARBINARY(MAX) → Variable binary + Up to 2GB
