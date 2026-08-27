<div align="center">

# 🗄️ Day 40 — SQL Server: WHILE LOOP & STRING PROGRAMMING

### WHILE LOOP • DATE FUNCTIONS • STRING TRAVERSAL • REVERSE • PALINDROME

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 40 focuses on **WHILE LOOP and String Programming in T-SQL**.

The `WHILE` loop is used to repeatedly execute a block of T-SQL statements while a specified condition remains **TRUE**.

Along with loops, this day focuses on practical programming problems involving **dates, strings, character traversal, reverse strings, and palindrome checking**.

### Main Topics

- `WHILE` Loop
- Loop Initialization
- Loop Condition
- Variable Increment / Decrement
- Date Programming
- `DATEADD()`
- `DATENAME()`
- `LEN()`
- `SUBSTRING()`
- String Traversal
- Character-by-Character Printing
- Incremental String Pattern
- Reverse String
- Palindrome Checking
- Practical T-SQL Programs

---

## 🎯 Learning Objectives

By the end of Day 40, the focus was on understanding:

- What is a `WHILE` loop?
- How `WHILE` loops work in T-SQL
- How to initialize loop variables
- How to use loop conditions
- How to increment and decrement variables
- How to work with dates using T-SQL
- How to identify Saturdays and Sundays
- How to use `LEN()`
- How to use `SUBSTRING()`
- How to traverse a string character by character
- How to print incremental string patterns
- How to reverse a string
- What is a palindrome?
- How to check whether a string is a palindrome
- How loops are used in practical T-SQL programming

---

# 🔄 WHILE LOOP

A `WHILE` loop repeatedly executes statements as long as the specified condition is **TRUE**.

```text
START
  ↓
INITIALIZE VARIABLE
  ↓
CHECK CONDITION
  ↓
TRUE
  ↓
EXECUTE STATEMENTS
  ↓
UPDATE VARIABLE
  ↓
CHECK CONDITION
  ↺
FALSE
  ↓
END
