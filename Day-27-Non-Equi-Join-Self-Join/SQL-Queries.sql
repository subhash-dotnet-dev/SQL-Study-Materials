/*
==========================================================
SQL LEARNING JOURNEY — DAY 27
TOPIC: NON-EQUI JOIN & SELF JOIN
DATABASE: SQL SERVER
==========================================================
*/


/*
==========================================================
1. NON-EQUI JOIN
==========================================================
Display employee name, salary and grade.
==========================================================
*/

SELECT e.ename,
       e.sal,
       s.grade
FROM emp AS e
INNER JOIN salgrade AS s
    ON e.sal BETWEEN s.losal AND s.hisal;


/*
==========================================================
2. DISPLAY GRADE 4 EMPLOYEES
==========================================================
*/

SELECT e.ename,
       e.sal,
       s.grade
FROM emp AS e
INNER JOIN salgrade AS s
    ON e.sal BETWEEN s.losal AND s.hisal
WHERE s.grade = 4;


/*
==========================================================
3. MULTI-TABLE JOIN
==========================================================
Display employee name, department name and grade.
==========================================================
*/

SELECT e.ename,
       d.dname,
       s.grade
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno
INNER JOIN salgrade AS s
    ON e.sal BETWEEN s.losal AND s.hisal;


/*
==========================================================
4. SELF JOIN
==========================================================
Display employee name and manager name.
==========================================================
*/

SELECT x.ename,
       y.ename AS manager
FROM emp AS x
INNER JOIN emp AS y
    ON x.mgr = y.empno;


/*
==========================================================
5. EMPLOYEES REPORTING TO BLAKE
==========================================================
*/

SELECT x.ename,
       y.ename AS manager
FROM emp AS x
INNER JOIN emp AS y
    ON x.mgr = y.empno
WHERE y.ename = 'BLAKE';


/*
==========================================================
6. DISPLAY BLAKE'S MANAGER
==========================================================
*/

SELECT x.ename,
       y.ename AS manager
FROM emp AS x
INNER JOIN emp AS y
    ON x.mgr = y.empno
WHERE x.ename = 'BLAKE';


/*
==========================================================
7. EMPLOYEES EARNING MORE THAN THEIR MANAGER
==========================================================
*/

SELECT x.ename,
       x.sal,
       y.ename AS manager,
       y.sal AS mgrsal
FROM emp AS x
INNER JOIN emp AS y
    ON x.mgr = y.empno
WHERE x.sal > y.sal;


/*
==========================================================
8. EMPLOYEES JOINED BEFORE THEIR MANAGER
==========================================================
*/

SELECT x.ename,
       x.hiredate,
       y.ename AS manager,
       y.hiredate AS mgrhire
FROM emp AS x
INNER JOIN emp AS y
    ON x.mgr = y.empno
WHERE x.hiredate < y.hiredate;


/*
==========================================================
9. EMPLOYEES EARNING THE SAME SALARY
==========================================================
*/

SELECT x.ename AS emp1,
       y.ename AS emp2,
       x.sal
FROM emp AS x
INNER JOIN emp AS y
    ON x.sal = y.sal
WHERE x.empno <> y.empno;


/*
==========================================================
10. EMPLOYEES JOINED ON THE SAME DAY
==========================================================
*/

SELECT x.ename AS emp1,
       y.ename AS emp2,
       x.hiredate
FROM emp AS x
INNER JOIN emp AS y
    ON x.hiredate = y.hiredate
WHERE x.empno <> y.empno;


/*
==========================================================
11. DISPLAY EMPLOYEE DETAILS WITH SAME EMPLOYEE MATCH
==========================================================
*/

SELECT x.empno,
       x.ename,
       x.mgr,
       y.empno,
       y.ename,
       y.mgr
FROM emp AS x
INNER JOIN emp AS y
    ON x.empno = y.empno;


/*
==========================================================
12. TEAM SELF JOIN
==========================================================
Display unique team combinations.
==========================================================
*/

SELECT A.COUNTRY + ' VS ' + B.COUNTRY AS MATCHUP
FROM TEAMS AS A
INNER JOIN TEAMS AS B
    ON A.ID < B.ID;


/*
==========================================================
13. TEAM SELF JOIN — UNIQUE PAIRS
==========================================================
IND VS AUS
IND VS ENG
AUS VS ENG
==========================================================
*/

SELECT A.ID AS TEAM_A_ID,
       A.COUNTRY AS TEAM_A,
       B.ID AS TEAM_B_ID,
       B.COUNTRY AS TEAM_B
FROM TEAMS AS A
INNER JOIN TEAMS AS B
    ON A.ID < B.ID;


/*
==========================================================
14. CUSTOMER / PRODUCT / ORDER / DISCOUNT
NON-EQUI JOIN PRACTICE
==========================================================
Display order, customer, product, quantity, discount
percentage and final amount.
==========================================================
*/

SELECT o.ordid,
       o.orddate,
       o.deldate,
       c.name AS cname,
       'HYD' AS addr,
       p.pname,
       p.price,
       od.qty,
       d.pct AS dis_pct,
       (p.price * od.qty)
       - ((p.price * od.qty) * d.pct / 100) AS amount
FROM ORDERS AS o
JOIN CUSTOMER AS c
    ON o.cid = c.cid
JOIN ORDER_DETAILS AS od
    ON o.ordid = od.ordid
JOIN PRODUCTS AS p
    ON od.prodid = p.prodid
JOIN discounts AS d
    ON (p.price * od.qty) BETWEEN d.lamt AND d.hamt
WHERE o.ordid = 1000;


/*
==========================================================
15. QUICK NON-EQUI JOIN EXAMPLE
==========================================================
Salary must fall between LOW salary and HIGH salary.
==========================================================
*/

SELECT e.ename,
       e.sal,
       s.grade,
       s.losal,
       s.hisal
FROM emp AS e
INNER JOIN salgrade AS s
    ON e.sal BETWEEN s.losal AND s.hisal;


/*
==========================================================
16. SELF JOIN — EMPLOYEE / MANAGER DETAILS
==========================================================
*/

SELECT x.empno AS employee_no,
       x.ename AS employee_name,
       x.sal AS employee_salary,
       y.empno AS manager_no,
       y.ename AS manager_name,
       y.sal AS manager_salary
FROM emp AS x
INNER JOIN emp AS y
    ON x.mgr = y.empno;


/*
==========================================================
DAY 27 QUICK REVISION
==========================================================

NON-EQUI JOIN
→ JOIN using comparison/range conditions.

SELF JOIN
→ Same table joined with itself.

BETWEEN
→ Range-based matching.

MGR = EMPNO
→ Employee → Manager relationship.

x.empno <> y.empno
→ Prevents comparing a row with itself.

A.ID < B.ID
→ Generates unique team combinations.

==========================================================
*/
