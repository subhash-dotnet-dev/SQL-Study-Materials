# Day 10 — Interview Questions

## 1. What is the LIKE operator?

LIKE operator is used for pattern comparison.

```sql
WHERE COLNAME LIKE 'PATTERN'



LIKE        → Pattern Comparison
%           → 0 or Many Characters
_           → Exactly 1 Character
[akv]%      → Starts with a, k or v
[a-p]%      → Starts between a and p
[aeiou]%    → Starts with a vowel
ESCAPE      → Search % or _
IS NULL     → NULL Check
IS NOT NULL → Non-NULL Check
